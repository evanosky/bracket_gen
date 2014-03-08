require "bracket_generator"

class BracketsController < ApplicationController

  def generate

    @bBlank = false
    unless params[:blank].nil?
      @bBlank = params[:blank]
    end

    dataSeed = nil
    unless params[:data_seed].nil?
      seed = params[:data_seed]
      dataSeed = JSON.parse(seed)
      Rails.logger.warn "*****#{dataSeed}"
    end

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
      
      game.push(round_game.get_teamA.get_short_name)
      game.push(round_game.get_teamB.get_short_name)

      @team_results[round_game.get_teamA.get_short_name] = Array.new(6) { 0 }
      @team_results[round_game.get_teamB.get_short_name] = Array.new(6) { 0 }

      @teams.push(game)
    end

    @debug = false
  end
 

end