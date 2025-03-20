"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const books_controller_1 = require("../controllers/books.controller");
const router = express_1.default.Router();
router.get('/', books_controller_1.BooksController.getBooks);
router.route("/books/:id")
    .get(books_controller_1.BooksController.getSingleBook)
    .post(books_controller_1.BooksController.incrementStats);
exports.default = router;
