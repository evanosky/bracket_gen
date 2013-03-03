require "bracket_generator"

class BracketsController < ApplicationController
  def generate
  	round1, round2, round3, round4, round5, round6, @champ, @isValid = gen_bracket
  	@rounds = Array.new
  	@rounds[0] = round1
  	@rounds[1] = round2
  	@rounds[2] = round3
  	@rounds[3] = round4
  	@rounds[4] = round5
  	@rounds[5] = round6

  	@teams = Array.new
  	@team_results = Hash.new

  	@rounds[0].each do |round_game|
  		game = Array.new
  		
  		game.push(round_game.get_teamA.get_name)
  		game.push(round_game.get_teamB.get_name)

  		@team_results[round_game.get_teamA.get_name] = Array.new(6) { 0 }
  		@team_results[round_game.get_teamB.get_name] = Array.new(6) { 0 }

  		@teams.push(game)
  	end

  	(1..5).each do |i| 
  		@rounds[i].each do |round_game|
  			@team_results[round_game.get_teamA.get_name][i-1] = 1
  			@team_results[round_game.get_teamB.get_name][i-1] = 1
  		end
  	end

  	@team_results[@champ.get_name][5] = 1

    @results = Array.new(6) {Array.new}
    next_results = Array.new(6) {Array.new}

  	@team_results.each do |team_name, bWin|

      next_results[0].push(bWin[0])
      if (next_results[0].size == 2)
        @results[0].push(next_results[0])
        next_results[0] = Array.new
      end

      (1..5).each do |i|

        if (bWin[i-1] == 1)
          next_results[i].push(bWin[i])
          if (next_results[i].size == 2)
            @results[i].push(next_results[i])
            next_results[i] = Array.new
          end
        end

      end

	   end


 ## 
 # var customData = {
 #    teams : [
 #      [{name: "Team 1", flag: 'fi'}, {name: "Team 2", flag: 'kr'}],
 #      [{name: "Team 3", flag: 'se'}, {name: "Team 4", flag: 'us'}]
 #    ],
 #    results : [4,2]
 #  }
 ##
  end
 

end