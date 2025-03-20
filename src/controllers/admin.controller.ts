import {NextFunction, Request, Response} from "express";
import {v4} from "uuid";
import {AdminModel} from "../models/admin.model";
import {DBHandler} from "../services/db/DBHandler";
import {ResultSetHeader} from "mysql2";

export class AdminController {
    static generateID(req: Request, res: Response, next: NextFunction) {
        req.newBookID = v4()
        next()
    }

    static preventCache(req: Request, res: Response, next: NextFunction) {
        res.set("Cache-Control", "no-store, no-cache, must-revalidate, proxy-revalidate");
        res.set("Pragma", "no-cache");
        res.set("Expires", "0");
        res.set("Surrogate-Control", "no-store");
        next();
    }

    static logOut(req: Request, res: Response) {
        res.status(401).end()
    }

    static async proxyOnAuthors(req: Request, res: Response) {
        if ("new-author-2" in req.body || "new-author-3" in req.body) {
            await AdminController.addBookManyAuthors(req, res)
            return
        }

        await AdminController.addBook(req, res)
    }

    static async addBook(req: Request, res: Response) {
        const {"new-title": title, "new-year": year, "new-author-1": author, description} = req.body;
        let authorID: string;

        const existAuthorId = await AdminModel.getAuthorIdByName(author);

        if (existAuthorId) {
            authorID = existAuthorId
        } else {
            authorID = v4()
            if (!(await AdminModel.addAuthor(authorID, author))) {
                res.status(500).json({err: "Failed to insert an author"});
                return
            }
        }

        if (!(await AdminModel.addBook(req.newBookID!, title, authorID, year, 444, "12-34-567", description))) {
            res.status(500).json({err: "Failed to insert a book"});
        }

        res.redirect(req.originalUrl)
    }

    static async addBookManyAuthors(req: Request, res: Response) {
        const {
            "new-title": title,
            "new-year": year,
            "new-author-1": author1,
            "new-author-2": author2,
            "new-author-3": author3,
            description
        } = req.body;

        const authors = [author1, author2, author3].filter(Boolean)
        const authorsIds: string[] = []

        for (const author of authors) {
            const existAuthorId = await AdminModel.getAuthorIdByName(author);

            if (existAuthorId) {
                authorsIds.push(existAuthorId)
            } else {
                authorsIds.push(v4())
                if (!(await AdminModel.addAuthor(authorsIds[authorsIds.length - 1], author))) {
                    res.status(500).json({err: "Failed to insert an author"});
                    return
                }
            }
        }

        await AdminModel.addBook(req.newBookID!, title, null, year, 444, "12-34-567", description)
        await AdminModel.addRelation(req.newBookID!, authorsIds)

        res.redirect(req.originalUrl)
    }

    static async deleteBook(req: Request, res: Response) {
        const {id} = req.params;

        if (await AdminModel.deleteBook(id)) {
            res.json({ok: true});
            return
        }

        res.status(404).json({ok: false});
    }
}