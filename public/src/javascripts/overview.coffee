

$ = require('jquery')
s = require('underscore.string')


module.exports = class Overview


  """
  Set the Overview URL and API token.

  @param {String} server
  @param {String} token
  """
  constructor: (server, @token) ->
    @server = s.rtrim(server, '/')


  """
  Get the store objects URL.
  """
  _urlObjects: ->
    "#{@server}/store/objects"


  """
  Get all store objects.
  """
  listObjects: ->
    console.log(@_urlObjects())
