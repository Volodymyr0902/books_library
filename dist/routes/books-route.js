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
const dbHandler_1 = __importDefault(require("../db/dbHandler"));
const books_controllers_1 = require("../controllers/books-controllers");
const booksLimit = 20;
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    let { offset = 0, search, author, year = 0 } = req.query;
    let left, query;
    offset = +offset;
    if (search) {
        search = String(search).trim().toLowerCase();
        if (search.length > 0) {
            query = search;
            search = '%' + search + '%';
        }
    }
    if (year) {
        year = +year;
    }
    if (author) {
        author = String(author).trim().toLowerCase();
        if (author.length > 0)
            author = '%' + author + '%';
    }
    const [result] = yield (0, books_controllers_1.getBookTotalNum)(search || "%%", author || "%%", year || "%%");
    const total = result[0].total;
    const searchQuery = `SELECT books.id, title, name FROM books INNER JOIN authors ON books.author_id = authors.id WHERE lower(title) LIKE ? AND lower(name) LIKE ? AND year LIKE ? LIMIT ?, ?`;
    const [books] = yield dbHandler_1.default.pool.query(searchQuery, [search || "%%", author || "%%", year || "%%", offset * booksLimit, booksLimit + 1]);
    // Make sure items are < 20.
    if (books.length === booksLimit + 1) {
        books.pop();
        left = true;
    }
    return res.render("books-page", { books, offset, left, query, total });
}));
router.get("/books/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const searchQuery = `SELECT books.id, title, year, pages, isbn, description, name FROM books INNER JOIN authors ON books.author_id = authors.id WHERE books.id = ?`;
    const [book] = (yield dbHandler_1.default.pool.query(searchQuery, [id]))[0];
    res.render("book-page", { book });
}));
router.post("/books/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { action } = req.body;
    let statCol;
    if (action === "view") {
        statCol = "views";
    }
    else if (action === "click") {
        statCol = "clicks";
    }
    else {
        res.status(500).json({ status: "error" });
        return;
    }
    const selQuery = `SELECT ${statCol} FROM books WHERE books.id = ?`;
    const [oldStat] = (yield dbHandler_1.default.pool.query(selQuery, [id]))[0];
    const updQuery = `UPDATE books SET ${statCol} = ? WHERE books.id = ?`;
    const [updRes] = yield dbHandler_1.default.pool.query(updQuery, [oldStat[statCol] + 1, id]);
    if (updRes.affectedRows === 1) {
        res.json(oldStat);
    }
}));
exports.default = router;
