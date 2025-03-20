import {DBHandler} from "../services/db/DBHandler";
import {IAuthorName, IAuthorId, IBook, IBookComplete, ISingleBook, IStats} from "../interfaces/interfaces";
import {ResultSetHeader, RowDataPacket} from "mysql2";

export class BooksModel {
    static async getBookTotalNum(search: string, author: string, year: string): Promise<number> {
        search = '%' + search + '%'
        author = '%' + author + '%'
        year = '%' + year + '%'

        const searchQuery = `SELECT COUNT(books.id) as total
                             FROM books
                             INNER JOIN authors ON books.author_id = authors.id
                             WHERE lower(title) LIKE ?
                             AND lower(name) LIKE ?
                             AND year LIKE ?`;
        const [result] = await DBHandler.instance().pool.query<RowDataPacket[]>(searchQuery, [search, author, year]);

        return result[0].total
    }

    static async getBooksPreview(offset: number, search: string, author: string, year: string, limit: number): Promise<IBook[]> {
        search = '%' + search + '%'
        author = '%' + author + '%'
        year = '%' + year + '%'

        const searchQuery = `SELECT books.id as id, title, name
                             FROM books
                             LEFT JOIN authors ON books.author_id = authors.id
                             WHERE lower(title) LIKE ?
                             AND (lower(name) LIKE ? OR lower(name) IS NULL)
                             AND year LIKE ?
                             ORDER BY timestamp
                             LIMIT ?, ?`
        const [books] = await DBHandler.instance().pool.query<IBook[]>(searchQuery,
            [search, author, year, offset * limit, limit])

        return books;
    }

    static async getBooksComplete(offset: number, search: string, author: string, year: string, limit: number): Promise<IBookComplete[]> {
        search = '%' + search + '%'
        author = '%' + author + '%'
        year = '%' + year + '%'

        const searchQuery = `SELECT books.id as id, title, name, year, clicks
                             FROM books
                             LEFT JOIN authors ON books.author_id = authors.id
                             WHERE lower(title) LIKE ?
                             AND (lower(name) LIKE ? OR lower(name) IS NULL)
                             AND year LIKE ?
                             ORDER BY timestamp
                             LIMIT ?, ?`
        const [books] = await DBHandler.instance().pool.query<IBookComplete[]>(searchQuery,
            [search, author, year, offset * limit, limit])

        return books;
    }

    static async getSingleBook(id: string): Promise<ISingleBook>{
        const searchQuery = `SELECT books.id AS id, title, year, pages, isbn, description, name
                             FROM books
                             LEFT JOIN authors ON books.author_id = authors.id
                             WHERE books.id = ?`
        const [books] = await DBHandler.instance().pool.query<ISingleBook[]>(searchQuery, [id])

        return books[0]
    }

    static async addAuthorIdsToBook(book: IBook) {
        const query = `SELECT JSON_UNQUOTE(authors_ids) as authors FROM books_authors WHERE book_id = ?`;
        const authorsIds: string = (await DBHandler.instance().pool.query<IAuthorId[]>(query, [book.id]))[0][0]["authors"];
        book.name = authorsIds.replace(/["\[\]]/g, "").split(", ");


        return book;
    }

    static async convertAuthorIdsToNames(book: IBook) {
        const [author1, author2, author3] = book.name;
        const query = `SELECT name FROM authors WHERE id IN (?, ?, ?)`;

        const [authorNames] = (await DBHandler.instance().pool.query<IAuthorName[]>(query, [author1, author2, author3]));
        book.name = authorNames.map(author => author.name).join(", ");

        return book;
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
        const [updRes] = await DBHandler.instance().pool.query<ResultSetHeader>(updQuery, [id])

        return updRes.affectedRows === 1;
    }
}