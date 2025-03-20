"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const multer_1 = __importDefault(require("multer"));
const uuid_1 = require("uuid");
const path_1 = __importDefault(require("path"));
const express_basic_auth_1 = __importDefault(require("express-basic-auth"));
const dbHandler_1 = __importDefault(require("../db/dbHandler"));
const books_controllers_1 = require("../controllers/books-controllers");
const booksLimit = 4;
const router = express_1.default.Router();
const storage = multer_1.default.diskStorage({
    destination: "./public/common/images",
    filename: (req, file, cb) => {
        cb(null, req.newBookID + path_1.default.extname(file.originalname));
    }
});
const upload = (0, multer_1.default)({ storage });
const generateID = (req, res, next) => {
    req.newBookID = (0, uuid_1.v4)();
    next();
};
router.use((req, res, next) => {
    res.set("Cache-Control", "no-store, no-cache, must-revalidate, proxy-revalidate");
    res.set("Pragma", "no-cache");
    res.set("Expires", "0");
    res.set("Surrogate-Control", "no-store");
    next();
});
router.get("/logout", (req, res) => {
    res.status(401).end();
});
router.use((0, express_basic_auth_1.default)({
    users: { "admin": "12345" },
    challenge: true
}));
router.get("/", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    let { offset = 0, search, author, year = 0 } = req.query;
    offset = +offset;
    if (search) {
        search = String(search).trim().toLowerCase();
        if (search.length > 0)
            search = '%' + search + '%';
    }
    if (year)
        year = +year;
    if (author) {
        author = String(author).trim().toLowerCase();
        if (author.length > 0)
            author = '%' + author + '%';
    }
    const [result] = yield (0, books_controllers_1.getBookTotalNum)(search || "%%", author || "%%", year || "%%");
    const pages = Math.ceil(result[0].total / booksLimit) - 1;
    const searchQuery = `SELECT books.id as id, title, name, year, clicks FROM books INNER JOIN authors ON books.author_id = authors.id WHERE lower(title) LIKE ? AND lower(name) LIKE ? AND year LIKE ? LIMIT ?, ?`;
    let [books] = yield dbHandler_1.default.pool.query(searchQuery, [search || "%%", author || "%%", year || "%%", offset * booksLimit, booksLimit]);
    res.render("admin-page", { books, offset, pages });
}));
router.post("/", generateID, upload.single("new-img-input"), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { "new-title": title, "new-year": year, "new-author-1": author, description } = req.body;
    let authorID;
    const selectAuthorSQL = `SELECT id FROM authors WHERE name = ?`;
    const [authorRes] = yield dbHandler_1.default.pool.query(selectAuthorSQL, [author]);
    if (authorRes.length > 0) {
        authorID = authorRes[0].id;
    }
    else {
        authorID = (0, uuid_1.v4)();
        const insertAuthorSQL = `INSERT INTO authors VALUES (?, ?)`;
        const [insertAuthorRes] = yield dbHandler_1.default.pool.query(insertAuthorSQL, [authorID, author]);
        if (insertAuthorRes.affectedRows === 0) {
            res.status(500).json({ err: "Failed to insert an author" });
            return;
        }
    }
    const insertBookSQL = `INSERT INTO books (id, title, author_id, year, pages, isbn, description) VALUES (?, ?, ?, ?, ?, ?, ?)`;
    const [insertBookRes] = yield dbHandler_1.default.pool.query(insertBookSQL, [req.newBookID, title, authorID, year, 444, "12-34-567", description]);
    if (insertBookRes.affectedRows === 0) {
        res.status(500).json({ err: "Failed to insert a book" });
    }
    res.redirect(req.originalUrl);
}));
router.delete("/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const sql = `DELETE FROM books WHERE id = ?`;
    const [result] = yield dbHandler_1.default.pool.query(sql, [id]);
    console.log(result);
    if (result.affectedRows === 1) {
        res.json({ ok: true });
        return;
    }
    res.status(404).json({ ok: false });
}));
exports.default = router;
