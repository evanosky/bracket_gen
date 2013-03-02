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
  end
end