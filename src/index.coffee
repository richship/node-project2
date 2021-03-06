express = require 'express'
http = require('http')
path = require('path')

app = express()

# all environments
app.set('port', process.env.PORT || 3000)
app.set('views', path.join(__dirname, '../views'))
app.set('view engine', 'jade')
app.use(express.favicon())
app.use(express.logger('dev'))
app.use(express.json())
app.use(express.urlencoded())
app.use(express.methodOverride())
app.use(app.router)
app.use(require('stylus').middleware(path.join(__dirname, '../public')))
app.use(express.static(path.join(__dirname, '../public')))

# development only
#if 'development' == app.get('env')
app.use(express.errorHandler())

#routes
clientController = require './controllers/client'
app.param(':clientid', clientController.lookup)

app.get('/', clientController.index)
app.get('/clients', clientController.list)
app.get('/clients/:clientid', clientController.get)

app.post('/clients', clientController.create)
app.post('/clients/:clientid', clientController.edit)

http.createServer(app).listen app.get('port'), ->
	console.log('Express server listening on port ' + app.get('port'))