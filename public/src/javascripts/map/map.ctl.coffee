

Controller = require('radio.controller')
Map = require('./map.view')
Overview = require('../overview')


module.exports = Controller.extend {


  initialize: ->
    @view = new Map

    # TODO|dev
    @overview = new Overview(
      process.env.OSP_API_URL,
      process.env.OSP_API_TOKEN
    )


}
