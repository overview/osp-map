

Controller = require('radio.controller')
Map = require('./map.view')


module.exports = Controller.extend {


  ###
  # Start the map.
  ###
  initialize: ->
    @view = new Map


}
