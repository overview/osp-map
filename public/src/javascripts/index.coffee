

$ = require('jquery')
Backbone = require('backbone')
L = require('leaflet')
Qs = require('qs')
Map = require('./map/map.ctl')

Backbone.$ = $
L.Icon.Default.imagePath = 'dist/images/leaflet'


$ ->
  options = Qs.parse(window.location.search.substr(1))
  new Map(options)
