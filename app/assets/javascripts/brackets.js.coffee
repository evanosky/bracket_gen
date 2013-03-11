# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.Application ||= {}

Application.printme = ->
	elHeader = $('#header')
	elTitle = $('.TopHeader')[0]
	elHeader.append(elTitle)
	$('#main_left').remove()
	$('#main_right').remove()
	$('#main_middle').addClass('no_before')