const express = require("express");
const path = require("path");
const app = express();
const port = process.env.PORT || 3000;

const os = require("os");
const git = require("git-last-commit");

let commitInfo = {};
git.getLastCommit(function (err, commit) {
  commitInfo = commit;
});


// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, "public")));

// Handle all other routes by serving the index.html file
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.get("/data", (req, res) => {
  res.json({
    host: os.hostname(),
    hash: commitInfo.hash,
    subject: commitInfo.subject,
  });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
