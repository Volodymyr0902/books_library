import {DBHandler} from "../services/db/DBHandler";
import {ResultSetHeader} from "mysql2";
import {IAuthorId} from "../interfaces/interfaces";

export class AdminModel {
    static async getAuthorIdByName(id: string) {
        const selectAuthorSQL = `SELECT id
                                 FROM authors
                                 WHERE name = ?`
        const [authorRes] = await DBHandler.instance().pool.query<IAuthorId[]>(selectAuthorSQL, [id])

        return authorRes[0] ? authorRes[0].id : null
    }

    static async addAuthor(authorID: string, author: string) {
        const insertAuthorSQL = `INSERT INTO authors
                                 VALUES (?, ?)`;
        const [insertAuthorRes] = await DBHandler.instance().pool.query<ResultSetHeader>(insertAuthorSQL, [authorID, author]);

        return insertAuthorRes.affectedRows === 1
    }

    static async addBook(bookID: string,
                         title: string,
                         authorID: string | null,
                         year: number,
                         pages: number,
                         isbn: string,
                         description: string) {
        const insertBookSQL = `INSERT INTO books (id, title, author_id, year, pages, isbn, description)
                               VALUES (?, ?, ?, ?, ?, ?, ?)`;
        const [insertBookRes] = await DBHandler.instance().pool.query<ResultSetHeader>(insertBookSQL,
            [bookID, title, authorID, year, pages, isbn, description]);

        return insertBookRes.affectedRows === 1
    }

    static async addRelation(bookID: string, authorsIds: string[]) {
        const addRelationSQL = `INSERT INTO books_authors VALUES (?, ?)`;
        const [addRelationRes] = await DBHandler.instance().pool.query<ResultSetHeader>(addRelationSQL,
            [bookID, JSON.stringify(authorsIds)]);

        return addRelationRes.affectedRows === 1;
    }

    static async deleteBook(id: string) {
        const sql = `DELETE
                     FROM books
                     WHERE id = ?`;
        const [result] = await DBHandler.instance().pool.query<ResultSetHeader>(sql, [id]);

        return result.affectedRows === 1
    }
}