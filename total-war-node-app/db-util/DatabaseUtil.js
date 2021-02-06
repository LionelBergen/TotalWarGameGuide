const { Client } = require('pg');

// see '../../database' Change 'postgres:postgresql' top match your username/password for the database
const CONNECTION_URL = 'postgres://postgres:postgresql@localhost:5432/total_war_info';

class DatabaseUtil {
  constructor() {
  }
  
  getAllHeroes() {
    const client = createPgClient();
    return new Promise((resolve, reject) => {
      client.query('SELECT * FROM public."PlayableHero"').then(function(data) {
        resolve(data.rows);
        client.end();
      }).catch(reject);
    });
  }
}

function createPgClient() {
  const client = new Client(CONNECTION_URL);
  client.connect();
  
  return client;
}

module.exports = new DatabaseUtil();