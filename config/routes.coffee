

map = require('../app/controllers/map')


module.exports = (app) ->
  app.get('/', map.index)
