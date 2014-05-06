# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 
$ ->

  $('.show_more').click ->
    $('.catalog').animate {
      height: '+=165'
    }, 1000, ->
    $('.hide_more').removeClass('hidden') $('.show_more').addClass('hidden') if ($('.catalog .block:last').position().top - 165) < $(".catalog").height()
    return false

  $('.hide_more').click ->
    $('.catalog').removeAttr('style')
    $("html:not(:animated),body:not(:animated)").animate({scrollTop: $('#catalog').offset().top}, 700)
    $('.show_more').removeClass('hidden')
    $('.hide_more').addClass('hidden')
    return false

  $('.link_to').click ->
    elementClick = $(this).attr('href')
    destination = $(elementClick).offset().top
    $("html:not(:animated),body:not(:animated)").animate({scrollTop: destination}, 700)
    return false

  $('#catalog .block').hover (ev) -> 
    $(this).find('a').toggleClass 'darkgray'
    $(this).find('a').toggleClass 'gray'

  $('.order_form').bind 'ajax:success', ->
    $(this).find('.left').css('visibility','hidden')
    form_wrapper = $(this)
    form = $(this).find('.right')
    form.css('visibility','hidden')
    $(this).append('<p class="after_text white">спасибо! <br><br> наш специалист<br> свяжется с вами<br>в ближайшее время</p>')
    $(this).fadeIn()

  $('.gray_form').bind 'ajax:success', ->
    $(this).find('.left').css('visibility','hidden')
    form_wrapper = $(this)
    form = $(this).find('.right')
    form.css('visibility','hidden')
    $(this).append('<p class="after_text black">спасибо! <br><br> наш специалист<br> свяжется с вами<br>в ближайшее время</p>')
    $(this).fadeIn()

  $('.ask_form').bind 'ajax:success', ->
    form = $(this)
    $(this).fadeOut =>
      $(this).html('<p class="after_text"></p>')
      form.find('p').html('спасибо! <br><br> наш специалист<br> свяжется с вами<br>в ближайшее время')
      $(this).fadeIn()

  $('.popup_form').bind 'ajax:success', ->
    $('#popup_form .left, #popup_form .right').fadeOut();
    $('#popup_form').html('<p class="after_text">спасибо! <br><br> наш специалист<br> свяжется с вами<br>в ближайшее время</p>')
    $('#popup_form').fadeOut(2500)

  $('#order_form_button').click ->
    $('#popup_form').fadeToggle()

  $('#q-tabs').tabs(active: 0);
  $('#how-tabs').tabs(active: 0);
  $('#s-tabs').tabs(active: 0);

  $('.carousel').carousel interval: 5000

@landing = angular.module("Landing", [])

@landing.controller 'ReviewsCtrl', 
  class ReviewsCtrl
    @$inject = ['$scope', '$http']

    constructor: (@scope) ->
      @scope.myInterval = 5000
      @scope.reviews = []

@landing.controller 'LandingCtrl',
  class LandingCtrl
    @$inject = ['$scope', '$http']

    constructor: (@scope, @http) ->
      @http.get('/cities')
        .success (data) =>
          @scope.topCats = data

      @http.get('/cities')
        .success (data) =>
          @scope.subCats = data
      
