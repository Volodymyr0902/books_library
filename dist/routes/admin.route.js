"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const express_basic_auth_1 = __importDefault(require("express-basic-auth"));
const multer_1 = require("../utils/multer/multer");
const admin_controller_1 = require("../controllers/admin.controller");
const dotenv_1 = __importDefault(require("dotenv"));
const books_controller_1 = require("../controllers/books.controller");
const Validator_1 = require("../utils/validators/Validator");
dotenv_1.default.config();
const login = process.env.LOGIN || "";
const pass = process.env.PASS || "";
const router = express_1.default.Router();
router.use(admin_controller_1.AdminController.preventCache);
router.get("/logout", admin_controller_1.AdminController.logOut);
router.use((0, express_basic_auth_1.default)({
    users: { [login]: pass },
    challenge: true
}));
router.route("/")
    .get(Validator_1.Validator.validateGetBooks, Validator_1.Validator.validate, books_controller_1.BooksController.getBooks)
    .post(admin_controller_1.AdminController.generateID, multer_1.upload.single("new-img-input"), Validator_1.Validator.validateAddBookManyAuthors, Validator_1.Validator.validate, admin_controller_1.AdminController.addBook);
router.delete("/:id", Validator_1.Validator.validateDeleteBook, Validator_1.Validator.validate, admin_controller_1.AdminController.deleteBook);
exports.default = router;
