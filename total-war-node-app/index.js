const express = require('express');
const fs = require('fs');

const DatabaseUtil = require('./db-util/DatabaseUtil');

const app = express();
const port = 3000;

app.get('/heroes', (req, res) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  
  DatabaseUtil.getAllHeroes().then(function(heroData) {
    fs.writeFile('../total-war-app/src/assets/json/heros.json', JSON.stringify(heroData), function (err) {
      if (err) {
        throw err;
      }
      console.log('Saved!');
      res.json(heroData);
    });
  });
});

app.listen(port, () => {
  console.log(`API listening at http://localhost:${port}`);
});