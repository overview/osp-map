

$ = require('jquery')
Backbone = require('backbone')
L = require('leaflet')
QueryString = require('querystring')
Map = require('./map/map.ctl')

Backbone.$ = $
L.Icon.Default.imagePath = 'dist/images/leaflet'


$ ->
  options = QueryString.parse(window.location.search.substr(1))
  new Map(options)
