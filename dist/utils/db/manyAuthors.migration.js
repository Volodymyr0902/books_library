"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const DBHandler_1 = require("./DBHandler");
DBHandler_1.DBHandler.instance().createRelationsTable()
    .then(() => console.log('Migration finished'))
    .catch(err => console.error(err))
    .finally(() => process.exit(0));
