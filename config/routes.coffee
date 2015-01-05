

overview = require('../app/controllers/overview')


module.exports = (app) ->
  app.get('/metadata', overview.metadata)
  app.get('/show', overview.show)

  # TODO|dev
  app.get '/', (req, res) ->
    res.send('test')
