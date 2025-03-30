import {NextFunction, Request, Response} from "express";
import {HTTPError} from "./HTTPError";

export const errorHandler = (err: unknown, req: Request, res: Response, next: NextFunction) => {
    const {message, stack} = err as Error;
    const code = err instanceof HTTPError ? err.code : 500;

    console.error(`${new Date()} ${stack}`);
    res.status(code).render("error-page", {err: {code, message}});
}