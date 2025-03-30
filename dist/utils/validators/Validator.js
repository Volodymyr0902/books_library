"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Validator = void 0;
const express_validator_1 = require("express-validator");
const HTTPError_1 = require("../error-handler/HTTPError");
class Validator {
    static validate(req, res, next) {
        const errors = (0, express_validator_1.validationResult)(req);
        if (!errors.isEmpty()) {
            throw new HTTPError_1.HTTPError(400, errors.array()[0].msg);
        }
        next();
    }
}
exports.Validator = Validator;
Validator.validateGetBooks = [
    (0, express_validator_1.query)("offset").optional({ checkFalsy: true }).isInt({ min: 0 }).toInt().withMessage("Offset field must be a number"),
    (0, express_validator_1.query)("search").optional().isString().trim().escape().toLowerCase().withMessage("Search field cannot be empty"),
    (0, express_validator_1.query)("author").optional().isString().trim().escape().toLowerCase().withMessage("Author field cannot be empty"),
    (0, express_validator_1.query)("year").optional({ checkFalsy: true }).isInt({ min: 0 }).toInt().withMessage("Year field must be a number")
];
Validator.validateGetSingleBook = [
    (0, express_validator_1.param)("id").isString().escape().notEmpty().withMessage("ID field must be provided")
];
Validator.validateIncrementStats = [
    (0, express_validator_1.param)("id").isString().escape().notEmpty().withMessage("ID field must be provided"),
    (0, express_validator_1.body)("action").isString().trim().escape().isIn(["views", "clicks"]).withMessage("Action field must be either views or clicks"),
];
Validator.validateAddBookManyAuthors = [
    (0, express_validator_1.body)("new-title").isString().trim().notEmpty().escape().withMessage("Title field must be filled"),
    (0, express_validator_1.body)("new-year").isInt({ min: 0 }).toInt().withMessage("Year field must be a number"),
    (0, express_validator_1.body)("new-author-1").isString().trim().notEmpty().escape().withMessage("Author field must be filled"),
    (0, express_validator_1.body)("new-author-2").optional().isString().trim().escape().withMessage("Incorrect 2nd author"),
    (0, express_validator_1.body)("new-author-3").optional().isString().trim().escape().withMessage("Incorrect 3rd author"),
    (0, express_validator_1.body)("description").isString().trim().notEmpty().escape().withMessage("Description field must be filled"),
];
Validator.validateDeleteBook = [
    (0, express_validator_1.param)("id").isString().notEmpty().escape().withMessage("ID field must be provided"),
];
