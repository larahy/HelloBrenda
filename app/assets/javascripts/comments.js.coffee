# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.add-comment').on 'click', (e) ->
		e.preventDefault()
		$(this).siblings('.new_comment').slideDown()