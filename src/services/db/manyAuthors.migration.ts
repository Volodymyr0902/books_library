import {DBHandler} from "./DBHandler";

DBHandler.instance().createRelationsTable()
    .then(() => DBHandler.instance().fetchOldData()
        .then(() => {
            console.log('Migration finished')
            process.exit(0)
        }))
    .catch(err => console.error(err));