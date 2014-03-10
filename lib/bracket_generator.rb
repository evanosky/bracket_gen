class Game # This class holds the two teams playing in a game.
  def set_teamA(aTeamA)
    @teamA = (aTeamA)
  end
  def set_teamB(aTeamB)
    @teamB = (aTeamB)
  end

  def get_teamA
    return @teamA
  end
  def get_teamB
    return @teamB
  end
  
  def set_Winner(aTeam)
    @Winner = aTeam
  end
  def get_Winner
    return @Winner
  end
end


class Team # This class holds the Name, Seed and Region for a team.
  def initialize(aLongName, aShortName, aSeed, aRegion)
    @long_name = aLongName
    @shrt_name = aShortName
    @seed = aSeed
    @region = aRegion
  end
  
  def get_long_name
    return @long_name
  end
  
  def get_short_name
    return @shrt_name
  end
  
  def get_seed
    return @seed
  end
  
  def get_region
    return @region
  end
end


def DrawWinner(aTeamA, aTeamB)
	# This function takes in two teams playing in a game and returns the winner and loser based on the probability of a team with their seed winning.
	# Return values are winner, loser, validity flag
	# The validity flag is false if the two seeds in the function call have never played each other before
 	prob = [
 			[ 0.5000000000, 0.5454545455, 0.5555555556, 0.7346938776, 0.8205128205, 0.7000000000, 1.0000000000, 0.8035714286, 0.9310344828, 1.0000000000, 0.4000000000, 1.0000000000, 1.0000000000, -1.000000000, -1.000000000, 1.0000000000 ],
 			[ 0.4545454545, 0.5000000000, 0.6222222222, 0.4285714286, 0.2500000000, 0.7500000000, 0.7384615385, 0.4000000000, -1.000000000, 0.5853658537, 0.9166666667, 1.0000000000, -1.000000000, -1.000000000, 0.9464285714, -1.000000000 ],
 			[ 0.4444444444, 0.3777777778, 0.5000000000, 0.8000000000, 0.6666666667, 0.5573770492, 0.6666666667, 1.0000000000, 1.0000000000, 0.6153846154, 0.6666666667, -1.000000000, -1.000000000, 0.8571428571, -1.000000000, -1.000000000 ],
 			[ 0.2653061224, 0.5714285714, 0.2000000000, 0.5000000000, 0.5409836066, 0.6666666667, 1.0000000000, 0.3333333333, 1.0000000000, 1.0000000000, -1.000000000, 0.6071428571, 0.7857142857, 1.0000000000, -1.000000000, -1.000000000 ],
 			[ 0.1794871795, 0.7500000000, 0.3333333333, 0.4590163934, 0.5000000000, 0.5000000000, -1.000000000, 0.3333333333, 0.5000000000, 1.0000000000, -1.000000000, 0.6607142857, 0.7857142857, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.3000000000, 0.2500000000, 0.4426229508, 0.3333333333, 0.5000000000, 0.5000000000, 0.5000000000, 0.0000000000, -1.000000000, 0.6666666667, 0.6607142857, -1.000000000, -1.000000000, 0.8461538462, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.2615384615, 0.3333333333, 0.0000000000, -1.000000000, 0.5000000000, 0.5000000000, 0.0000000000, -1.000000000, 0.5982142857, 0.0000000000, -1.000000000, -1.000000000, 1.0000000000, 1.0000000000, -1.000000000 ],
 			[ 0.1964285714, 0.6000000000, 0.0000000000, 0.6666666667, 0.6666666667, 1.0000000000, 1.0000000000, 0.5000000000, 0.4821428571, -1.000000000, 1.0000000000, 0.0000000000, 1.0000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0689655172, -1.000000000, 0.0000000000, 0.0000000000, 0.5000000000, -1.000000000, -1.000000000, 0.5178571429, 0.5000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.4146341463, 0.3846153846, 0.0000000000, 0.0000000000, 0.3333333333, 0.4017857143, -1.000000000, -1.000000000, 0.5000000000, 0.0000000000, -1.000000000, -1.000000000, 1.0000000000, 1.0000000000, -1.000000000 ],
 			[ 0.6000000000, 0.0833333333, 0.3333333333, -1.000000000, -1.000000000, 0.3392857143, 1.0000000000, 0.0000000000, -1.000000000, 1.0000000000, 0.5000000000, -1.000000000, -1.000000000, 1.0000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.0000000000, -1.000000000, 0.3928571429, 0.3392857143, -1.000000000, -1.000000000, 1.0000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000, 0.7777777778, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, -1.000000000, -1.000000000, 0.2142857143, 0.2142857143, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, -1.000000000, 0.2222222222, 0.5000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ -1.000000000, -1.000000000, 0.1428571429, 0.0000000000, -1.000000000, 0.1538461538, 0.0000000000, -1.000000000, -1.000000000, 0.0000000000, 0.0000000000, -1.000000000, -1.000000000, 0.5000000000, -1.000000000, -1.000000000 ],
 			[ -1.000000000, 0.0535714286, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000, -1.000000000 ],
 			[ 0.0000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000 ]
 		   ]

	r = rand(0) # Generate random number
	
	# Verify Seeds are between 1 and 16
	if(aTeamA.get_seed < 1 || aTeamA.get_seed > 16)
		#puts("Invalid Seed for Team A")
		return aTeamB, aTeamA, 0;
	elsif(aTeamB.get_seed < 1 || aTeamB.get_seed > 16)
		#puts("Invalid Seed for Team B")
		return aTeamB, aTeamA, 0;
	end

	if( r <= prob[aTeamA.get_seed-1][aTeamB.get_seed-1])
		return aTeamA, aTeamB, 1;
	else
		if(prob[aTeamA.get_seed-1][aTeamB.get_seed-1] == -1)
			#puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
			#puts('This seed pairing has never happened.')
			#puts("Seed #{aTeamA.get_seed} #{aTeamA.get_name} vs. Seed #{aTeamB.get_seed} #{aTeamB.get_name}")
			#puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
			return aTeamB, aTeamA, 0;	
		else		
			return aTeamB, aTeamA, 1;	
		end
	end
end


def DrawWinnerAlternate(aTeamA, aTeamB)
	# This function takes in two teams playing in a game and returns the winner and loser based on the probability of TeamA winning considering
	# difference between TeamA and TeamB's seeds.
	# Return values are winner, loser
	# Use this function with the function DrawWinner returns -1
	# The function exists to pick a winner for the cases in which the seeds of TeamA and TeamB have never met in actual tournament play
	# If TeamA = 1 and TeamB = 16, delta = -15 and the probability of TeamA winning is 1.0
 	prob = [
 			[ 0.5000000000, 0.5454545455, 0.5555555556, 0.7346938776, 0.8205128205, 0.7000000000, 1.0000000000, 0.8035714286, 0.9310344828, 1.0000000000, 0.4000000000, 1.0000000000, 1.0000000000, -1.000000000, -1.000000000, 1.0000000000 ],
 			[ 0.4545454545, 0.5000000000, 0.6222222222, 0.4285714286, 0.2500000000, 0.7500000000, 0.7384615385, 0.4000000000, -1.000000000, 0.5853658537, 0.9166666667, 1.0000000000, -1.000000000, -1.000000000, 0.9464285714, -1.000000000 ],
 			[ 0.4444444444, 0.3777777778, 0.5000000000, 0.8000000000, 0.6666666667, 0.5573770492, 0.6666666667, 1.0000000000, 1.0000000000, 0.6153846154, 0.6666666667, -1.000000000, -1.000000000, 0.8571428571, -1.000000000, -1.000000000 ],
 			[ 0.2653061224, 0.5714285714, 0.2000000000, 0.5000000000, 0.5409836066, 0.6666666667, 1.0000000000, 0.3333333333, 1.0000000000, 1.0000000000, -1.000000000, 0.6071428571, 0.7857142857, 1.0000000000, -1.000000000, -1.000000000 ],
 			[ 0.1794871795, 0.7500000000, 0.3333333333, 0.4590163934, 0.5000000000, 0.5000000000, -1.000000000, 0.3333333333, 0.5000000000, 1.0000000000, -1.000000000, 0.6607142857, 0.7857142857, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.3000000000, 0.2500000000, 0.4426229508, 0.3333333333, 0.5000000000, 0.5000000000, 0.5000000000, 0.0000000000, -1.000000000, 0.6666666667, 0.6607142857, -1.000000000, -1.000000000, 0.8461538462, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.2615384615, 0.3333333333, 0.0000000000, -1.000000000, 0.5000000000, 0.5000000000, 0.0000000000, -1.000000000, 0.5982142857, 0.0000000000, -1.000000000, -1.000000000, 1.0000000000, 1.0000000000, -1.000000000 ],
 			[ 0.1964285714, 0.6000000000, 0.0000000000, 0.6666666667, 0.6666666667, 1.0000000000, 1.0000000000, 0.5000000000, 0.4821428571, -1.000000000, 1.0000000000, 0.0000000000, 1.0000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0689655172, -1.000000000, 0.0000000000, 0.0000000000, 0.5000000000, -1.000000000, -1.000000000, 0.5178571429, 0.5000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.4146341463, 0.3846153846, 0.0000000000, 0.0000000000, 0.3333333333, 0.4017857143, -1.000000000, -1.000000000, 0.5000000000, 0.0000000000, -1.000000000, -1.000000000, 1.0000000000, 1.0000000000, -1.000000000 ],
 			[ 0.6000000000, 0.0833333333, 0.3333333333, -1.000000000, -1.000000000, 0.3392857143, 1.0000000000, 0.0000000000, -1.000000000, 1.0000000000, 0.5000000000, -1.000000000, -1.000000000, 1.0000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.0000000000, -1.000000000, 0.3928571429, 0.3392857143, -1.000000000, -1.000000000, 1.0000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000, 0.7777777778, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, -1.000000000, -1.000000000, 0.2142857143, 0.2142857143, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, -1.000000000, 0.2222222222, 0.5000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ -1.000000000, -1.000000000, 0.1428571429, 0.0000000000, -1.000000000, 0.1538461538, 0.0000000000, -1.000000000, -1.000000000, 0.0000000000, 0.0000000000, -1.000000000, -1.000000000, 0.5000000000, -1.000000000, -1.000000000 ],
 			[ -1.000000000, 0.0535714286, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000, -1.000000000 ],
 			[ 0.0000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000 ]
 		   ]

	r = rand(0) # Generate random number
	
	# Verify Seeds are between 1 and 16
	if(aTeamA.get_seed < 1 || aTeamA.get_seed > 16 || aTeamB.get_seed < 1 || aTeamB.get_seed > 16)
		#puts("Invalid Seed for Team A")
		return aTeamB, aTeamA, 0;
	end

	# dSeed_Prob(1) = Delta 15 = 1 - 16
	# dSeed_Prob(2) = Delta 14 
	# dSeed_Prob(3) = Delta 13 = 2 - 15 
	# dSeed_Prob(4) = Delta 12 
	# dSeed_Prob(5) = Delta 11 = 3 - 14 
	# dSeed_Prob(6) = Delta 10
	# dSeed_Prob(7) = Delta 9 = 4 - 13
	# dSeed_Prob(8) = Delta 8
	# dSeed_Prob(9) = Delta 7 = 5 - 12
	# dSeed_Prob(10) = Delta 6
	# dSeed_Prob(11) = Delta 5 = 6 - 11
	# dSeed_Prob(12) = Delta 4
	# dSeed_Prob(13) = Delta 3 = 7 - 10
	# dSeed_Prob(14) = Delta 2 
	# dSeed_Prob(15) = Delta 1 = 8 - 9
	
	dSeed_Prob = Array.new(15)
	
	n = 6
	for iter in 0..14 # First Pass fill in known values (Odd deltas)
	  delta_seed = 15 - iter
	  if( delta_seed % 2 == 0)
	    dSeed_Prob[iter] = -1
	  else
	    n = n - 1
	    b = (iter + 1) + n*3	# Lower Seed
	    a =  17 - b			# Upper Seed
	    dSeed_Prob[iter] = prob[a-1][b-1]
	  end
	end
		
	for iter in 0..14 # Second Pass fill in interpolation values (Even deltas)
	  if( dSeed_Prob[iter] == -1)
	    dSeed_Prob[iter] = ( dSeed_Prob[iter-1] + dSeed_Prob[iter+1] )/2;
	  end
	end
	
	if( aTeamA.get_seed < aTeamB.get_seed )
	  delta_seed = aTeamB.get_seed - aTeamA.get_seed
	  thisProb = dSeed_Prob[15 - delta_seed]
	  if( r <= thisProb)
	    return aTeamA, aTeamB;
	  else
	    return aTeamB, aTeamA;	
	  end
	elsif( aTeamB.get_seed < aTeamA.get_seed )
	  delta_seed = aTeamA.get_seed - aTeamB.get_seed
	  thisProb = dSeed_Prob[15 - delta_seed]
	  
	  if( r <= thisProb)
	    return aTeamB, aTeamA;
	  else
	    return aTeamA, aTeamB;	
	  end
	else
	  if( r <= 0.5)
	    return aTeamA, aTeamB;
	  else
	    return aTeamB, aTeamA;	
	  end
	end
end

def AdvanceRound(aThisRound, aNextRound)
	# This function take a round of games and propagates the winners to the next round
	
	next_Round = aNextRound
	
	for game_num in 0..(aThisRound.length/2 - 1)
	  #if( aThisRound[game_num*2].get_Winner.length != 0 ) # Check if winner has already been picked
	  if( aThisRound[game_num*2].get_Winner != nil) # Check if winner has already been picked
	    next_Round[game_num].set_teamA(aThisRound[game_num*2].get_Winner)
	  else
	    winner, loser, bRet = DrawWinner(aThisRound[game_num*2].get_teamA, aThisRound[game_num*2].get_teamB)
	    if( bRet == 0 )
	      winner, loser = DrawWinnerAlternate(aThisRound[game_num*2].get_teamA, aThisRound[game_num*2].get_teamB)
	      puts "DrawWinnerAlternate Called"
	    end
	    print("Game #{game_num*2}, winner = #{winner.get_short_name}, loser = #{loser.get_short_name}\n");
	    next_Round[game_num].set_teamA(winner)	    
	  end
	  
	  #if( aThisRound[game_num*2+1].get_Winner.length != 0 ) # Check if winner has already been picked
	  if( aThisRound[game_num*2+1].get_Winner != nil) # Check if winner has already been picked
	    next_Round[game_num].set_teamB(aThisRound[game_num*2+1].get_Winner)
	  else
	    winner, loser, bRet = DrawWinner(aThisRound[game_num*2+1].get_teamA, aThisRound[game_num*2+1].get_teamB)
	    if( bRet == 0 )
	      winner, loser = DrawWinnerAlternate(aThisRound[game_num*2+1].get_teamA, aThisRound[game_num*2+1].get_teamB)
     	      puts "DrawWinnerAlternate Called"
	    end
	    print("Game #{game_num*2+1}, winner = #{winner.get_short_name}, loser = #{loser.get_short_name}\n");
	    next_Round[game_num].set_teamB(winner)
	  end
	end

	return next_Round
end

def FillGame(aTeamA_Lname,aTeamA_Sname,aTeamA_seed,aTeamB_Lname,aTeamB_Sname,aTeamB_seed,aRegion)
	# This function is used to generate the known, round 1 games established by the selection committee
	myGame = Game.new
	myGame.set_teamA(Team.new(aTeamA_Lname,aTeamA_Sname,aTeamA_seed,aRegion))
	myGame.set_teamB(Team.new(aTeamB_Lname,aTeamB_Sname,aTeamB_seed,aRegion))
	#print("#{myGame.get_teamA.get_region} Region: ##{myGame.get_teamA.get_seed} #{myGame.get_teamA.get_long_name} vs. ##{myGame.get_teamB.get_seed} #{myGame.get_teamB.get_long_name}\n")
	return myGame
end

def get_2013_Round1
	round1 = Array.new(32) # 32 Games, 64 teams

	# Initialize Bracket Teams
	round1[0]  = FillGame('Louisville','Louisville',1,'NCAT/LIB','NCAT/LIB',16,'MidWest')
	round1[1]  = FillGame('Colorado State','Colorado St.',8,'Missouri','Missouri',9,'MidWest')
	round1[2]  = FillGame('Oklahoma State','Oklahoma St.',5,'Oregon','Oregon',12,'MidWest')
	round1[3]  = FillGame('Saint Louis','Saint Louis',4,'New Mexico St.','N Mexico St.',13,'MidWest')
	round1[4]  = FillGame('Memphis','Memphis',6,'MTSU/STM','MTSU/STM',11,'MidWest')
	round1[5]  = FillGame('Michigan State','Michigan St.',3,'Valparaiso','Valparaiso',14,'MidWest')
	round1[6]  = FillGame('Creighton','Creighton',7,'Cincinnati','Cincinnati',10,'MidWest')
	round1[7]  = FillGame('Duke','Duke',2,'Albany','Albany',15,'MidWest')
	round1[8]  = FillGame('Gonzaga','Gonzaga',1,'Southern Univ.','Southern U',16,'West')
	round1[9]  = FillGame('Pittsburgh','Pittsburgh',8,'Wichita State','Wichita St.',9,'West')
	round1[10] = FillGame('Wisconsin','Wisconsin',5,'Mississippi','Mississippi',12,'West')
	round1[11] = FillGame('Kansas State','Kansas State',4,'BSU/La Salle','BSU/La Salle',13,'West')
	round1[12] = FillGame('Arizona','Arizona',6,'Belmont','Belmont',11,'West')
	round1[13] = FillGame('New Mexico','New Mexico',3,'Harvard','Harvard',14,'West')
	round1[14] = FillGame('Notre Dame','Notre Dame',7,'Iowa State','Iowa State',10,'West')
	round1[15] = FillGame('Ohio State','Ohio State',2,'Iona','Iona',15,'West')
	round1[16] = FillGame('Kansas','Kansas',1,'Western Kentucky','W Kentucky',16,'South')
	round1[17] = FillGame('North Carolina','No. Carolina',8,'Villanova','Villanova',9,'South')
	round1[18] = FillGame('VCU','VCU',5,'Akron','Akron',12,'South')
	round1[19] = FillGame('Michigan','Michigan',4,'South Dakota St.','S Dakota St.',13,'South')
	round1[20] = FillGame('UCLA','UCLA',6,'Minnesota','Minnesota',11,'South')
	round1[21] = FillGame('Florida','Florida',3,'N\'western St.','NWern St.',14,'South')
	round1[22] = FillGame('San Diego State','S Diego St.',7,'Oklahoma','Oklahoma',10,'South')
	round1[23] = FillGame('Georgetown','Georgetown',2,'Fla. Gulf Coast','Florida GC',15,'South')
	round1[24] = FillGame('Indiana','Indiana',1,'LIU/JMU','LIU/JMU',16,'East')
	round1[25] = FillGame('NC State','NC State',8,'Temple','Temple',9,'East')
	round1[26] = FillGame('UNLV','UNLV',5,'California','California',12,'East')
	round1[27] = FillGame('Syracuse','Syracuse',4,'Montana','Montana',13,'East')
	round1[28] = FillGame('Butler','Butler',6,'Bucknell','Bucknell',11,'East')
	round1[29] = FillGame('Marquette','Marquette',3,'Davidson','Davidson',14,'East')
	round1[30] = FillGame('Illinois','Illinois',7,'Colorado','Colorado',10,'East')
	round1[31] = FillGame('Miami (FL)','Miami (FL)',2,'Pacific','Pacific',15,'East')
	
	return round1
end

def setup_bracket(dataSeed, round1)
  # This function takes in dataSeed and sets up a bracket that contains the teams defined in dataSeed with the rest empty
  # Look at dataSeed, if it's not empty, there's a forced winner

    round2 = Array.new(16) { Game.new } # 16 Games, 32 teams
    round3 = Array.new(8)  { Game.new } # 8  Games, 16 teams
    round4 = Array.new(4)  { Game.new } # 4  Games,  8 teams
    round5 = Array.new(2)  { Game.new } # 2  Games,  4 teams
    round6 = Array.new(1)  { Game.new } # 1  Game ,  2 teams

    if( dataSeed  == nil)
       return round1, round2, round3, round4, round5, round6
    end
    
  # Round 1 Teams
    # n = 0
    
  # Round 1 Winners, Round 2 Teams
    n = 1
    for m in 0..(32 - 1)
      if( dataSeed[n][m].length != 0)
	  round1[m].set_Winner(get_Team_by_short_name(dataSeed[n][m],round1))
      end
    end
    
  # Round 2 Winners, Round 3 Teams (Sweet 16)
    n = 2
    for m in 0..(16 - 1)
      if( dataSeed[n][m].length != 0)
	  round2[m].set_Winner(get_Team_by_short_name(dataSeed[n][m],round1))
      end
    end
    
    # Round 3 Winners, Round 4 Teams (Elite 8)
    n = 3
    for m in 0..(8 - 1)
      if( dataSeed[n][m].length != 0)
	  round3[m].set_Winner(get_Team_by_short_name(dataSeed[n][m],round1))
      end
    end
    
    # Round 4 Winners, Round 5 Teams (Final 4)
    n = 4
    for m in 0..(4 - 1)
      if( dataSeed[n][m].length != 0)
	  round4[m].set_Winner(get_Team_by_short_name(dataSeed[n][m],round1))
      end
    end
    
    # Round 5 Winners, Round 6 Teams (Final 2)
    n = 5
    m = 0
    if( dataSeed[n][m].length != 0)
      round5[0].set_Winner(get_Team_by_short_name(dataSeed[n][m],round1))
    end

    m = 2
    if( dataSeed[n][m].length != 0)
      round5[1].set_Winner(get_Team_by_short_name(dataSeed[n][m],round1))
    end
    
    # Round 6 Winner (Champ)
    m = 1
    if( dataSeed[n][m].length != 0)
      round6[0].set_Winner(get_Team_by_short_name(dataSeed[n][m],round1))
    end
	 
    return round1, round2, round3, round4, round5, round6
end


def get_Team_by_short_name(aShortName,round1)
    # This function returns the entire "Team" class based on the "short_name"
   for i in 0..31
     if(round1[i].get_teamA.get_short_name == aShortName)
       return round1[i].get_teamA
     elsif(round1[i].get_teamB.get_short_name == aShortName)
       return round1[i].get_teamB
     end
   end
end


def gen_bracket(round1, round2, round3, round4, round5, round6)
	# This function generates the bracket.
	
	round2 = AdvanceRound(round1,round2)
	round3 = AdvanceRound(round2,round3)
	round4 = AdvanceRound(round3,round4)
	round5 = AdvanceRound(round4,round5)
	round6 = AdvanceRound(round5,round6)

	# Fill Champion
	if( round6[0].get_Winner != nil)
	    champ = round6[0].get_Winner
	else
	    champ, loser, bRet = DrawWinner(round6[0].get_teamA, round6[0].get_teamB)
	    if( bRet == 0 )
	      champ, loser = DrawWinnerAlternate(round6[0].get_teamA, round6[0].get_teamB)
     	      puts "Champ DrawWinnerAlternate Called"
	    end
	end
	
	print("Champ = #{champ.get_short_name}\n")
	isValid = 1
		
	return round1, round2, round3, round4, round5, round6, champ, isValid
end  
