"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AdminController = void 0;
const uuid_1 = require("uuid");
const admin_model_1 = require("../models/admin.model");
const express_validator_1 = require("express-validator");
const HTTPError_1 = require("../utils/error-handler/HTTPError");
class AdminController {
    static generateID(req, res, next) {
        req.newBookID = (0, uuid_1.v4)();
        next();
    }
    static preventCache(req, res, next) {
        res.set("Cache-Control", "no-store, no-cache, must-revalidate, proxy-revalidate");
        res.set("Pragma", "no-cache");
        res.set("Expires", "0");
        res.set("Surrogate-Control", "no-store");
        next();
    }
    static logOut(req, res) {
        res.status(401).end();
    }
    static addBook(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { "new-title": title, "new-year": year, "new-author-1": author1, "new-author-2": author2, "new-author-3": author3, description } = (0, express_validator_1.matchedData)(req);
                const authors = [author1, author2, author3].filter(Boolean);
                const authorsIds = [];
                for (const author of authors) {
                    const existAuthorId = yield admin_model_1.AdminModel.getAuthorIdByName(author);
                    if (existAuthorId) {
                        authorsIds.push(existAuthorId);
                    }
                    else {
                        authorsIds.push((0, uuid_1.v4)());
                        yield admin_model_1.AdminModel.addAuthor(authorsIds[authorsIds.length - 1], author);
                    }
                }
                if (authors.length === 1) {
                    yield admin_model_1.AdminModel.addBook(req.newBookID, title, authorsIds[0], year, 444, "12-34-567", description);
                }
                else {
                    yield admin_model_1.AdminModel.addBook(req.newBookID, title, null, year, 444, "12-34-567", description);
                    for (const id of authorsIds) {
                        yield admin_model_1.AdminModel.addRelation(req.newBookID, id);
                    }
                }
                res.redirect(req.originalUrl);
            }
            catch (e) {
                if (e instanceof Error) {
                    next(new HTTPError_1.HTTPError(500, e.message));
                }
                else {
                    next(new HTTPError_1.HTTPError(500, "Unknown error occurred."));
                }
            }
        });
    }
    static deleteBook(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { id } = (0, express_validator_1.matchedData)(req);
                yield admin_model_1.AdminModel.setBookDeletionTime(id);
                res.json({ status: "success" });
            }
            catch (e) {
                if (e instanceof Error) {
                    next(new HTTPError_1.HTTPError(500, e.message));
                }
                else {
                    next(new HTTPError_1.HTTPError(500, "Unknown error occurred."));
                }
            }
        });
    }
}
exports.AdminController = AdminController;
