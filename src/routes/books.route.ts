import express from 'express'
import {BooksController} from "../controllers/books.controller";
import {Validator} from "../utils/validators/Validator";

const router = express.Router()

router.get('/', Validator.validateGetBooks, Validator.validate, BooksController.getBooks)

router.route("/books/:id")
    .get(Validator.validateGetSingleBook, Validator.validate, BooksController.getSingleBook)
    .post(Validator.validateIncrementStats, Validator.validate, BooksController.incrementStats)

export default router