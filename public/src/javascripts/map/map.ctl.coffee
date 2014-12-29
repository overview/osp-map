

Controller = require('radio.controller')
Map = require('./map.view')
Overview = require('../overview')


module.exports = Controller.extend {


  initialize: ->
    @view = new Map


}
