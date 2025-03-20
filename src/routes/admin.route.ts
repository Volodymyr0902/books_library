import express from "express";
import basicAuth from "express-basic-auth"
import {upload} from "../services/multer/multer";
import {AdminController} from "../controllers/admin.controller";
import dotenv from "dotenv";
import {BooksController} from "../controllers/books.controller";

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
    .get(BooksController.getBooks)
    .post(AdminController.generateID, upload.single("new-img-input"), AdminController.proxyOnAuthors)

router.delete("/:id", AdminController.deleteBook)

export default router;