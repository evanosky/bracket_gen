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
  def initialize(aName, aSeed, aRegion)
    @name = aName
    @seed = aSeed
	@region = aRegion
  end
  
  def get_name
    return @name
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
 			[ 0.5000000000, 0.5576923077, 0.5384615385, 0.7111111111, 0.8205128205, 0.7000000000, 1.0000000000, 0.7924528302, 0.9298245614, 1.0000000000, 0.4000000000, 1.0000000000, 1.0000000000, -1.000000000, -1.000000000, 1.0000000000 ],
 			[ 0.4423076923, 0.5000000000, 0.6222222222, 0.4285714286, 0.2500000000, 0.7407407407, 0.7343750000, 0.4000000000, -1.000000000, 0.5750000000, 0.9090909091, 1.0000000000, -1.000000000, -1.000000000, 0.9629629630, -1.000000000 ],
 			[ 0.4615384615, 0.3777777778, 0.5000000000, 0.8000000000, 0.6666666667, 0.5593220339, 0.7500000000, 1.0000000000, 1.0000000000, 0.5833333333, 0.6764705882, -1.000000000, -1.000000000, 0.8518518519, -1.000000000, -1.000000000 ],
 			[ 0.2888888889, 0.5714285714, 0.2000000000, 0.5000000000, 0.5254237288, 0.6666666667, 1.0000000000, 0.3333333333, 1.0000000000, 1.0000000000, -1.000000000, 0.5925925926, 0.7870370370, 1.0000000000, -1.000000000, -1.000000000 ],
 			[ 0.1794871795, 0.7500000000, 0.3333333333, 0.4745762712, 0.5000000000, 0.5000000000, -1.000000000, 0.3333333333, 0.5000000000, 1.0000000000, -1.000000000, 0.6666666667, 0.7857142857, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.3000000000, 0.2592592593, 0.4406779661, 0.3333333333, 0.5000000000, 0.5000000000, 0.5000000000, 0.0000000000, -1.000000000, 0.6666666667, 0.6666666667, -1.000000000, -1.000000000, 0.8461538462, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.2656250000, 0.2500000000, 0.0000000000, -1.000000000, 0.5000000000, 0.5000000000, 0.0000000000, -1.000000000, 0.6018518519, 0.0000000000, -1.000000000, -1.000000000, 1.0000000000, 1.0000000000, -1.000000000 ],
 			[ 0.2075471698, 0.6000000000, 0.0000000000, 0.6666666667, 0.6666666667, 1.0000000000, 1.0000000000, 0.5000000000, 0.4722222222, -1.000000000, 1.0000000000, 0.0000000000, 1.0000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0701754386, -1.000000000, 0.0000000000, 0.0000000000, 0.5000000000, -1.000000000, -1.000000000, 0.5277777778, 0.5000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.4250000000, 0.4166666667, 0.0000000000, 0.0000000000, 0.3333333333, 0.3981481481, -1.000000000, -1.000000000, 0.5000000000, 0.0000000000, -1.000000000, -1.000000000, 1.0000000000, 1.0000000000, -1.000000000 ],
 			[ 0.6000000000, 0.0909090909, 0.3235294118, -1.000000000, -1.000000000, 0.3333333333, 1.0000000000, 0.0000000000, -1.000000000, 1.0000000000, 0.5000000000, -1.000000000, -1.000000000, 1.0000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, 0.0000000000, -1.000000000, 0.4074074074, 0.3333333333, -1.000000000, -1.000000000, 1.0000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000, 0.8750000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ 0.0000000000, -1.000000000, -1.000000000, 0.2129629630, 0.2142857143, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, -1.000000000, 0.1250000000, 0.5000000000, -1.000000000, -1.000000000, -1.000000000 ],
 			[ -1.000000000, -1.000000000, 0.1481481481, 0.0000000000, -1.000000000, 0.1538461538, 0.0000000000, -1.000000000, -1.000000000, 0.0000000000, 0.0000000000, -1.000000000, -1.000000000, 0.5000000000, -1.000000000, -1.000000000 ],
 			[ -1.000000000, 0.0370370370, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, 0.0000000000, -1.000000000, -1.000000000, -1.000000000, -1.000000000, 0.5000000000, -1.000000000 ],
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

def FillGame(aTeamA_name,aTeamA_seed,aTeamB_name,aTeamB_seed,aRegion)
	# This function is used to generate the known, round 1 games established by the selection committee
	myGame = Game.new
	myGame.set_teamA(Team.new(aTeamA_name,aTeamA_seed,aRegion))
	myGame.set_teamB(Team.new(aTeamB_name,aTeamB_seed,aRegion))
	#print("#{myGame.get_teamA.get_region} Region: ##{myGame.get_teamA.get_seed} #{myGame.get_teamA.get_name} vs. ##{myGame.get_teamB.get_seed} #{myGame.get_teamB.get_name}\n")
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
	round1[0] = FillGame('Kentucky',1,'Miss Valley State',16,'South')
	round1[1] = FillGame('Iowa State',8,'Uconn',9,'South')
	round1[2] = FillGame('Wichita State',5,'VCU',12,'South')
	round1[3] = FillGame('Indiana',4,'New Mexico State',13,'South')
	round1[4] = FillGame('UNLV',6,'Colorado',11,'South')
	round1[5] = FillGame('Baylor',3,'South Dakota St.',14,'South')
	round1[6] = FillGame('Notre Dame',7,'Xavier',10,'South')
	round1[7] = FillGame('Duke',2,'Lehigh',15,'South')
	round1[8] = FillGame('Michigan State',1,'LIU Brooklyn',16,'West')
	round1[9] = FillGame('Memphis',8,'Saint Louis',9,'West')
	round1[10] = FillGame('New Mexico',5,'Long Beach State',12,'West')
	round1[11] = FillGame('Louisville',4,'Davidson',13,'West')
	round1[12] = FillGame('Murray State',6,'Colorado State',11,'West')
	round1[13] = FillGame('Marquette',3,'Iona',14,'West')
	round1[14] = FillGame('Florida',7,'Virginia',10,'West')
	round1[15] = FillGame('Missouri',2,'Norfolk State',15,'West')
	round1[16] = FillGame('Syracuse',1,'UNC-Ashville',16,'East')
	round1[17] = FillGame('Kansas State',8,'Southern Miss',9,'East')
	round1[18] = FillGame('Vanderbilt',5,'Harvard',12,'East')
	round1[19] = FillGame('Wisconsin',4,'Montana',13,'East')
	round1[20] = FillGame('Cincinatti',6,'Texas',11,'East')
	round1[21] = FillGame('Florida State',3,'St. Bonaventure',14,'East')
	round1[22] = FillGame('Gonzaga',7,'West Virginia',10,'East')
	round1[23] = FillGame('Ohio State',2,'Loyola',15,'East')
	round1[24] = FillGame('North Carolina',1,'Lamar',16,'MidWest')
	round1[25] = FillGame('Creighton',8,'Alabama',9,'MidWest')
	round1[26] = FillGame('Temple',5,'California',12,'MidWest')
	round1[27] = FillGame('Michigan',4,'Ohio',13,'MidWest')
	round1[28] = FillGame('San Diego State',6,'NC State',11,'MidWest')
	round1[29] = FillGame('Georgetown',3,'Belmont',14,'MidWest')
	round1[30] = FillGame('Saint Mary\'s',7,'Purdue',10,'MidWest')
	round1[31] = FillGame('Kansas',2,'Detroit',15,'MidWest')
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

round1, round2, round3, round4, round5, round6, champ, isValid = gen_bracket
