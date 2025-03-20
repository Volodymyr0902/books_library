"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
const DBHandler_1 = require("./services/db/DBHandler");
const books_route_1 = __importDefault(require("./routes/books.route"));
const admin_route_1 = __importDefault(require("./routes/admin.route"));
const port = process.env.APP_PORT ? parseInt(process.env.APP_PORT) : 8080;
const host = process.env.APP_HOST || "localhost";
dotenv_1.default.config();
const app = (0, express_1.default)();
app.set("view engine", "ejs");
app.set("views", "/Users/volodymyr/Desktop/Ш++/MVC library/views");
app.use(express_1.default.json());
app.use(express_1.default.urlencoded({ extended: true }));
app.use("/public", express_1.default.static("public"));
app.use('/api/v1/', books_route_1.default);
app.use('/admin/api/v1/', admin_route_1.default);
DBHandler_1.DBHandler.instance()
    .checkDBExists()
    .then((existRes) => {
    if (!existRes) {
        DBHandler_1.DBHandler.instance().configDB()
            .then(() => DBHandler_1.DBHandler.instance().fillDB());
    }
    else {
        DBHandler_1.DBHandler.instance().selectDB().then();
    }
})
    .then(() => {
    app.listen(port, host, () => {
        console.log(`Server started on ${host} on port ${port}...`);
    });
});
