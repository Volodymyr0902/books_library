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
exports.DBHandler = void 0;
const promise_1 = __importDefault(require("mysql2/promise"));
const promises_1 = __importDefault(require("fs/promises"));
const path_1 = __importDefault(require("path"));
const dotenv_1 = __importDefault(require("dotenv"));
const admin_model_1 = require("../../models/admin.model");
const uuid_1 = require("uuid");
dotenv_1.default.config();
/**
 * Implements Singleton pattern, all methods are accessible with instance() method.
 */
class DBHandler {
    constructor() {
        this._pool = promise_1.default.createPool({
            host: process.env.DB_HOST || '',
            user: process.env.DB_USER || '',
            password: process.env.DB_PASSWORD || '',
            multipleStatements: true
        });
    }
    get pool() {
        return this._pool;
    }
    static instance() {
        if (!DBHandler._instance) {
            DBHandler._instance = new DBHandler();
        }
        return DBHandler._instance;
    }
    checkDBExists() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const scriptPath = path_1.default.resolve(__dirname, '..', '..', '..', 'migrations', '001_check_db_exists.sql');
                const sql = yield promises_1.default.readFile(scriptPath, { encoding: "utf8" });
                const [result] = yield this._pool.query(sql);
                return result.length;
            }
            catch (err) {
                console.error(err);
                process.exit(1);
            }
        });
    }
    configDB() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const scriptPath = path_1.default.resolve(__dirname, '..', '..', '..', 'migrations', '002_config-db.sql');
                const sql = yield promises_1.default.readFile(scriptPath, { encoding: "utf8" });
                yield this._pool.query(sql);
            }
            catch (err) {
                console.error(err);
                process.exit(1);
            }
        });
    }
    fillDB() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const dataPath = path_1.default.resolve(__dirname, '..', '..', '..', 'migrations', 'basic-data.json');
                const data = yield promises_1.default.readFile(dataPath, { encoding: "utf8" });
                const booksArr = JSON.parse(data);
                for (const book of booksArr) {
                    const existAuthor = yield admin_model_1.AdminModel.getAuthorIdByName(book.author);
                    let authorID;
                    if (existAuthor) {
                        authorID = existAuthor;
                    }
                    else {
                        authorID = (0, uuid_1.v4)();
                        yield admin_model_1.AdminModel.addAuthor(authorID, book.author);
                    }
                    const bookID = book.image.split('.')[0];
                    yield admin_model_1.AdminModel.addBook(bookID, book.title, authorID, book.year, 444, "12-34-567", book.description);
                }
            }
            catch (e) {
                console.error(e);
                process.exit(1);
            }
        });
    }
    selectDB() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const scriptPath = path_1.default.resolve(__dirname, '..', '..', '..', 'migrations', '003_select_db.sql');
                const sql = yield promises_1.default.readFile(scriptPath, { encoding: "utf8" });
                yield this._pool.query(sql);
            }
            catch (err) {
                console.error(err);
                process.exit(1);
            }
        });
    }
    createRelationsTable() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const scriptPath = path_1.default.resolve(__dirname, '..', '..', '..', 'migrations', '004_create_relations_table.sql');
                const sql = yield promises_1.default.readFile(scriptPath, { encoding: "utf8" });
                yield this._pool.query(sql);
            }
            catch (e) {
                console.error(e);
                process.exit(1);
            }
        });
    }
}
exports.DBHandler = DBHandler;
