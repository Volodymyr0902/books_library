import express from "express"
import dotenv from "dotenv"
import {DBHandler} from "./services/db/DBHandler"
import booksRoute from "./routes/books.route";
import adminRoute from "./routes/admin.route"

const port = process.env.APP_PORT ? parseInt(process.env.APP_PORT) : 8080
const host = process.env.APP_HOST || "localhost"

dotenv.config()

const app = express()

app.set("view engine", "ejs")
app.set("views", "/Users/volodymyr/Desktop/Ш++/MVC library/views")

app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use("/public", express.static("public"))

app.use('/api/v1/', booksRoute)
app.use('/admin/api/v1/', adminRoute);

DBHandler.instance()
    .checkDBExists()
    .then((existRes) => {
        if (!existRes) {
            DBHandler.instance().configDB()
                .then(() => DBHandler.instance().fillDB())
        } else{
            DBHandler.instance().selectDB().then()
        }
    })
    .then(() => {
        app.listen(port, host, () => {
            console.log(`Server started on ${host} on port ${port}...`)
        })
    })