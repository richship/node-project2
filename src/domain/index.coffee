db = require './database'
dbtypes = require('sequelize-sqlite').sequelize

Provider = db.define 'Provider',
		name: dbtypes.STRING
		state: dbtypes.STRING

Payer = db.define 'Payer',
	name: dbtypes.STRING

Client = db.define 'Client',
	name: dbtypes.STRING
	
ClientPayers =  db.define 'ClientPayers',
	type: dbtypes.STRING

#Payer.hasMany(Client, { through: ClientPayers })
#Client.hasMany(Payer, { through: ClientPayers })

module.exports =
	Client: Client
	Payer: Payer
	ClientPayers: ClientPayers
	Provider: Provider

#auto-create tables
db.sync()
	.error (err) ->
		console.log 'Error trying to create tables: ' + err