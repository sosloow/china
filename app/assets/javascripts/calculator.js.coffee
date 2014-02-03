@app = angular.module("Calculator", ['google-maps', 'ui.bootstrap'])

#$(document).on 'ready page:load', ->
#  angular.bootstrap($('[ng-controller="CalcCtrl"]')[0], ['Calculator'])

@app.directive 'integer', ->
  require: 'ngModel'
  link: (scope, ele, attr, ctrl) ->
    ctrl.$parsers.unshift (viewValue) ->
      parseInt(viewValue) || 0

@app.controller 'CalcCtrl',
  class CalcCtrl
    @$inject = ['$scope', '$http', '$q']

    prices:
      train:
        scale:
          0: 7
          10: 7
          50: 6
          100: 5
          500: 4.5
        insurance: 0.02
      auto:
        scale:
          0: 8
          10: 8
          50: 7
          100: 6.5
        insurance: 0.02
      ship:
        scale:
          0: 3
      plane:
        scale:
          0: 12
          30: 11
          60: 10
      dop:
        search: 1000
        checking: 1000
        stock: 1000
        travel: 1000
      exchangeRate: 30

    constructor: (@scope, @http, @q) ->
      @scope.countTotalPrice = @countTotalPrice
      @scope.cityClick = @cityClick
      @scope.km = 0
      @scope.transport = 'ship'
      @scope.path = [{latitude: 0, longitude: 0}, {latitude: 0, longitude: 0}]

      @icon =
        normal: '/images/map_pointer_blue.png'
        active: '/images/map_pointer_red.png'

      @http.get('/cities')
        .success (data) =>
          @scope.cities = data
          for i in [0...@scope.cities.length]
            @scope.cities[i].icon = @icon.normal

      @scope.map =
        center:
          latitude: 55
          longitude: 61
        options:
          disableDefaultUI: true
          scrollwheel: false
          draggable: true
        zoom: 4
        draggable: true

      @scope.marker =
        options:
          cursor: 'pointer'
          marginLeft: '-3px 0'

    countTotalPrice: =>
      kg = @scope.kg || 0
      prices = @prices[@scope.transport]
      price = 0
      for own weight, wprice of prices.scale
        price = wprice if kg > parseInt(weight)

      totalPrice = kg * price * @prices.exchangeRate
      totalPrice += totalPrice * prices.insurance if prices.insurance
      totalPrice += @prices.dop.search if @scope.dopSearch
      totalPrice += @prices.dop.checking if @scope.dopChecking
      totalPrice += @prices.dop.travel if @scope.dopTravel
      totalPrice += @prices.dop.stock if @scope.dopStock
      return totalPrice

    cityClick: (city) =>
      @scope.path = []
      if @scope.endPoint
        @scope.endPoint.icon = @icon.normal
        @scope.endPoint = null
        @scope.startPoint.icon = @icon.normal
        @scope.startPoint = city
        @scope.startPoint.icon = @icon.active
      else if @scope.startPoint && @scope.startPoint!=city
        @scope.endPoint = city
        @scope.endPoint.icon = @icon.active
        distance = @findDistance()
        distance.then (result) =>
          @scope.distance = result
        @scope.path = @drawPath @scope.startPoint, @scope.endPoint
      else
        @scope.startPoint = city
        @scope.startPoint.icon = @icon.active

    drawPath: (start, end) ->
      [{latitude: start.latitude, longitude: start.longitude},
        {latitude: end.latitude, longitude: end.longitude}]

    findDistance: =>
      deferred = @q.defer()
      s = new google.maps.LatLng(@scope.startPoint.latitude, @scope.startPoint.longitude)
      e = new google.maps.LatLng(@scope.endPoint.latitude, @scope.endPoint.longitude)
      service = new google.maps.DistanceMatrixService()
      service.getDistanceMatrix
        origins: [s]
        destinations: [e]
        travelMode: google.maps.TravelMode.DRIVING
        avoidHighways: false
        avoidTolls: false,
        (response, status) =>
          if (status == google.maps.DistanceMatrixStatus.OK)
            deferred.resolve response.rows[0].elements[0].distance.text

      return deferred.promise

