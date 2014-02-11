domain = require '../domain'

jsonfor = (res, onError, action) ->
	action()
		.success (data) -> res.json data

module.exports =

	lookup: (req, res, next, id) ->
		domain.client.find(id)
			.success (client) ->
				req.client = client
				next()
			.error next

	get: (req, res) -> res.json req.client

	index: (req, res) -> res.render 'index'


	list: (req, res, next) ->
		jsonfor res, next, ->
			domain.client.findAll()

	create: (req, res, next) ->
		if req.body.id
			next new Error 'id included in create'
		else
			domain.client.create(req.body)
				.success (data) ->
					res.json data
				.error (err) ->
					next err

	edit: (req, res, next) ->
		req.client.updateAttributes(req.body)
			.success (data) ->
				res.json data


	transactionsView: (req, res) -> res.render 'transactions'

	get: (req, res) ->
		if req.xhr
			res.json req.client
		else
			res.render 'view', req.client
