

$ = require('jquery')
Amygdala = require('amygdala')


module.exports = class Overview


  """
  Set the Overview URL and API token.

  @param {String} url
  @param {String} token
  """
  constructor: (url, token) ->

    # Build the Authorization header.
    auth = 'Basic '+new Buffer(token+':x-auth-token').toString('base64')

    @api = new Amygdala(

      config:
        apiUrl: url
        headers:
          Authorization: auth

      schema:
        objects:
          url: '/store/objects'

    )


  """
  Get all store objects.
  """
  listObjects: ->
    @api.get('objects')
