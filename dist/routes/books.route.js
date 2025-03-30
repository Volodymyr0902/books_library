"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const books_controller_1 = require("../controllers/books.controller");
const Validator_1 = require("../utils/validators/Validator");
const router = express_1.default.Router();
router.get('/', Validator_1.Validator.validateGetBooks, Validator_1.Validator.validate, books_controller_1.BooksController.getBooks);
router.route("/books/:id")
    .get(Validator_1.Validator.validateGetSingleBook, Validator_1.Validator.validate, books_controller_1.BooksController.getSingleBook)
    .post(Validator_1.Validator.validateIncrementStats, Validator_1.Validator.validate, books_controller_1.BooksController.incrementStats);
exports.default = router;
