

Controller = require('radio.controller')
Map = require('./map.view')


module.exports = Controller.extend {


  ###
  # Start the map.
  #
  # @param [Object] options
  ###
  initialize: (options) ->
    @view = new Map(options)


}
