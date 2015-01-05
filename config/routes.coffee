

overview = require('../app/controllers/overview')


module.exports = (app) ->
  app.namespace null, ->
    app.get('/metadata', overview.metadata)
    app.get('/show', overview.show)
