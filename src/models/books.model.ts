import {DBHandler} from "../utils/db/DBHandler";
import {IBook, IBookComplete, ISingleBook, IStats} from "../interfaces/interfaces";
import {ResultSetHeader} from "mysql2";

export class BooksModel {
    static async getBooksPreview(offset: number,
                                 search: string, author: string, year: string, limit: number): Promise<IBook[]> {
        search = '%' + search + '%'
        author = '%' + author + '%'
        year = '%' + year + '%'

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
                             LIMIT ?, ?`
        const [books] = await DBHandler.instance().pool.query<IBook[]>(searchQuery,
            [search, year, author, offset * limit, limit])

        return books;
    }

    static async getBooksComplete(offset: number,
                                  search: string,
                                  author: string,
                                  year: string,
                                  limit: number): Promise<IBookComplete[]> {
        search = '%' + search + '%'
        author = '%' + author + '%'
        year = '%' + year + '%'

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
                             LIMIT ?, ?`
        const [books] = await DBHandler.instance().pool.query<IBookComplete[]>(searchQuery,
            [search, year, author, offset * limit, limit])

        return books;
    }

    static async getSingleBook(id: string): Promise<ISingleBook> {
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
                             GROUP BY books.id, title, timestamp`
        const [books] = await DBHandler.instance().pool.query<ISingleBook[]>(searchQuery, [id])

        return books[0]
    }

    static async getStats(id: string, statCol: string) {
        const selQuery = `SELECT ${statCol}
                          FROM books
                          WHERE books.id = ?`
        const [oldStat] = (await DBHandler.instance().pool.query<IStats[]>(selQuery, [id]))[0]

        return oldStat
    }

    static async incrementStats(id: string, statCol: string) {
        const updQuery = `UPDATE books
                          SET ${statCol} = ${statCol} + 1
                          WHERE books.id = ?`
        await DBHandler.instance().pool.query<ResultSetHeader>(updQuery, [id])
    }
}