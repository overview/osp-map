

_ = require('lodash')
Amygdala = require('amygdala')


module.exports = class Overview


  ###
  # Define a schema onto the Overview API.
  #
  # @param [String] url
  # @param [String] token
  ###
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
        counts:
          url: '/store/document-objects/count-by-object'

    )


  ###
  # Get all store objects.
  ###
  listObjects: ->
    @api.get('objects')


  ###
  # Get document object counts.
  #
  # @param [Object] params
  ###
  listCounts: (params) ->
    @api.get('counts', params).then (counts) ->
      _.omit(counts, 'getRelated')
