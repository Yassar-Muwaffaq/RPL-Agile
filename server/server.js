require("dotenv").config();
const express = require("express");
const cors = require("cors");
const pool = require("./db.js");

const app = express();
app.use(cors({
    origin: "http://localhost:5173",
    credentials: true
}));
app.use(express.json());

app.get('/', (req, res) => {
    console.log("Hello World");
    res.send("Hello World");
});

app.post('/takjil-baru', async (req, res) => {
    const { nama_tempat, lokasi, jenis_takjil, waktu_mulai, makanan_berat} = req.body;
    try {
        await pool.query(
            "INSERT INTO takjil (nama_tempat, lokasi, jenis_takjil, waktu_mulai, makanan_berat) VALUES ($1, $2, $3, $4, $5)",
            [nama_tempat, lokasi, jenis_takjil, waktu_mulai, makanan_berat]
        );
        console.log("Data takjil baru diterima:", { nama_tempat, lokasi, jenis_takjil, waktu_mulai, makanan_berat });
        res.status(201).send("Data takjil berhasil ditambahkan");
    } catch (err) {
        console.error(err);
        res.status(500).send("Gagal menambahkan data takjil");
    }
})
app.get("/takjil", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM takjil ORDER BY id DESC");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Gagal mengambil data takjil" });
  }
});
app.listen(5000, () => {
    console.log("Server running on port 5000");
});
