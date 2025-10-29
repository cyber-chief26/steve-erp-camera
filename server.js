// server.js — Local HLS uploader for Render integration

import express from "express";
import fs from "fs";
import multer from "multer";
import path from "path";

const app = express();
const PORT = process.env.PORT || 10000;

// Directory where uploaded files will be stored
const uploadDir = path.join(process.cwd(), "public", "hls");

// Ensure directories exist
fs.mkdirSync(uploadDir, { recursive: true });

// Multer storage setup
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => cb(null, file.originalname),
});
const upload = multer({ storage });

// ✅ PUT route for single file uploads (e.g., reception.m3u8)
app.put("/upload/:filename", (req, res) => {
  const filename = req.params.filename;
  const filepath = path.join(uploadDir, filename);
  const writeStream = fs.createWriteStream(filepath);

  req.pipe(writeStream);
  req.on("end", () => {
    res.send(`✅ Uploaded ${filename} to ${filepath}`);
  });
  req.on("error", (err) => {
    res.status(500).send(`❌ Upload failed: ${err.message}`);
  });
});

// Serve static files (HLS segments and playlists)
app.use("/hls", express.static(path.join(process.cwd(), "public", "hls")));

app.listen(PORT, () => {
  console.log(`✅ Server running on port ${PORT}`);
});
