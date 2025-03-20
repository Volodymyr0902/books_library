"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Validator = void 0;
class Validator {
    static validateYear(year) {
        return /^[0-9]*$/g.test(year);
    }
}
exports.Validator = Validator;
