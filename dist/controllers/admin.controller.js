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
    static proxyOnAuthors(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            if ("new-author-2" in req.body || "new-author-3" in req.body) {
                yield AdminController.addBookManyAuthors(req, res);
                return;
            }
            yield AdminController.addBook(req, res);
        });
    }
    static addBook(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { "new-title": title, "new-year": year, "new-author-1": author, description } = req.body;
            let authorID;
            const existAuthorId = yield admin_model_1.AdminModel.getAuthorIdByName(author);
            if (existAuthorId) {
                authorID = existAuthorId;
            }
            else {
                authorID = (0, uuid_1.v4)();
                if (!(yield admin_model_1.AdminModel.addAuthor(authorID, author))) {
                    res.status(500).json({ err: "Failed to insert an author" });
                    return;
                }
            }
            if (!(yield admin_model_1.AdminModel.addBook(req.newBookID, title, authorID, year, 444, "12-34-567", description))) {
                res.status(500).json({ err: "Failed to insert a book" });
            }
            res.redirect(req.originalUrl);
        });
    }
    static addBookManyAuthors(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { "new-title": title, "new-year": year, "new-author-1": author1, "new-author-2": author2, "new-author-3": author3, description } = req.body;
            const authors = [author1, author2, author3].filter(Boolean);
            const authorsIds = [];
            for (const author of authors) {
                const existAuthorId = yield admin_model_1.AdminModel.getAuthorIdByName(author);
                if (existAuthorId) {
                    authorsIds.push(existAuthorId);
                }
                else {
                    authorsIds.push((0, uuid_1.v4)());
                    if (!(yield admin_model_1.AdminModel.addAuthor(authorsIds[authorsIds.length - 1], author))) {
                        res.status(500).json({ err: "Failed to insert an author" });
                        return;
                    }
                }
            }
            yield admin_model_1.AdminModel.addBook(req.newBookID, title, null, year, 444, "12-34-567", description);
            yield admin_model_1.AdminModel.addRelation(req.newBookID, authorsIds);
            res.redirect(req.originalUrl);
        });
    }
    static deleteBook(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            if (yield admin_model_1.AdminModel.deleteBook(id)) {
                res.json({ ok: true });
                return;
            }
            res.status(404).json({ ok: false });
        });
    }
}
exports.AdminController = AdminController;
