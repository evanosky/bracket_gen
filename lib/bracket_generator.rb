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

def AdvanceRound(aNum, aRound)
	# This function take a round of games and propagates the winners to the next round

	if(aNum == 1)
		nGames = 32
	elsif(aNum == 2)
		nGames = 16
	elsif(aNum == 3)
		nGames = 8
	elsif(aNum == 4)
		nGames = 4
	elsif(aNum == 5)
		nGames = 2
	elsif(aNum == 6)
		nGames = 1
	else			
		puts("Invalid Round Number")
		return 0
	end
		
	if(aRound.length != nGames)
		puts("Length of Round Array != Number of Games")
		return 0
	end
	
	next_Round = Array.new(nGames/2)
	bRet = 1
	
	for game_num in 0..(nGames/2 - 1)
	  myGame = Game.new
	  winner, loser, bRet1 = DrawWinner(aRound[game_num*2].get_teamA, aRound[game_num*2].get_teamB)
	  #print("Round #{aNum}, Game #{game_num*2}, winner = #{winner.get_name}, loser = #{loser.get_name}\n");
	  myGame.set_teamA(winner)
	  
	  winner, loser, bRet2 = DrawWinner(aRound[game_num*2+1].get_teamA, aRound[game_num*2+1].get_teamB)
	  #print("Round #{aNum}, Game #{game_num*2+1}, winner = #{winner.get_name}, loser = #{loser.get_name}\n");
	  myGame.set_teamB(winner)
		
	  next_Round[game_num] = myGame
	  if(bRet1 == 0 || bRet2 == 0)
	    bRet = 0
		break
	  end
	end

	return next_Round, bRet
end

def FillGame(aTeamA_Lname,aTeamA_Sname,aTeamA_seed,aTeamB_Lname,aTeamB_Sname,aTeamB_seed,aRegion)
	# This function is used to generate the known, round 1 games established by the selection committee
	myGame = Game.new
	myGame.set_teamA(Team.new(aTeamA_Lname,aTeamA_Sname,aTeamA_seed,aRegion))
	myGame.set_teamB(Team.new(aTeamB_Lname,aTeamB_Sname,aTeamB_seed,aRegion))
	#print("#{myGame.get_teamA.get_region} Region: ##{myGame.get_teamA.get_seed} #{myGame.get_teamA.get_long_name} vs. ##{myGame.get_teamB.get_seed} #{myGame.get_teamB.get_long_name}\n")
	return myGame
end

def gen_bracket
	# This function generates the bracket.
	# If at any point the algorithm pairs two teams the have never played before, (so the probability of either team winning is unknown)
	# The process will start over from the beginning, up to max_iter number of tries, at which point the validity flag is zero (not valid)
	# Initialize Bracket Rounds
	round1 = Array.new(32) # 32 Games, 64 teams
	round2 = Array.new(16) # 16 Games, 32 teams
	round3 = Array.new(8)  # 8  Games, 16 teams
	round4 = Array.new(4)  # 4  Games,  8 teams
	round5 = Array.new(2)  # 2  Games,  4 teams
	round6 = Array.new(1)  # 1  Game ,  2 teams

	# Initialize Bracket Teams
	round1[0] = FillGame('Kentucky','Kentucky',1,'Miss Valley State','Miss Vlly St',16,'South')
	round1[1] = FillGame('Iowa State','Iowa State',8,'UConn','UConn',9,'South')
	round1[2] = FillGame('Wichita State','Wichita St',5,'VCU','VCU',12,'South')
	round1[3] = FillGame('Indiana','Indiana',4,'New Mexico State','N Mexico St',13,'South')
	round1[4] = FillGame('UNLV','UNLV',6,'Colorado','Colorado',11,'South')
	round1[5] = FillGame('Baylor','Baylor',3,'South Dakota St,.','S Dakota St',14,'South')
	round1[6] = FillGame('Notre Dame','Notre Dame',7,'Xavier','Xavier',10,'South')
	round1[7] = FillGame('Duke','Duke',2,'Lehigh','Lehigh',15,'South')
	round1[8] = FillGame('Michigan State','Michigan St',1,'LIU Brooklyn','LIU Brooklyn',16,'West')
	round1[9] = FillGame('Memphis','Memphis',8,'Saint Louis','Saint Louis',9,'West')
	round1[10] = FillGame('New Mexico','New Mexico',5,'Long Beach State','Long Bch St',12,'West')
	round1[11] = FillGame('Louisville','Louisville',4,'Davidson','Davidson',13,'West')
	round1[12] = FillGame('Murray State','Murray St',6,'Colorado State','Colorado St',11,'West')
	round1[13] = FillGame('Marquette','Marquette',3,'Iona','Iona',14,'West')
	round1[14] = FillGame('Florida','Florida',7,'Virginia','Virginia',10,'West')
	round1[15] = FillGame('Missouri','Mizzou',2,'Norfolk State','Norfolk St',15,'West')
	round1[16] = FillGame('Syracuse','Syracuse',1,'UNC-Ashville','UNC-Ashville',16,'East')
	round1[17] = FillGame('Kansas State','Kansas St',8,'Southern Miss','Southrn Miss',9,'East')
	round1[18] = FillGame('Vanderbilt','Vanderbilt',5,'Harvard','Harvard',12,'East')
	round1[19] = FillGame('Wisconsin','Wisconsin',4,'Montana','Montana',13,'East')
	round1[20] = FillGame('Cincinatti','Cincinatti',6,'Texas','Texas',11,'East')
	round1[21] = FillGame('Florida State','Florida St',3,'St. Bonaventure','St. Bonavent',14,'East')
	round1[22] = FillGame('Gonzaga','Gonzaga',7,'West Virginia','W Virginia',10,'East')
	round1[23] = FillGame('Ohio State','Ohio State',2,'Loyola','Loyola',15,'East')
	round1[24] = FillGame('North Carolina','N Carolina',1,'Lamar','Lamar',16,'MidWest')
	round1[25] = FillGame('Creighton','Creighton',8,'Alabama','Alabama',9,'MidWest')
	round1[26] = FillGame('Temple','Temple',5,'California','California',12,'MidWest')
	round1[27] = FillGame('Michigan','Michigan',4,'Ohio','Ohio',13,'MidWest')
	round1[28] = FillGame('San Diego State','San Diego St',6,'NC State','NC State',11,'MidWest')
	round1[29] = FillGame('Georgetown','Georgetown',3,'Belmont','Belmont',14,'MidWest')
	round1[30] = FillGame('Saint Mary\'s','Saint Mary\'s',7,'Purdue','Purdue',10,'MidWest')
	round1[31] = FillGame('Kansas','Kansas',2,'Detroit','Detroit',15,'MidWest')
	#puts(' ')
	max_iter = 8
	isValid = 0
	
	for iter in 1..max_iter
		bRet = 1	
		
		round2, bRet = AdvanceRound(1,round1)
		if(bRet == 0)
			next
		end
		
		round3, bRet = AdvanceRound(2,round2)
		if(bRet == 0)
			next
		end
		
		round4, bRet = AdvanceRound(3,round3)
		if(bRet == 0)
			next
		end
		
		round5, bRet = AdvanceRound(4,round4)
		if(bRet == 0)
			next
		end
		
		round6, bRet = AdvanceRound(5,round5)
		if(bRet == 0)
			next
		end

		# Fill Champion
		champ, loser, bRet = DrawWinner(round6[0].get_teamA, round6[0].get_teamB)
		if(bRet == 0)
			next
		else
			#print("Round 6, Game #{0}, Champ = #{champ.get_name}, loser = #{loser.get_name}\n")
			if(iter == max_iter)
			  #puts("Max Iterations Reached");
			end
			isValid = 1
			break
		end
	end
	
	return round1, round2, round3, round4, round5, round6, champ, isValid
end  
