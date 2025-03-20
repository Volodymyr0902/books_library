"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const DBHandler_1 = require("./DBHandler");
DBHandler_1.DBHandler.instance().createRelationsTable()
    .then(() => DBHandler_1.DBHandler.instance().fetchOldData()
    .then(() => {
    console.log('Migration finished');
    process.exit(0);
}))
    .catch(err => console.error(err));
