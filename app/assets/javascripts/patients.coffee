# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("tr[data-link]").click (event)->
    unless $(event.target).is('a') || $(event.target).is('i')
      r = confirm("Is this the correct patient?")
      if r == true
          window.location = $(this).data("link")
      