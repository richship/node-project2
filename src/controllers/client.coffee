domain = require '../domain'

module.exports =
	lookup: (req, res, next, id) ->
		domain.Client.find(id)
			.success (client) ->
				req.client = client
				next()
			.error (err) ->
				next err

	index: (req, res, next) ->
		domain.Client.findAll()
			.success (results) ->
				res.render 'index', { clients: results }
			.error (err) ->
				next err

	create: (req, res, next) ->
		console.log res.body
		domain.Client.create(req.body)
			.success ->
				res.send(200)
			.error ->
				next err

	view: (req, res) ->
		console.log 'client:'
		console.log req.client
		res.render 'view', req.client
