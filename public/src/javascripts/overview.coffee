

$ = require('jquery')


module.exports = class Overview


  """
  Set the Overview URL and API token.

  @param {String} server
  @param {String} token
  """
  constructor: (@server, @token) ->
    console.log(@server, @token)


  """
  Get all store objects.
  """
  listObjects: ->
    console.log('list objects')
