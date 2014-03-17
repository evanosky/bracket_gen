require "bracket_generator"
require "bracket_scorer"

class BracketsController < ApplicationController

  def generate

    @bBlank = false
    unless params[:blank].nil?
      @bBlank = params[:blank]
    end

    @seed = ""
    bAutoFill = !@bBlank
    dataSeed = nil
    unless params[:data_seed].nil?
      @seed = params[:data_seed]
      
      unless (@seed == "")
        dataSeed = JSON.parse(@seed)
      end

      unless params[:auto_fill].nil?
        bAutoFill = params[:auto_fill] == "true" ? true : false
      end

      Rails.logger.warn "*****#{dataSeed}, auto_fill: #{bAutoFill}"
    end

    @ConfLabel = Hash.new
    @ColumnDesc = Array.new

    if params[:year].nil?
      @uiYear = 2014
    else
      @uiYear = params[:year].to_i
      puts "****YEAR: #{@uiYear}"
    end
    
    case (@uiYear)
      when 2013
        puts "IN HERE!"
        @ConfLabel["UpperLeft"] = "South"
        @ConfLabel["LowerLeft"] = "West"
        @ConfLabel["UpperRight"] = "East"
        @ConfLabel["LowerRight"] = "Midwest"
        @ColumnDesc.push("March 21-22")
        @ColumnDesc.push("March 23-24")
        @ColumnDesc.push("March 28-29")
        @ColumnDesc.push("March 30-31")
        @ColumnDesc.push("April 6")
        @ColumnDesc.push("April 8")

        round1, round2, round3, round4, round5, round6, @champ = setup_bracket(dataSeed, get_2013_Round1) 
      else #2014 default
        @ConfLabel["UpperLeft"] = "South"
        @ConfLabel["LowerLeft"] = "East"
        @ConfLabel["UpperRight"] = "West"
        @ConfLabel["LowerRight"] = "Midwest"
        @ColumnDesc.push("March 20-21")
        @ColumnDesc.push("March 22-23")
        @ColumnDesc.push("March 27-28")
        @ColumnDesc.push("March 29-30")
        @ColumnDesc.push("April 5")
        @ColumnDesc.push("April 7")

        round1, round2, round3, round4, round5, round6, @champ = setup_bracket(dataSeed, get_2014_Round1) 
    end

    if (bAutoFill)
      round1, round2, round3, round4, round5, round6, @champ, @isValid = gen_bracket(round1, round2, round3, round4, round5, round6)
      
      if (@uiYear == 2013)
        @score = score_2013bracket(round1, round2, round3, round4, round5, round6)
      end
    else
      @isValid = false
    end
    


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