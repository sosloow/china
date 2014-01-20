# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.order_form,.gray_form').bind 'ajax:success', ->
    form = $(this).find('.right')
    form.fadeOut ->
      form.html('<p></p>')
      form.find('p').text('Заявка отправлена!')
      form.fadeIn()
  $('.ask_form').bind 'ajax:success', ->
    form = $(this)
    $(this).fadeOut =>
      $(this).html('<p></p>')
      $(this).find('p').text('Заявка отправлена!')
      $(this).fadeIn()

  $('#q-tabs').tabs(active: 0);
  $('#how-tabs').tabs(active: 0);
