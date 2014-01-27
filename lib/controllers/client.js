var domain, jsonfor;

domain = require('../domain');

jsonfor = function(res, onError, action) {
  return action().success(function(data) {
    return res.json(data);
  });
};

module.exports = {
  lookup: function(req, res, next, id) {
    return domain.client.find(id).success(function(client) {
      req.client = client;
      return next();
    }).error(next);
  },
  get: function(req, res) {
    return res.json(req.client);
  },
  index: function(req, res) {
    return res.render('index');
  },
  list: function(req, res, next) {
    return jsonfor(res, next, function() {
      return domain.client.findAll();
    });
  },
  create: function(req, res, next) {
    if (req.body.id) {
      return next(new Error('id included in create'));
    } else {
      return domain.client.create(req.body).success(function(data) {
        return res.json(data);
      }).error(function(error) {
        return next(error);
      });
    }
  },
  edit: function(req, res, next) {
    console.log(req.body);
    return domain.client.find(req.body.id).success(function(existingRecord) {
      return existingRecord.updateAttributes(req.body).success(function() {
        return res.json(existingRecord);
      });
    });
  },
  transactionsView: function(req, res) {
    return res.render('transactions');
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
