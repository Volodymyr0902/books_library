"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.HTTPError = void 0;
class HTTPError extends Error {
    constructor(code, message) {
        super(message);
        this.code = code;
    }
}
exports.HTTPError = HTTPError;
