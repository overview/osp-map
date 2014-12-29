

Controller = require('radio.controller')
Map = require('./map.view')


module.exports = Controller.extend {


  initialize: ->
    @view = new Map


}
