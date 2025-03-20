export class Validator {
    static validateYear(year: string) {
        return /^[0-9]*$/g.test(year)
    }
}