

$ = require('jquery')
Controller = require('radio.controller')
NProgress = require('nprogress')


NProgress.configure(
  showSpinner: false,
  trickleSpeed: 150
)


module.exports = Controller.extend {


  events:
    map:
      loadStart: 'loadStart'
      loadStop: 'loadStop'


  initialize: ->
    @spinner = $('i.spinner')


  ###
  # Start the loader.
  ###
  loadStart: ->
    NProgress.start()
    @spinner.show()


  ###
  # Stop the loader.
  ###
  loadStop: ->
    NProgress.done()
    @spinner.hide()


}
