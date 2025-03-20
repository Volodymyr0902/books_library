import mysql, { Pool } from "mysql2/promise"
import fs from "fs/promises"
import path from "path";
import {AdminModel} from "../../models/admin.model";
import {v4} from "uuid";
import {RowDataPacket} from "mysql2";

/**
 * Implements Singleton pattern, all methods are accessible with instance() method.
 */
export class DBHandler {
    private static _instance: DBHandler
    private readonly _pool: Pool

    private constructor() {
        this._pool = mysql.createPool({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || 'mysql00$',
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
        }
    }

    async configDB() {
        try {
            const scriptPath = path.resolve(__dirname, '..', '..', '..', 'migrations', '002_config-db.sql')
            const sql = await fs.readFile(scriptPath, { encoding: "utf8" });
            await this._pool.query(sql)
        } catch (err) {
            console.error(err)
        }
    }

    async fillDB() {
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
                if (!(await AdminModel.addAuthor(authorID, book.author))) {
                    process.exit(1)
                }
            }

            const bookID = book.image.split('.')[0]
            if (!(await AdminModel.addBook(bookID, book.title, authorID, book.year, 444, "12-34-567", book.description))) {
                process.exit(1)
            }
        }
    }

    async selectDB() {
        try {
            const scriptPath = path.resolve(__dirname, '..', '..', '..', 'migrations', '003_select_db.sql')
            const sql = await fs.readFile(scriptPath, { encoding: "utf8" });
            await this._pool.query(sql)
        } catch (err) {
            console.error(err)
        }
    }

    async createRelationsTable() {
        const scriptPath = path.resolve(__dirname, '..', '..', '..', 'migrations', '004_create_relations_table.sql')
        const sql = await fs.readFile(scriptPath, { encoding: "utf8" });
        await this._pool.query(sql)
    }

    async fetchOldData() {
        const [oldData] = await DBHandler.instance().pool.query<RowDataPacket[]>("SELECT id, author_id FROM books");

        for (const item of oldData) {
            const query = `INSERT INTO books_authors (book_id, authors_ids) VALUES (?, ?)`
            await DBHandler.instance().pool.query(query, [item.id, JSON.stringify([item.author_id])]);
        }
    }
}