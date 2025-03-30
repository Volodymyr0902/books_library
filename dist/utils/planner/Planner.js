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
exports.Planner = void 0;
const node_cron_1 = __importDefault(require("node-cron"));
const mysqldump_1 = __importDefault(require("mysqldump"));
const dotenv_1 = __importDefault(require("dotenv"));
const path_1 = __importDefault(require("path"));
const admin_model_1 = require("../../models/admin.model");
dotenv_1.default.config();
class Planner {
    static planBackups() {
        node_cron_1.default.schedule("0 0 * * *", () => __awaiter(this, void 0, void 0, function* () {
            try {
                const timestamp = new Date().toISOString();
                const backupPath = path_1.default.resolve(__dirname, "..", "..", "..", "backups", `backup-${timestamp}.sql`);
                yield (0, mysqldump_1.default)({
                    connection: {
                        host: process.env.DB_HOST || "",
                        user: process.env.DB_USER || "",
                        database: process.env.DB_NAME || "",
                        password: process.env.DB_PASSWORD || "",
                    },
                    dumpToFile: backupPath
                });
                console.log(`${timestamp} Backup done.`);
            }
            catch (err) {
                console.error("Backup failed", err);
            }
        }));
    }
    static planSoftDeletions() {
        node_cron_1.default.schedule("0 0 * * *", () => __awaiter(this, void 0, void 0, function* () {
            yield admin_model_1.AdminModel.deleteMarkedBooks();
        }));
    }
}
exports.Planner = Planner;
