import mysql, { Pool } from "mysql2/promise"
import fs from "fs/promises"
import path from "path";
import dotenv from "dotenv";
import {AdminModel} from "../../models/admin.model";
import {v4} from "uuid";
import {RowDataPacket} from "mysql2";

dotenv.config();

/**
 * Implements Singleton pattern, all methods are accessible with instance() method.
 */
export class DBHandler {
    private static _instance: DBHandler
    private readonly _pool: Pool

    private constructor() {
        this._pool = mysql.createPool({
            host: process.env.DB_HOST || '',
            user: process.env.DB_USER || '',
            password: process.env.DB_PASSWORD || '',
            multipleStatements: true
        })
    }

    get pool() {
        return this._pool
    }

    public static instance() {
        if (!DBHandler._instance) {
            DBHandler._instance = new DBHandler()
        }

        return DBHandler._instance
    }

    async checkDBExists() {
        try {
            const scriptPath = path.resolve(__dirname, '..', '..', '..', 'migrations', '001_check_db_exists.sql')
            const sql = await fs.readFile(scriptPath, { encoding: "utf8" });
            const [result] = await this._pool.query<RowDataPacket[]>(sql)
            return result.length
        } catch (err) {
            console.error(err)
            process.exit(1)
        }
    }

    async configDB() {
        try {
            const scriptPath = path.resolve(__dirname, '..', '..', '..', 'migrations', '002_config-db.sql')
            const sql = await fs.readFile(scriptPath, { encoding: "utf8" });
            await this._pool.query(sql)
        } catch (err) {
            console.error(err)
            process.exit(1)
        }
    }

    async fillDB() {
        try {
            const dataPath = path.resolve(__dirname, '..', '..', '..', 'migrations', 'basic-data.json')
            const data = await fs.readFile(dataPath, { encoding: "utf8" });
            const booksArr = JSON.parse(data)

            for (const book of booksArr) {
                const existAuthor = await AdminModel.getAuthorIdByName(book.author)
                let authorID;

                if (existAuthor) {
                    authorID = existAuthor
                } else {
                    authorID = v4()
                    await AdminModel.addAuthor(authorID, book.author)
                }

                const bookID = book.image.split('.')[0]
                await AdminModel.addBook(bookID, book.title, authorID, book.year, 444, "12-34-567", book.description)
            }
        } catch (e) {
            console.error(e)
            process.exit(1)
        }
    }

    async selectDB() {
        try {
            const scriptPath = path.resolve(__dirname, '..', '..', '..', 'migrations', '003_select_db.sql')
            const sql = await fs.readFile(scriptPath, { encoding: "utf8" });
            await this._pool.query(sql)
        } catch (err) {
            console.error(err)
            process.exit(1)
        }
    }

    async createRelationsTable() {
        try {
            const scriptPath = path.resolve(__dirname, '..', '..', '..', 'migrations', '004_create_relations_table.sql')
            const sql = await fs.readFile(scriptPath, { encoding: "utf8" });
            await this._pool.query(sql)
        } catch (e) {
            console.error(e)
            process.exit(1)
        }
    }
}