import {body, param, query, validationResult} from "express-validator";
import {Request, Response, NextFunction} from "express";
import {HTTPError} from "../error-handler/HTTPError";

export class Validator {
    static validateGetBooks = [
        query("offset").optional({ checkFalsy: true }).isInt({min: 0}).toInt().withMessage("Offset field must be a number"),
        query("search").optional().isString().trim().escape().toLowerCase().withMessage("Search field cannot be empty"),
        query("author").optional().isString().trim().escape().toLowerCase().withMessage("Author field cannot be empty"),
        query("year").optional({ checkFalsy: true }).isInt({min: 0}).toInt().withMessage("Year field must be a number")
    ]

    static validateGetSingleBook = [
        param("id").isString().escape().notEmpty().withMessage("ID field must be provided")
    ]

    static validateIncrementStats = [
        param("id").isString().escape().notEmpty().withMessage("ID field must be provided"),
        body("action").isString().trim().escape().isIn(["views", "clicks"]).withMessage("Action field must be either views or clicks"),
    ]

    static validateAddBookManyAuthors = [
        body("new-title").isString().trim().notEmpty().escape().withMessage("Title field must be filled"),
        body("new-year").isInt({min: 0}).toInt().withMessage("Year field must be a number"),
        body("new-author-1").isString().trim().notEmpty().escape().withMessage("Author field must be filled"),
        body("new-author-2").optional().isString().trim().escape().withMessage("Incorrect 2nd author"),
        body("new-author-3").optional().isString().trim().escape().withMessage("Incorrect 3rd author"),
        body("description").isString().trim().notEmpty().escape().withMessage("Description field must be filled"),
    ]

    static validateDeleteBook = [
        param("id").isString().notEmpty().escape().withMessage("ID field must be provided"),
    ]

    static validate(req: Request, res: Response, next: NextFunction) {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            throw new HTTPError(400, errors.array()[0].msg);
        }
        next()
    }
}