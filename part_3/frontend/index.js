const express = require("express");
const bodyParser = require("body-parser");
const axios = require("axios");
const path = require("path");
const qs = require("qs");

const app = express();
const PORT = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.get("/", (req, res) => {
  res.render("form");
});

app.post("/submit", async (req, res) => {
  try {
    await axios.post(
      "http://localhost:5000/",
      qs.stringify(req.body),
      { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }
    );
    res.send(`<h1>Data submitted successfully</h1>`);
  } catch (err) {
    res.send(`Error contacting backend: ${err.message}`);
  }
});

app.listen(PORT, () => {
  console.log(`Frontend running on http://localhost:${PORT}`);
});
