var domain;

domain = require('../domain');

module.exports = {
  lookup: function(req, res, next, id) {
    return domain.Client.find(id).success(function(client) {
      req.client = client;
      return next();
    }).error(function(err) {
      return next(err);
    });
  },
  index: function(req, res, next) {
    if (req.xhr) {
      return domain.Client.findAll().success(function(results) {
        return res.json(results);
      }).error(function(err) {
        return next(err);
      });
    } else {
      return res.render('index');
    }
  },
  create: function(req, res, next) {
    return domain.Client.create(req.body).success(function(client) {
      return res.json(client);
    }).error(function() {
      return next(err);
    });
  },
  transactionsView: function(req, res) {
    return res.render('transactions');
  },
  transactions: function(req, res, next) {
    return domain.transaction.findAll().success(function(results) {
      return res.json(results.error(function(err) {
        return next(err);
      }));
    });
  },
  get: function(req, res) {
    if (req.xhr) {
      return res.json(req.client);
    } else {
      return res.render('view', req.client);
    }
  }
};

//# sourceMappingURL=../../lib/controllers/client.js.map
