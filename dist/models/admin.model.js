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
exports.AdminModel = void 0;
const DBHandler_1 = require("../utils/db/DBHandler");
const HTTPError_1 = require("../utils/error-handler/HTTPError");
class AdminModel {
    static getAuthorIdByName(id) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const selectAuthorSQL = `SELECT id
                                 FROM authors
                                 WHERE name = ?`;
                const [authorRes] = yield DBHandler_1.DBHandler.instance().pool.query(selectAuthorSQL, [id]);
                return authorRes[0] ? authorRes[0].id : null;
            }
            catch (e) {
                throw new HTTPError_1.HTTPError(500, "Internal Server Error");
            }
        });
    }
    static addAuthor(authorID, author) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const insertAuthorSQL = `INSERT INTO authors
                                 VALUES (?, ?)`;
                yield DBHandler_1.DBHandler.instance().pool.query(insertAuthorSQL, [authorID, author]);
            }
            catch (e) {
                throw new HTTPError_1.HTTPError(500, "Failed to add new author");
            }
        });
    }
    static addBook(bookID, title, authorID, year, pages, isbn, description) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const insertBookSQL = `INSERT INTO books (id, title, author_id, year, pages, isbn, description)
                               VALUES (?, ?, ?, ?, ?, ?, ?)`;
                yield DBHandler_1.DBHandler.instance().pool.query(insertBookSQL, [bookID, title, authorID, year, pages, isbn, description]);
            }
            catch (e) {
                throw new HTTPError_1.HTTPError(500, "Failed to add new book");
            }
        });
    }
    static addRelation(bookID, authorID) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const addRelationSQL = `INSERT INTO books_authors VALUES (?, ?)`;
                yield DBHandler_1.DBHandler.instance().pool.query(addRelationSQL, [bookID, authorID]);
            }
            catch (e) {
                throw new HTTPError_1.HTTPError(500, "Internal Server Error");
            }
        });
    }
    static setBookDeletionTime(id) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const sql = `UPDATE books SET deleted_at = ? WHERE id = ?`;
                yield DBHandler_1.DBHandler.instance().pool.query(sql, [new Date(), id]);
            }
            catch (e) {
                throw new HTTPError_1.HTTPError(500, "Failed to delete the book");
            }
        });
    }
    static deleteMarkedBooks() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const sql = `DELETE
                     FROM books
                     WHERE deleted_at IS NOT NULL`;
                yield DBHandler_1.DBHandler.instance().pool.query(sql);
            }
            catch (e) {
                throw new HTTPError_1.HTTPError(500, "Failed to perform soft deletion");
            }
        });
    }
}
exports.AdminModel = AdminModel;
