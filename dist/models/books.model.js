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
exports.BooksModel = void 0;
const DBHandler_1 = require("../services/db/DBHandler");
class BooksModel {
    static getBookTotalNum(search, author, year) {
        return __awaiter(this, void 0, void 0, function* () {
            search = '%' + search + '%';
            author = '%' + author + '%';
            year = '%' + year + '%';
            const searchQuery = `SELECT COUNT(books.id) as total
                             FROM books
                             INNER JOIN authors ON books.author_id = authors.id
                             WHERE lower(title) LIKE ?
                             AND lower(name) LIKE ?
                             AND year LIKE ?`;
            const [result] = yield DBHandler_1.DBHandler.instance().pool.query(searchQuery, [search, author, year]);
            return result[0].total;
        });
    }
    static getBooksPreview(offset, search, author, year, limit) {
        return __awaiter(this, void 0, void 0, function* () {
            search = '%' + search + '%';
            author = '%' + author + '%';
            year = '%' + year + '%';
            const searchQuery = `SELECT books.id as id, title, name
                             FROM books
                             LEFT JOIN authors ON books.author_id = authors.id
                             WHERE lower(title) LIKE ?
                             AND (lower(name) LIKE ? OR lower(name) IS NULL)
                             AND year LIKE ?
                             ORDER BY timestamp
                             LIMIT ?, ?`;
            const [books] = yield DBHandler_1.DBHandler.instance().pool.query(searchQuery, [search, author, year, offset * limit, limit]);
            return books;
        });
    }
    static getBooksComplete(offset, search, author, year, limit) {
        return __awaiter(this, void 0, void 0, function* () {
            search = '%' + search + '%';
            author = '%' + author + '%';
            year = '%' + year + '%';
            const searchQuery = `SELECT books.id as id, title, name, year, clicks
                             FROM books
                             LEFT JOIN authors ON books.author_id = authors.id
                             WHERE lower(title) LIKE ?
                             AND (lower(name) LIKE ? OR lower(name) IS NULL)
                             AND year LIKE ?
                             ORDER BY timestamp
                             LIMIT ?, ?`;
            const [books] = yield DBHandler_1.DBHandler.instance().pool.query(searchQuery, [search, author, year, offset * limit, limit]);
            return books;
        });
    }
    static getSingleBook(id) {
        return __awaiter(this, void 0, void 0, function* () {
            const searchQuery = `SELECT books.id AS id, title, year, pages, isbn, description, name
                             FROM books
                             LEFT JOIN authors ON books.author_id = authors.id
                             WHERE books.id = ?`;
            const [books] = yield DBHandler_1.DBHandler.instance().pool.query(searchQuery, [id]);
            return books[0];
        });
    }
    static addAuthorIdsToBook(book) {
        return __awaiter(this, void 0, void 0, function* () {
            const query = `SELECT JSON_UNQUOTE(authors_ids) as authors FROM books_authors WHERE book_id = ?`;
            const authorsIds = (yield DBHandler_1.DBHandler.instance().pool.query(query, [book.id]))[0][0]["authors"];
            book.name = authorsIds.replace(/["\[\]]/g, "").split(", ");
            return book;
        });
    }
    static convertAuthorIdsToNames(book) {
        return __awaiter(this, void 0, void 0, function* () {
            const [author1, author2, author3] = book.name;
            const query = `SELECT name FROM authors WHERE id IN (?, ?, ?)`;
            const [authorNames] = (yield DBHandler_1.DBHandler.instance().pool.query(query, [author1, author2, author3]));
            book.name = authorNames.map(author => author.name).join(", ");
            return book;
        });
    }
    static getStats(id, statCol) {
        return __awaiter(this, void 0, void 0, function* () {
            const selQuery = `SELECT ${statCol}
                          FROM books
                          WHERE books.id = ?`;
            const [oldStat] = (yield DBHandler_1.DBHandler.instance().pool.query(selQuery, [id]))[0];
            return oldStat;
        });
    }
    static incrementStats(id, statCol) {
        return __awaiter(this, void 0, void 0, function* () {
            const updQuery = `UPDATE books
                          SET ${statCol} = ${statCol} + 1
                          WHERE books.id = ?`;
            const [updRes] = yield DBHandler_1.DBHandler.instance().pool.query(updQuery, [id]);
            return updRes.affectedRows === 1;
        });
    }
}
exports.BooksModel = BooksModel;
