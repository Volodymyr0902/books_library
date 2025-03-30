import {DBHandler} from "./DBHandler";

DBHandler.instance().createRelationsTable()
    .then(() => console.log('Migration finished'))
    .catch(err => console.error(err))
    .finally(() => process.exit(0));