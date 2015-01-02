

Backbone = require('backbone')
L = require('leaflet')
Overview = require('../overview')
require('leaflet.markercluster')


module.exports = Backbone.View.extend {


  el: '#map'


  ###
  # Connect to Overview, load institutions.
  ###
  initialize: ->

    # TODO: Get from URL.
    @overview = new Overview(
      process.env.OSP_API_URL,
      process.env.OSP_API_TOKEN
    )

    @_initLeaflet()
    @_initInstitutions()


  ###
  # Spin up the Leaflet instance.
  ###
  _initLeaflet: ->

    @map = L.map(@el)
    window.map = @map

    # Create an OSM tile layer.
    url = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
    L.tileLayer(url).addTo(@map)

    # TODO: Where to focus?
    @map.setView([40.73, -73.93], 6)


  ###
  # Load and display institutions.
  ###
  _initInstitutions: ->

    @markers = new L.MarkerClusterGroup(

      iconCreateFunction: (cluster) ->

        count = cluster.getChildCount()
        c = 'marker-cluster-'

        if count < 10
          c += 'small'
        else if count < 100
          c += 'medium'
        else
          c += 'large'

        new L.DivIcon(
          html: '<div><span>'+count+'</span></div>'
          className: 'marker-cluster '+c
          iconSize: new L.Point(40, 40)
        )

    )

    # Load objects from Overview.
    @overview.listObjects().then (objects) =>
      objects.forEach (obj) =>

        lon = obj.json.Longitude
        lat = obj.json.Latitude

        # Register the marker.
        marker = new L.Marker([lat, lon])
        marker.bindPopup(obj.indexedString)
        @markers.addLayer(marker)

    @map.addLayer(@markers)


}
