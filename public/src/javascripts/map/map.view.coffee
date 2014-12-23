

Backbone = require('backbone')
L = require('leaflet')


module.exports = Backbone.View.extend {


  el: '#map'


  initialize: ->
    @_initLeaflet()


  """
  Spin up the Leaflet instance.
  """
  _initLeaflet: ->

    @map = L.map(@el)

    # Create an OSM tile layer.
    url = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
    osm = new L.TileLayer(url)

    # Focus on NYC. TODO|dev
    @map.setView(new L.LatLng(40.73, -73.93), 6)
    @map.addLayer(osm)


}
