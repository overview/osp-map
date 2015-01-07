

require('coffee-script/register');
var app = require('./server');
var debug = require('debug')('osp');

var server = app.listen(app.get('port'), function() {
  debug('Listening on port ' + server.address().port);
});
