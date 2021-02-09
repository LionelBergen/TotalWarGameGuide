const { Client } = require('pg');

// see '../../database' Change 'postgres:postgresql' top match your username/password for the database
const CONNECTION_URL = 'postgres://postgres:postgresql@localhost:5432/total_war_info';

class DatabaseUtil {
  constructor() {
  }
  
  getAllHeroes() {
    return runSelectAllQuery("PlayableHero");
  }
  
  getAllArtifacts() {
    return runSelectAllQuery("WearableArtifact");
  }

}

function createPgClient() {
  const client = new Client(CONNECTION_URL);
  client.connect();
  
  return client;
}

function runSelectAllQuery(tableName) {
  const client = createPgClient();
  return new Promise((resolve, reject) => {
    client.query(`SELECT * FROM public."${tableName}"`).then(function(data) {
      resolve(data.rows);
      client.end();
    }).catch(reject);
  });
}

module.exports = new DatabaseUtil();