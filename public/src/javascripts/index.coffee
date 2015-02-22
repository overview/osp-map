

$ = require('jquery')
Backbone = require('backbone')
L = require('leaflet')
Qs = require('qs')
Loader = require('./map/loader.ctl')
Map = require('./map/map.ctl')

Backbone.$ = $
L.Icon.Default.imagePath = 'dist/images/leaflet'


$ ->
  options = Qs.parse(window.location.search.substr(1))
  new Loader()
  new Map(options)
