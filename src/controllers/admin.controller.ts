import {NextFunction, Request, Response} from "express";
import {v4} from "uuid";
import {AdminModel} from "../models/admin.model";
import {matchedData} from "express-validator";
import {HTTPError} from "../utils/error-handler/HTTPError";

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

    static async addBook(req: Request, res: Response, next: NextFunction) {
        try {
            const {
                "new-title": title,
                "new-year": year,
                "new-author-1": author1,
                "new-author-2": author2,
                "new-author-3": author3,
                description
            } = matchedData(req);

            const authors: string[] = [author1, author2, author3].filter(Boolean)
            const authorsIds: string[] = []

            for (const author of authors) {
                const existAuthorId = await AdminModel.getAuthorIdByName(author);

                if (existAuthorId) {
                    authorsIds.push(existAuthorId)
                } else {
                    authorsIds.push(v4())
                    await AdminModel.addAuthor(authorsIds[authorsIds.length - 1], author)
                }
            }

            if (authors.length === 1) {
                await AdminModel.addBook(req.newBookID!, title, authorsIds[0], year, 444, "12-34-567", description)
            } else {
                await AdminModel.addBook(req.newBookID!, title, null, year, 444, "12-34-567", description)
                for (const id of authorsIds) {
                    await AdminModel.addRelation(req.newBookID!, id)
                }
            }

            res.redirect(req.originalUrl)
        } catch (e) {
            if (e instanceof Error) {
                next(new HTTPError(500, e.message))
            } else {
                next(new HTTPError(500, "Unknown error occurred."))
            }
        }
    }

    static async deleteBook(req: Request, res: Response, next: NextFunction) {
        try {
            const {id} = matchedData(req);

            await AdminModel.setBookDeletionTime(id)
            res.json({status: "success"});
        } catch (e) {
            if (e instanceof Error) {
                next(new HTTPError(500, e.message))
            } else {
                next(new HTTPError(500, "Unknown error occurred."))
            }
        }
    }
}