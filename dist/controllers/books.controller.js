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
Object.defineProperty(exports, "__esModule", { value: true });
exports.BooksController = void 0;
const books_model_1 = require("../models/books.model");
const validator_1 = require("../services/validators/validator");
class BooksController {
    static getBooks(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const view = req.originalUrl.includes("admin") ? "admin-page" : "books-page";
                const limit = req.originalUrl.includes("admin") ? 4 : 20;
                let { offset = 0, search = '', author = '', year = '' } = req.query;
                year = String(year).trim();
                if (!validator_1.Validator.validateYear(year))
                    next(new Error("Invalid year"));
                offset = +offset;
                search = String(search).trim().toLowerCase();
                author = String(author).trim().toLowerCase();
                const books = req.originalUrl.includes("admin")
                    ? yield books_model_1.BooksModel.getBooksComplete(offset, search, author, year, limit)
                    : yield books_model_1.BooksModel.getBooksPreview(offset, search, author, year, limit);
                for (let book of books) {
                    if (!book.name)
                        book = yield books_model_1.BooksModel.convertAuthorIdsToNames(yield books_model_1.BooksModel.addAuthorIdsToBook(book));
                }
                const total = yield books_model_1.BooksModel.getBookTotalNum(search, author, year);
                const pages = Math.ceil(total / limit) - 1;
                return res.render(view, { books, offset, search, total, pages });
            }
            catch (e) {
                next(e);
            }
        });
    }
    static getSingleBook(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            let book = yield books_model_1.BooksModel.getSingleBook(id);
            if (!book.name)
                book = yield books_model_1.BooksModel.convertAuthorIdsToNames(yield books_model_1.BooksModel.addAuthorIdsToBook(book));
            res.render("book-page", { book });
        });
    }
    static incrementStats(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
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
                throw new Error("Invalid action");
            }
            const oldStat = yield books_model_1.BooksModel.getStats(id, statCol);
            if (yield books_model_1.BooksModel.incrementStats(id, statCol)) {
                res.json(oldStat);
            }
            else {
                next(new Error("Failed to increment statistics"));
            }
        });
    }
}
exports.BooksController = BooksController;
