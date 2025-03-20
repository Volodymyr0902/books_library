import express from 'express'
import {BooksController} from "../controllers/books.controller";

const router = express.Router()

router.get('/', BooksController.getBooks)

router.route("/books/:id")
    .get(BooksController.getSingleBook)
    .post(BooksController.incrementStats)

export default router