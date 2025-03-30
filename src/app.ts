import express from "express"
import dotenv from "dotenv"
import {DBHandler} from "./utils/db/DBHandler"
import booksRoute from "./routes/books.route";
import adminRoute from "./routes/admin.route"
import {Planner} from "./utils/planner/Planner";
import limiter from "./utils/rate-limiter/limiter";
import {errorHandler} from "./utils/error-handler/errorHandler";
import {notFound} from "./utils/error-handler/404";

dotenv.config()

const port = process.env.APP_PORT ? parseInt(process.env.APP_PORT) : 8080
const host = process.env.APP_HOST || ""

const app = express()

app.set("view engine", "ejs")
app.set("views", "/Users/volodymyr/Desktop/Ш++/MVC library/views")

app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use("/public", express.static("public"))

app.use(limiter)

app.use('/api/v1/', booksRoute)
app.use('/admin/api/v1/', adminRoute);

app.use(notFound)
app.use(errorHandler)

DBHandler.instance()
    .checkDBExists()
    .then((existRes) => {
        if (!existRes) {
            DBHandler.instance().configDB()
                .then(() => DBHandler.instance().fillDB())
        } else {
            DBHandler.instance().selectDB().then()
        }
    })
    .then(() => {
        Planner.planBackups();
        Planner.planSoftDeletions();
    })
    .then(() => {
        app.listen(port, host, () => {
            console.log(`Server started on ${host} on port ${port}...`)
        })
    })