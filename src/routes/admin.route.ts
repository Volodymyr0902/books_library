import express, {Request, Response, NextFunction} from "express";
import basicAuth from "express-basic-auth"
import {upload} from "../utils/multer/multer";
import {AdminController} from "../controllers/admin.controller";
import dotenv from "dotenv";
import {BooksController} from "../controllers/books.controller";
import {Validator} from "../utils/validators/Validator";

dotenv.config();

const login = process.env.LOGIN || "";
const pass = process.env.PASS || "";

const router = express.Router();

router.use(AdminController.preventCache);

router.get("/logout", AdminController.logOut);

router.use(basicAuth({
    users: {[login]: pass},
    challenge: true
}))

router.route("/")
    .get(Validator.validateGetBooks, Validator.validate, BooksController.getBooks)
    .post(AdminController.generateID,
        upload.single("new-img-input"),
        Validator.validateAddBookManyAuthors,
        Validator.validate,
        AdminController.addBook)

router.delete("/:id", Validator.validateDeleteBook, Validator.validate, AdminController.deleteBook)

export default router;