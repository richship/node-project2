var client, clientPayers, db, dbtypes, payer, provider;

db = require('./database');

dbtypes = require('sequelize-sqlite').sequelize;

provider = db.define('provider', {
  name: dbtypes.STRING,
  state: dbtypes.STRING
});

payer = db.define('payer', {
  name: dbtypes.STRING
});

client = db.define('client', {
  name: dbtypes.STRING
});

clientPayers = db.define('clientpayers', {
  type: dbtypes.STRING
});

module.exports = {
  client: client,
  payer: payer,
  clientPayers: clientPayers,
  provider: provider
};

db.sync().error(function(err) {
  return console.log('Error trying to create tables: ' + err);
});

//# sourceMappingURL=../../lib/domain/index.js.map
