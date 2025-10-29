import express from "express";
import multer from "multer";
import fs from "fs";
import path from "path";

const app = express();
const PORT = process.env.PORT || 10000;

// Custom storage for flexible nested uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    // Capture everything after /upload/
    const uploadSubpath = req.params[0] || "";
    const folder = path.join("/app/public/hls", uploadSubpath);
    fs.mkdirSync(folder, { recursive: true });
    cb(null, folder);
  },
  filename: (req, file, cb) => cb(null, file.originalname),
});

const upload = multer({ storage });

// ✅ Correct wildcard syntax for Express v5+
app.put("/upload/*", upload.single("file"), (req, res) => {
  res.send(`✅ Uploaded ${req.file.originalname} to ${req.file.destination}`);
});

// Serve static files
app.use(express.static("/app/public"));

// Health check
app.get("/health", (req, res) => res.send("OK"));

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
