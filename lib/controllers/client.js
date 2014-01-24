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
    return domain.Client.findAll().success(function(results) {
      return res.render('index', {
        clients: results
      });
    }).error(function(err) {
      return next(err);
    });
  },
  create: function(req, res, next) {
    console.log(res.body);
    return domain.Client.create(req.body).success(function() {
      return res.send(200);
    }).error(function() {
      return next(err);
    });
  },
  view: function(req, res) {
    console.log('client:');
    console.log(req.client);
    return res.render('view', req.client);
  }
};

//# sourceMappingURL=../../lib/controllers/client.js.map
