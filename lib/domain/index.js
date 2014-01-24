var Client, ClientPayers, Payer, Provider, db, dbtypes;

db = require('./database');

dbtypes = require('sequelize-sqlite').sequelize;

Provider = db.define('Provider', {
  name: dbtypes.STRING,
  state: dbtypes.STRING
});

Payer = db.define('Payer', {
  name: dbtypes.STRING
});

Client = db.define('Client', {
  name: dbtypes.STRING
});

ClientPayers = db.define('ClientPayers', {
  type: dbtypes.STRING
});

module.exports = {
  Client: Client,
  Payer: Payer,
  ClientPayers: ClientPayers,
  Provider: Provider
};

db.sync().error(function(err) {
  return console.log('Error trying to create tables: ' + err);
});

//# sourceMappingURL=../../lib/domain/index.js.map
