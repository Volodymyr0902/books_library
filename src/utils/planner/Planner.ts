import cron from "node-cron"
import mysqldump from "mysqldump";
import dotenv from "dotenv";
import path from "path";
import {AdminModel} from "../../models/admin.model";

dotenv.config();

export class Planner {
    static planBackups() {
        cron.schedule("0 0 * * *", async () => {
            try {
                const timestamp = new Date().toISOString();
                const backupPath = path.resolve(__dirname, "..", "..", "..", "backups", `backup-${timestamp}.sql`);
                await mysqldump({
                    connection: {
                        host: process.env.DB_HOST || "",
                        user: process.env.DB_USER || "",
                        database: process.env.DB_NAME || "",
                        password: process.env.DB_PASSWORD || "",
                    },
                    dumpToFile: backupPath
                })
                console.log(`${timestamp} Backup done.`)
            } catch (err) {
                console.error("Backup failed", err);
            }
        })
    }

    static planSoftDeletions() {
        cron.schedule("0 0 * * *", async () => {
            await AdminModel.deleteMarkedBooks()
        })
    }
}