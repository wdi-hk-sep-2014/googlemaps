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

content = [
  {lat: 0, lng: 0,infowindow: "hello!", link: 'a'},
  {lat: 20, lng: 120,infowindow: "hello!", link: 'b'}
]

$ ->
  $.ajax
    url: '/places.json'
  .done (data) ->
    googleMap content