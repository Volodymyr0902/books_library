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
const express_validator_1 = require("express-validator");
const HTTPError_1 = require("../utils/error-handler/HTTPError");
class BooksController {
    static getBooks(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            var _a;
            try {
                const view = req.originalUrl.includes("admin") ? "admin-page" : "books-page";
                const limit = req.originalUrl.includes("admin") ? 4 : 20;
                let { offset = 0, search = '', author = '', year = '' } = (0, express_validator_1.matchedData)(req);
                let books = req.originalUrl.includes("admin")
                    ? yield books_model_1.BooksModel.getBooksComplete(offset, search, author, year, limit)
                    : yield books_model_1.BooksModel.getBooksPreview(offset, search, author, year, limit);
                const total = (_a = books[0]) === null || _a === void 0 ? void 0 : _a.total;
                const pages = total ? Math.ceil(total / limit) : 1;
                return res.render(view, { books, offset, search, total, pages });
            }
            catch (e) {
                console.log(e);
                next(new HTTPError_1.HTTPError(500, "Failed to get books"));
            }
        });
    }
    static getSingleBook(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { id } = (0, express_validator_1.matchedData)(req);
                let book = yield books_model_1.BooksModel.getSingleBook(id);
                res.render("book-page", { book });
            }
            catch (e) {
                next(new HTTPError_1.HTTPError(500, "Failed to get book"));
            }
        });
    }
    static incrementStats(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { id, action } = (0, express_validator_1.matchedData)(req);
                const oldStat = yield books_model_1.BooksModel.getStats(id, action);
                yield books_model_1.BooksModel.incrementStats(id, action);
                res.json(oldStat);
            }
            catch (e) {
                next(new HTTPError_1.HTTPError(500, `Failed to affect statistics`));
            }
        });
    }
}
exports.BooksController = BooksController;
