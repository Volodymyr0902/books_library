import {DBHandler} from "../utils/db/DBHandler";
import {ResultSetHeader} from "mysql2";
import {IAuthorId} from "../interfaces/interfaces";
import {HTTPError} from "../utils/error-handler/HTTPError";

export class AdminModel {
    static async getAuthorIdByName(id: string) {
        try {
            const selectAuthorSQL = `SELECT id
                                 FROM authors
                                 WHERE name = ?`
            const [authorRes] = await DBHandler.instance().pool.query<IAuthorId[]>(selectAuthorSQL, [id])

            return authorRes[0] ? authorRes[0].id : null
        } catch (e) {
            throw new HTTPError(500, "Internal Server Error")
        }
    }

    static async addAuthor(authorID: string, author: string) {
        try {
            const insertAuthorSQL = `INSERT INTO authors
                                 VALUES (?, ?)`;
            await DBHandler.instance().pool.query<ResultSetHeader>(insertAuthorSQL, [authorID, author]);
        } catch (e) {
            throw new HTTPError(500, "Failed to add new author");
        }
    }

    static async addBook(bookID: string,
                         title: string,
                         authorID: string | null,
                         year: number,
                         pages: number,
                         isbn: string,
                         description: string) {
        try {
            const insertBookSQL = `INSERT INTO books (id, title, author_id, year, pages, isbn, description)
                               VALUES (?, ?, ?, ?, ?, ?, ?)`;
            await DBHandler.instance().pool.query<ResultSetHeader>(insertBookSQL,
                [bookID, title, authorID, year, pages, isbn, description]);
        } catch (e) {
            throw new HTTPError(500, "Failed to add new book");
        }
    }

    static async addRelation(bookID: string, authorID: string) {
        try {
            const addRelationSQL = `INSERT INTO books_authors VALUES (?, ?)`;
            await DBHandler.instance().pool.query<ResultSetHeader>(addRelationSQL, [bookID, authorID]);
        } catch (e) {
            throw new HTTPError(500, "Internal Server Error");
        }
    }

    static async setBookDeletionTime(id: string) {
        try {
            const sql = `UPDATE books SET deleted_at = ? WHERE id = ?`;
            await DBHandler.instance().pool.query<ResultSetHeader>(sql, [new Date(), id]);
        } catch (e) {
            throw new HTTPError(500, "Failed to delete the book");
        }
    }

    static async deleteMarkedBooks() {
        try {
            const sql = `DELETE
                     FROM books
                     WHERE deleted_at IS NOT NULL`;
            await DBHandler.instance().pool.query<ResultSetHeader>(sql);
        } catch (e) {
            throw new HTTPError(500, "Failed to perform soft deletion");
        }
    }
}