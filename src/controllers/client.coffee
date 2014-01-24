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
		if req.xhr
			domain.Client.findAll()
				.success (results) ->
						res.json results
				.error (err) ->
					next err
		else
			res.render 'index'

	create: (req, res, next) ->
		domain.Client.create(req.body)
			.success (client) ->
				res.json client
			.error ->
				next err

	view: (req, res) ->
		console.log 'client:'
		console.log req.client
		res.render 'view', req.client
