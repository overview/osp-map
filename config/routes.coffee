

overview = require('../app/controllers/overview')


module.exports = (app) ->
  app.get('/metadata', overview.metadata)
  app.get('/show', overview.show)
