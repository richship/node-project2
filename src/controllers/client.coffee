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

	transactionsView: (req, res) -> res.render 'transactions'

	transactions: (req, res, next) ->
		domain.transaction.findAll()
			.success (results) -> res.json results
			.error (err) -> next err

	get: (req, res) ->
		if req.xhr
			res.json req.client
		else
			res.render 'view', req.client
