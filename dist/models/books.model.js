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
const DBHandler_1 = require("../utils/db/DBHandler");
class BooksModel {
    static getBooksPreview(offset, search, author, year, limit) {
        return __awaiter(this, void 0, void 0, function* () {
            search = '%' + search + '%';
            author = '%' + author + '%';
            year = '%' + year + '%';
            const searchQuery = `SELECT
                                 books.id AS id,
                                 title,
                                 GROUP_CONCAT(DISTINCT authors.name SEPARATOR ', ') AS name,
                                 COUNT(*) OVER() as total
                             FROM books
                             LEFT JOIN books_authors ON books.id = books_authors.book_id
                             LEFT JOIN authors ON authors.id = books_authors.author_id OR books.author_id = authors.id
                             WHERE LOWER(title) LIKE ?
                             AND year LIKE ?
                             AND deleted_at IS NULL
                             GROUP BY books.id, title, timestamp
                             HAVING MAX(LOWER(name) LIKE ?) > 0
                             ORDER BY MAX(timestamp) DESC
                             LIMIT ?, ?`;
            const [books] = yield DBHandler_1.DBHandler.instance().pool.query(searchQuery, [search, year, author, offset * limit, limit]);
            return books;
        });
    }
    static getBooksComplete(offset, search, author, year, limit) {
        return __awaiter(this, void 0, void 0, function* () {
            search = '%' + search + '%';
            author = '%' + author + '%';
            year = '%' + year + '%';
            const searchQuery = `SELECT
                                 books.id AS id,
                                 title,
                                 GROUP_CONCAT(DISTINCT authors.name SEPARATOR ', ') AS name,
                                 year,
                                 clicks,
                                 COUNT(*) OVER() as total
                             FROM books
                                      LEFT JOIN books_authors ON books.id = books_authors.book_id
                                      LEFT JOIN authors ON authors.id = books_authors.author_id OR books.author_id = authors.id
                             WHERE LOWER(title) LIKE ?
                               AND year LIKE ?
                               AND deleted_at IS NULL
                             GROUP BY books.id, title, timestamp
                             HAVING MAX(LOWER(name) LIKE ?) > 0
                             ORDER BY MAX(timestamp) DESC
                             LIMIT ?, ?`;
            const [books] = yield DBHandler_1.DBHandler.instance().pool.query(searchQuery, [search, year, author, offset * limit, limit]);
            return books;
        });
    }
    static getSingleBook(id) {
        return __awaiter(this, void 0, void 0, function* () {
            const searchQuery = `SELECT
                                 books.id AS id,
                                 title,
                                 GROUP_CONCAT(DISTINCT authors.name SEPARATOR ', ') AS name,
                                 year,
                                 pages,
                                 isbn,
                                 description
                             FROM books
                                      LEFT JOIN books_authors ON books.id = books_authors.book_id
                                      LEFT JOIN authors ON authors.id = books_authors.author_id OR books.author_id = authors.id
                             WHERE books.id = ?
                             GROUP BY books.id, title, timestamp`;
            const [books] = yield DBHandler_1.DBHandler.instance().pool.query(searchQuery, [id]);
            return books[0];
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
            yield DBHandler_1.DBHandler.instance().pool.query(updQuery, [id]);
        });
    }
}
exports.BooksModel = BooksModel;
