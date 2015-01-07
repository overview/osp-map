

_ = require('lodash')
Backbone = require('backbone')
L = require('leaflet')
Overview = require('../overview')
require('leaflet.markercluster')
require('leaflet.heat')


module.exports = Backbone.View.extend {


  el: '#map'


  ###
  # Connect to Overview, load institutions.
  ###
  initialize: (@options) ->

    @overview = new Overview(
      @options.server+'/api/v1',
      @options.apiToken
    )

    @_initLeaflet()
    @_initMarkers()
    @_initHeatmap()
    @_initInstitutions()
    @_initFiltering()


  ###
  # Spin up the Leaflet instance.
  ###
  _initLeaflet: ->

    @map = L.map(@el)
    window.map = @map

    # Create an OSM tile layer.
    url = '//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
    L.tileLayer(url).addTo(@map)

    # TODO: Where to focus?
    @map.setView([40.73, -73.93], 6)


  ###
  # Initialize the marker cluster group.
  ###
  _initMarkers: ->

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


  ###
  # Initialize the heatmap.
  ###
  _initHeatmap: ->

    @heatmap = L.heatLayer([], {
      minOpacity: 0.15
    })

    @map.addLayer(@heatmap)


  ###
  # Load and display institutions.
  ###
  _initInstitutions: ->

    # Load objects from Overview.
    @overview.listObjects().then (objects) =>

      # Map id -> institution.
      @institutions = _(objects)
        .pluck('id')
        .zipObject(objects)
        .value()

      # Load initial counts.
      @applyParams()


  ###
  # Subscribe to Overview query changes.
  ###
  _initFiltering: ->

    window.addEventListener 'message', (e) =>
      if e.data.event == 'change:documentListParams'
        @applyParams(e.data.args)
        console.log(e.data.args)


  ###
  # Apply Overview query parameters.
  #
  # @params [Object] params
  ###
  applyParams: (params={}) ->

    # Load new document counts.
    @overview.listCounts(params).then (counts) =>
      @renderMarkers(counts)
      @renderHeatmap(counts)


  ###
  # Render marker clusters.
  #
  # @params [Object] counts
  ###
  renderMarkers: (counts) ->

    @markers.clearLayers()

    for id, count of counts

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


  ###
  # Render the heatmap.
  #
  # @params [Object] counts
  ###
  renderHeatmap: (counts) ->

    points = _.map counts, (count, id) =>

      inst = @institutions[id]
      lon = inst.json.Longitude
      lat = inst.json.Latitude

      L.latLng(lat, lon, count)

    @heatmap.setLatLngs(points)


}
