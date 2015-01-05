

overview = require('../app/controllers/overview')


module.exports = (app) ->
  app.namespace app.get('mount'), ->
    app.get('metadata', overview.metadata)
    app.get('show', overview.show)
