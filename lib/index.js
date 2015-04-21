(function() {
  var API, Authenticator, exports;

  API = require('./api');

  Authenticator = require('./authenticator');

  exports = module.exports = {};

  exports.API = API;

  exports.Authenticator = Authenticator;

}).call(this);
