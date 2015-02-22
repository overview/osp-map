

Controller = require('radio.controller')
NProgress = require('nprogress')


NProgress.configure(
  showSpinner: false,
  trickleSpeed: 100
)


module.exports = Controller.extend {


  events:
    map:
      loadStart: 'loadStart'
      loadStop: 'loadStop'


  ###
  # Start the loader.
  ###
  loadStart: ->
    NProgress.start()


  ###
  # Stop the loader.
  ###
  loadStop: ->
    NProgress.done()


}
