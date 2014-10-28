# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require underscore
#= require gmaps/google

@googleMap = (content) ->
  handler = Gmaps.build("Google")
  handler.buildMap
    provider: {}
    internal:
      id: "map"
  , ->
    markers = handler.addMarkers(content)
    handler.bounds.extendWith markers
    handler.fitMapToBounds()

@convert = (objects) ->
  array = []

  for x in objects
    y =
      lat: x.lat
      lng: x.lng
      infowindow: x.name
    array.push y

  googleMap array

$ ->
  $.ajax
    url: '/places.json'
  .done (data) ->
    convert data