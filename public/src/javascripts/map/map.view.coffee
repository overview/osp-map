

_ = require('lodash')
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

    @params = {}

    # TODO: Get from URL.
    @overview = new Overview(
      process.env.OSP_API_URL,
      process.env.OSP_API_TOKEN
    )

    @_initLeaflet()
    @_initInstitutions()
    @_initFiltering()


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

        children = cluster.getAllChildMarkers()

        # Add the document counts of all the children.
        count = _.reduce(children, ((s, m) -> s+m.options.count), 0)

        # Form the class.
        c = 'marker-cluster-'
        if count < 10
          c += 'small'
        else if count < 100
          c += 'medium'
        else
          c += 'large'

        new L.DivIcon(
          html: '<div><span>'+count+'</span></div>'
          iconSize: new L.Point(40, 40)
          className: 'marker-cluster '+c
        )

    )

    @map.addLayer(@markers)

    # Load objects from Overview.
    @overview.listObjects().then (objects) =>

      # Map id -> institution.
      @institutions = {}
      objects.forEach (inst) =>
        @institutions[inst.id] = inst

      # Load initial counts.
      @updateCounts()


  ###
  # Subscribe to Overview query changes.
  ###
  _initFiltering: ->

    window.addEventListener 'message', (e) =>
      if e.data.event == 'change:documentListParams'
        @updateCounts(e.data.args)


  ###
  # Subscribe to Overview query changes.
  #
  # @params [Object] params
  ###
  updateCounts: (params={}) ->

    @markers.clearLayers()

    # Load syllabi counts.
    @overview.listCounts(params).then (counts) =>
      for id, count of counts
        if typeof count is 'number'

          inst = @institutions[id]
          lon = inst.json.Longitude
          lat = inst.json.Latitude

          # Create the marker.
          marker = new L.Marker([lat, lon], {
            oid: inst.indexedLong
            count: count
          })

          # Bind the popup, register.
          marker.bindPopup(inst.indexedString)
          @markers.addLayer(marker)


}
