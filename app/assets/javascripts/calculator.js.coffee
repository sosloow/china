@app = angular.module("Calculator", [])

$(document).on 'ready page:load', ->
  angular.bootstrap($('[ng-controller]')[0], ['Calculator'])

@app.directive 'integer', ->
  require: 'ngModel',
  link: (scope, ele, attr, ctrl) ->
    ctrl.$parsers.unshift (viewValue) ->
      parseInt(viewValue)

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
      @scope.m3 = 0
      @scope.km = 0
      @scope.kg = 0
      
      @http.get('/cities')
        .success (data) =>
          @scope.cities = @data

    countTotalPrice: =>
      totalPrice = @scope.kg * @prices.kg + @scope.m3 * @prices.m3
      
      totalPrice += @prices.dop.search if @scope.dopSearch
      totalPrice += @prices.dop.checking if @scope.dopChecking
      totalPrice += @prices.dop.travel if @scope.dopTravel
      totalPrice += @prices.dop.stock if @scope.dopStock
      return totalPrice