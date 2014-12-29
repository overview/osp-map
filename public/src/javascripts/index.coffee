

$ = require('jquery')
Backbone = require('backbone')
L = require('leaflet')
Map = require('./map/map.ctl')

Backbone.$ = $
L.Icon.Default.imagePath = 'dist/images/leaflet'


$ ->
  new Map
