db = require './database'
dbtypes = require('sequelize-sqlite').sequelize

provider = db.define 'provider',
		name: dbtypes.STRING
		state: dbtypes.STRING

payer = db.define 'payer',
	name: dbtypes.STRING

client = db.define 'client',
	name: dbtypes.STRING
	
clientPayers =  db.define 'clientpayers',
	type: dbtypes.STRING

#Payer.hasMany(Client, { through: ClientPayers })
#Client.hasMany(Payer, { through: ClientPayers })

module.exports =
	client: client
	payer: payer
	clientPayers: clientPayers
	provider: provider

#auto-create tables
db.sync()
	.error (err) ->
		console.log 'Error trying to create tables: ' + err