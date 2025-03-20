import {NextFunction, Request, Response} from "express";
import {BooksModel} from "../models/books.model";
import {Validator} from "../services/validators/validator";
import {IAuthorId, IBook, IBookComplete, ISingleBook} from "../interfaces/interfaces";

export class BooksController {
    static async getBooks(req: Request, res: Response, next: NextFunction): Promise<void> {
        try {
            const view = req.originalUrl.includes("admin") ? "admin-page" : "books-page";
            const limit = req.originalUrl.includes("admin") ? 4 : 20;
            let {offset = 0, search = '', author = '', year = ''} = req.query;

            year = String(year).trim();
            if (!Validator.validateYear(year))
                next(new Error("Invalid year"));

            offset = +offset
            search = String(search).trim().toLowerCase();
            author = String(author).trim().toLowerCase();

            const books= req.originalUrl.includes("admin")
                ? await BooksModel.getBooksComplete(offset, search, author, year, limit)
                : await BooksModel.getBooksPreview(offset, search, author, year, limit);

            for (let book of books) {
                if (!book.name)
                    book = await BooksModel.convertAuthorIdsToNames(await BooksModel.addAuthorIdsToBook(book))
            }

            const total = await BooksModel.getBookTotalNum(search, author, year)
            const pages = Math.ceil(total / limit) - 1

            return res.render(view, {books, offset, search, total, pages})
        } catch (e) {
            next(e);
        }
    }

    static async getSingleBook(req: Request, res: Response): Promise<void> {
        const {id} = req.params
        let book: IBook = await BooksModel.getSingleBook(id)

        if (!book.name)
            book = await BooksModel.convertAuthorIdsToNames(await BooksModel.addAuthorIdsToBook(book))


        res.render("book-page", {book})
    }

    static async incrementStats(req: Request, res: Response, next: NextFunction): Promise<void> {
        const {id} = req.params
        const {action} = req.body
        let statCol: string

        if (action === "view") {
            statCol = "views"
        } else if (action === "click") {
            statCol = "clicks"
        } else {
            throw new Error("Invalid action");
        }

        const oldStat = await BooksModel.getStats(id, statCol)

        if (await BooksModel.incrementStats(id, statCol)) {
            res.json(oldStat)
        } else {
            next(new Error("Failed to increment statistics"));
        }
    }
}
