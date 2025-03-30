import rateLimit from "express-rate-limit"
import {HTTPError} from "../error-handler/HTTPError";

export default rateLimit({
  windowMs: 2 * 60 * 1000,
  max: 100,
  handler: (req, res, next) => {
    next(new HTTPError(429, "Too many requests"))
  }
})