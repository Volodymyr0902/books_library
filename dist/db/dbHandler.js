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
const promise_1 = __importDefault(require("mysql2/promise"));
const promises_1 = __importDefault(require("fs/promises"));
const path_1 = __importDefault(require("path"));
class DBHandler {
    constructor() {
        this.pool = promise_1.default.createPool({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || 'mysql00$',
            database: process.env.DB_NAME || 'books_library',
            multipleStatements: true
        });
    }
    configDB() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const scriptPath = path_1.default.resolve(__dirname, '..', '..', 'migrations', '001_config-db.sql');
                console.log(__dirname);
                console.log(scriptPath);
                const sql = yield promises_1.default.readFile(scriptPath, { encoding: "utf8" });
                yield this.pool.query(sql);
            }
            catch (err) {
                console.error(err);
            }
        });
    }
    fillDB() {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = yield promises_1.default.readFile("../../migrations", { encoding: "utf8" });
            yield this.pool.query(sql);
        });
    }
}
exports.default = new DBHandler();
