"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.errorHandler = void 0;
const HTTPError_1 = require("./HTTPError");
const errorHandler = (err, req, res, next) => {
    const { message, stack } = err;
    const code = err instanceof HTTPError_1.HTTPError ? err.code : 500;
    console.error(`${new Date()} ${stack}`);
    res.status(code).render("error-page", { err: { code, message } });
};
exports.errorHandler = errorHandler;
