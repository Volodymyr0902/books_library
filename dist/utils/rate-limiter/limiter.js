"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_rate_limit_1 = __importDefault(require("express-rate-limit"));
const HTTPError_1 = require("../error-handler/HTTPError");
exports.default = (0, express_rate_limit_1.default)({
    windowMs: 2 * 60 * 1000,
    max: 100,
    handler: (req, res, next) => {
        next(new HTTPError_1.HTTPError(429, "Too many requests"));
    }
});
