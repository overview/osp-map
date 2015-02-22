

Controller = require('radio.controller')


module.exports = Controller.extend {


  events:
    map:
      loadStart: 'loadStart'
      loadStop: 'loadStop'


  ###
  # Start the loader.
  ###
  loadStart: ->
    console.log('loadStart')


  ###
  # Stop the loader.
  ###
  loadStop: ->
    console.log('loadStop')


}
