import express from "express";
import multer from "multer";
import fs from "fs";
import path from "path";

const app = express();
const PORT = process.env.PORT || 10000;

// Save uploads to /app/public/hls/...
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const folder = path.join("/app/public", req.path.replace(/^\/upload/, ""));
    fs.mkdirSync(folder, { recursive: true });
    cb(null, folder);
  },
  filename: (req, file, cb) => cb(null, file.originalname),
});
const upload = multer({ storage });

// Upload endpoint
app.put("/upload/*", upload.single("file"), (req, res) => {
  res.send(`✅ Uploaded ${req.file.originalname}`);
});

// Serve static files (for nginx proxy)
app.use(express.static("/app/public"));

app.listen(PORT, () => console.log(`Server listening on ${PORT}`));
