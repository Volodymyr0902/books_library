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
exports.getBookTotalNum = void 0;
const dbHandler_1 = __importDefault(require("../db/dbHandler"));
const getBookTotalNum = (search, author, year) => __awaiter(void 0, void 0, void 0, function* () {
    const searchQuery = `SELECT COUNT(books.id) as total FROM books INNER JOIN authors ON books.author_id = authors.id WHERE lower(title) LIKE ? AND lower(name) LIKE ? AND year LIKE ?`;
    return dbHandler_1.default.pool.query(searchQuery, [search, author, year]);
});
exports.getBookTotalNum = getBookTotalNum;
