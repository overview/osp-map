

path = require('path')
express = require('express')


module.exports = (app) ->

  root = path.normalize(__dirname+'/..')

  # Assign the port.
  app.set('port', process.env.OSP_MAP_PORT || 3000)

  # Set the template directory.
  app.set('views', root+'/app/views')
  app.set('view engine', 'jade')

  # Set the static asset root.
  app.use(express.static(root+'/public'))
