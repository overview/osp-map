

module.exports = class Overview


  """
  Set the Overview URL and API token.

  @param {String} url
  @param {String} token
  """
  constructor: (@url, @token) ->


  """
  Get all store objects.
  """
  listObjects: ->
    console.log('list objects')
