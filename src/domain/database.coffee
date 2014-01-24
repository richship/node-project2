Sequelize = require('sequelize-sqlite').sequelize

sequelize = new Sequelize 'database', 'username', 'password',
	dialect: 'sqlite'
	storage: 'var/data.db'

module.exports = sequelize