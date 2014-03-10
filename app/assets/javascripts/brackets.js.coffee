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

Application.allowDrop = (ev) ->
  ev.preventDefault()

Application.drag = (ev)->
  team_name = ev.target.innerHTML
  ev.dataTransfer.setData("Text", team_name)

Application.drop = (ev) ->
	ev.preventDefault();
	data = ev.dataTransfer.getData("Text")
	ev.target.textContent = data

Application.getTeamsByRound = ->
  rounds = []
  $('.Rounds').children().each (index, elRound) =>
    round_label = elRound.id
    rounds[index] = []
    $(elRound).children(".TopTeam, .BottomTeam, .Winner").each (index2, elTeamWrapper) =>
    	team_name = $(elTeamWrapper).children().first().text()
    	rounds[index].push(team_name)

  rounds_modified = []
  rounds_modified[0] = rounds[0].concat(rounds[10])
  rounds_modified[1] = rounds[1].concat(rounds[9])
  rounds_modified[2] = rounds[2].concat(rounds[8])
  rounds_modified[3] = rounds[3].concat(rounds[7])
  rounds_modified[4] = rounds[4].concat(rounds[6])
  rounds_modified[5] = rounds[5]

  jsonString = JSON.stringify(rounds_modified);

  return jsonString;

Application.onAutoFillClick = (ev) ->
  data = Application.getTeamsByRound()
  $("#data_seed").text(data)
  $("#auto_fill").attr("checked", true)
  $("#auto_fill_form").submit()

Application.UndoAutoFillClick = (ev) ->
  $("#auto_fill").attr("checked", false)
  $("#auto_fill_form").submit()

Application.RetryAutoFillClick = (ev) ->
  $("#auto_fill").attr("checked", true)
  $("#auto_fill_form").submit()

$(document).ready ->
  $('.Draggable').each (index, element) =>
    team_div = $(element).children().first()
    team_div.attr("draggable", "true")
    team_div.attr("ondragstart", "Application.drag(event)")

  $('.Droppable').each (index, element) =>
    team_div = $(element).children().first()
    team_div.attr("ondrop", "Application.drop(event)")
    team_div.attr("ondragover", "Application.allowDrop(event)") 







