

path = require('path')
express = require('express')


module.exports = (app) ->

  root = path.normalize(__dirname+'../')

  # Assign the port.
  app.set('port', process.env.OSP_MAP_PORT || 3000)

  # Set the static asset root.
  app.use(express.static(root+'/public'))
