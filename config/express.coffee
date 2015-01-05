

path = require('path')
express = require('express')


module.exports = (app) ->

  root = path.normalize(__dirname+'/..')
  env = process.env.NODE_ENV || 'development'

  # Assign the port.
  app.set('port', process.env.PORT || 3000)

  # Assign the mount path.
  app.set('mount', process.env.MOUNT || '/')

  # Set the static asset root.
  app.use(app.get('mount'), express.static(root+'/public'))

  # Set the template directory.
  app.set('views', root+'/app/views')
  app.set('view engine', 'jade')

  # Inject the livereload snippet.
  if env == 'development'
    app.use(require('connect-livereload')())

  # Allow cross-origin requests.
  app.use(require('cors')())
