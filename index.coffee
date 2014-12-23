

debug = require('debug')('osp')
app = require('./server')

server = app.listen app.get('port'), ->
  debug('Listening on port ' + server.address().port)
