# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.Application ||= {}

Application.GetParents = (child) ->
  el = $(child).parent()
  current_row = $(el).prevAll().size() - 2

  current_round = $(el).parent()
  round_index = $(current_round).prevAll().size()
  
  if (round_index <= 5)
    round = round_index
  else
    round = 10 - round_index

  if (round == 0) 
    return {round: -1, teams: []}
  
  prev_round = $(current_round).prev()
  next_round = $(current_round).next()

  offset = 1*Math.pow(2, round-1)
  
  bChampionship = false

  bToRight = (round_index > 5) || ((round_index == 5) && (current_row == 35))

  if (round_index == 5)
    if (current_row == 32)
      bChampionship = true
      indexA = 2 + 27
      indexB = 2 + 35
    else
      indexA = 2 + 15
      indexB = 2 + 47
  else
    indexA = 2 + current_row - offset
    indexB = 2 + current_row + offset

  if (bChampionship)
    round_rows = $(current_round).children()
  else if (bToRight)
    round_rows = $(next_round).children()
  else
    round_rows = $(prev_round).children()

  elA = round_rows[indexA]
  elB = round_rows[indexB]

  elA = $(elA).children().first()
  elB = $(elB).children().first()

  return {round: round, teams: [elA, elB]}

Application.fillForward = (start_at, final_round) ->
  
  el = $(start_at).parent()

  row = $(el).prevAll().size() - 2
  round_column = el.parent()
  
  start_index = $(round_column).prevAll().size()+1

  bToRight = (start_index > 5) || ((start_index == 5) && (row == 35))

  if (start_index <= 5)
    final_index = final_round
  else
    final_index = 12 - final_round

  for round_index in [start_index..final_index]

    bTopTeam = $(el).hasClass("TopTeam")

    if (round_index <= 5)
      round = round_index
    else
      round = 12 - round_index

    
    if (round_index == 6) & ((row == 27) || (row == 35))
      bChampionship = true
      next_round_column = round_column
    else
      bChampionship = false
      if (bToRight)
        next_round_column = round_column.prev()
      else
        next_round_column = round_column.next()

    offset = 1*Math.pow(2, round-1)

    if (round_index == 5)
        next_round_row = 2 + 27
    else if (round_index == 7)
        next_round_row = 2 + 35
    else if bChampionship
        next_round_row = 2 + 32
    else
      if (bTopTeam)
        next_round_row = 2 + row + offset
      else
        next_round_row = 2 + row - offset

    next_round_el = $(next_round_column).children()[next_round_row]
    next_round_el = $(next_round_el).children().first()

    $(next_round_el).text($(start_at).text())

    el = next_round_el.parent()
    row = next_round_row - 2
    round_column = next_round_column


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

  el = $(ev.target).parent()
  row = el.prevAll().size() - 2

  parents = Application.GetParents(ev.target)
  new_list = parents.teams
  parent_round = parents.round

  old_list = new_list
  old_round = parent_round
  
  while (old_round != 1)
    new_list = []
    for i in [0..old_list.length-1]
      more_options = Application.GetParents(old_list[i])
      new_list = new_list.concat(more_options.teams)
      old_round = more_options.round
    old_list = new_list

  found_at = -1
  for i in [0..new_list.length-1]
    if ($(new_list[i]).text() == data)
      found_at = i
      break

  if (found_at == -1)
    alert("Not Possible to Drop a Team Here")
  else
    if (parent_round == 5) && (row == 32) #championship
      Application.fillForward(new_list[found_at], 6)
    else
      Application.fillForward(new_list[found_at], parent_round)


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
  $("#auto_fill").val("true")
  $("#auto_fill_form").submit()

Application.UndoAutoFillClick = (ev) ->
  $("#auto_fill").val("false")
  $("#auto_fill_form").submit()

Application.RetryAutoFillClick = (ev) ->
  $("#auto_fill").val("true")
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







