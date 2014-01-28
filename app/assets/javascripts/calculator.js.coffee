@app = angular.module("Calculator", ['google-maps'])

$(document).on 'ready page:load', ->
  angular.bootstrap($('[ng-controller]')[0], ['Calculator'])

@app.directive 'integer', ->
  require: 'ngModel'
  link: (scope, ele, attr, ctrl) ->
    ctrl.$parsers.unshift (viewValue) ->
      parseInt(viewValue) || 0

@app.controller 'CalcCtrl',
  class CalcCtrl
    @$inject = ['$scope', '$http']

    prices:
      m3: 500
      kg: 5
      dop:
        search: 1000
        checking: 1000
        stock: 1000
        travel: 1000

    constructor: (@scope, @http) ->
      @scope.countTotalPrice = @countTotalPrice
      @scope.cityClick = @cityClick
      @scope.km = 0
      @scope.transport = 'ship'

      console.log(@map = $('.angular-google-map-container')[0])
      @directionsDisplay = new google.maps.DirectionsRenderer()
      
      
      @http.get('/cities')
        .success (data) =>
          @scope.cities = data

      @scope.map = {
        center: {
          latitude: 55,
          longitude: 61 },
        options: {
          disableDefaultUI: true,
          scrollwheel: false,
          draggable: true },
        zoom: 4,
        draggable: true
      }

      @scope.marker =
        icon: '/images/point.png',
        options:
          cursor: 'pointer'
          # animation: 2
      
    countTotalPrice: =>
      totalPrice = (@scope.kg || 0) * @prices.kg

      totalPrice += @prices.dop.search if @scope.dopSearch
      totalPrice += @prices.dop.checking if @scope.dopChecking
      totalPrice += @prices.dop.travel if @scope.dopTravel
      totalPrice += @prices.dop.stock if @scope.dopStock
      return totalPrice

    cityClick: (city) =>
      if @scope.endPoint
        @scope.endPoint = null
        @scope.startPoint = city      
      else if @scope.startPoint && @scope.startPoint!=city
        @scope.endPoint = city
        @drawPath(@scope.startPoint, @scope.endPoint)
      else
        @scope.startPoint = city

    drawPath: (start, end) ->
      s = new google.maps.LatLng(start.latitude, start.longitude)
      e = new google.maps.LatLng(end.latitude, end.longitude)
