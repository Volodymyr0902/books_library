import {NextFunction, Request, Response} from "express";
import {BooksModel} from "../models/books.model";
import {matchedData} from "express-validator";
import {IBook} from "../interfaces/interfaces";
import {HTTPError} from "../utils/error-handler/HTTPError";

export class BooksController {
    static async getBooks(req: Request, res: Response, next: NextFunction) {
        try {
            const view = req.originalUrl.includes("admin") ? "admin-page" : "books-page";
            const limit = req.originalUrl.includes("admin") ? 4 : 20;
            let {offset = 0, search = '', author = '', year = ''} = matchedData(req);

            let books = req.originalUrl.includes("admin")
                ? await BooksModel.getBooksComplete(offset, search, author, year, limit)
                : await BooksModel.getBooksPreview(offset, search, author, year, limit);

            const total = books[0]?.total
            const pages = total? Math.ceil(total / limit) : 1;

            return res.render(view, {books, offset, search, total, pages})
        } catch (e) {
            console.log(e)
            next(new HTTPError(500, "Failed to get books"));
        }
    }

    static async getSingleBook(req: Request, res: Response, next: NextFunction) {
        try {
            const {id} = matchedData(req)
            let book: IBook = await BooksModel.getSingleBook(id)

            res.render("book-page", {book})
        } catch (e) {
            next(new HTTPError(500, "Failed to get book"));
        }
    }

    static async incrementStats(req: Request, res: Response, next: NextFunction) {
        try {
            const {id, action} = matchedData(req)
            const oldStat = await BooksModel.getStats(id, action)

            await BooksModel.incrementStats(id, action)
            res.json(oldStat)
        } catch (e) {
            next(new HTTPError(500, `Failed to affect statistics`))
        }
    }
}
