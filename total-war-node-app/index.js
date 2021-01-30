const express = require('express');

const DatabaseUtil = require('./db-util/DatabaseUtil');

const app = express();
const port = 3000;

app.get('/heroes', (req, res) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  
  DatabaseUtil.getAllHeroes().then(function(heroData) {
    res.send({message: heroData});
  });
});

app.listen(port, () => {
  console.log(`API listening at http://localhost:${port}`);
});