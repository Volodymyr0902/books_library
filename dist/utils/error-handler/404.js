"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.notFound = void 0;
const HTTPError_1 = require("./HTTPError");
const notFound = (req, res, next) => {
    console.log(req.originalUrl);
    next(new HTTPError_1.HTTPError(404, "Not Found"));
};
exports.notFound = notFound;
