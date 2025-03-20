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
const DBHandler_1 = require("../services/db/DBHandler");
class AdminModel {
    static getAuthorIdByName(id) {
        return __awaiter(this, void 0, void 0, function* () {
            const selectAuthorSQL = `SELECT id
                                 FROM authors
                                 WHERE name = ?`;
            const [authorRes] = yield DBHandler_1.DBHandler.instance().pool.query(selectAuthorSQL, [id]);
            return authorRes[0] ? authorRes[0].id : null;
        });
    }
    static addAuthor(authorID, author) {
        return __awaiter(this, void 0, void 0, function* () {
            const insertAuthorSQL = `INSERT INTO authors
                                 VALUES (?, ?)`;
            const [insertAuthorRes] = yield DBHandler_1.DBHandler.instance().pool.query(insertAuthorSQL, [authorID, author]);
            return insertAuthorRes.affectedRows === 1;
        });
    }
    static addBook(bookID, title, authorID, year, pages, isbn, description) {
        return __awaiter(this, void 0, void 0, function* () {
            const insertBookSQL = `INSERT INTO books (id, title, author_id, year, pages, isbn, description)
                               VALUES (?, ?, ?, ?, ?, ?, ?)`;
            const [insertBookRes] = yield DBHandler_1.DBHandler.instance().pool.query(insertBookSQL, [bookID, title, authorID, year, pages, isbn, description]);
            return insertBookRes.affectedRows === 1;
        });
    }
    static addRelation(bookID, authorsIds) {
        return __awaiter(this, void 0, void 0, function* () {
            const addRelationSQL = `INSERT INTO books_authors VALUES (?, ?)`;
            const [addRelationRes] = yield DBHandler_1.DBHandler.instance().pool.query(addRelationSQL, [bookID, JSON.stringify(authorsIds)]);
            return addRelationRes.affectedRows === 1;
        });
    }
    static deleteBook(id) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = `DELETE
                     FROM books
                     WHERE id = ?`;
            const [result] = yield DBHandler_1.DBHandler.instance().pool.query(sql, [id]);
            return result.affectedRows === 1;
        });
    }
}
exports.AdminModel = AdminModel;
