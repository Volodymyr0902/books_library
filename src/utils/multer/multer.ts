import multer from "multer";
import path from "path";

const storage = multer.diskStorage({
    destination: "./public/common/images",
    filename: (req, file, cb) => {
        cb(null, req.newBookID + path.extname(file.originalname));
    }
})

export const upload = multer({storage})