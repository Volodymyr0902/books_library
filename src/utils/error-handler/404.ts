import {NextFunction, Request, Response} from "express";
import {HTTPError} from "./HTTPError";

export const notFound = (req: Request, res: Response, next: NextFunction) => {
    console.log(req.originalUrl)
    next(new HTTPError(404, "Not Found"));
}