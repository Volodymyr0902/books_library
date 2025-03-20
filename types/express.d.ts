import {Request} from "express";

declare module "express" {
    export interface Request {
        newBookID?: string;
        logged?: boolean;
    }
}