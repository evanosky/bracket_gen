def score_2013bracket(round1, round2, round3, round4, round5, round6)
  # This function generates a bracket score using ESPN's scoring system.
  # Each round has 320 points available

  #Round1_Winners = Array.new(32)
  #Round2_Winners = Array.new(16)
  #Round3_Winners = Array.new(8)
  #Round4_Winners = Array.new(4)
  #Round5_Winners = Array.new(2)
  #Round6_Winners = Array.new(1)
  	
  #Round0_Winners = ["Louisville", "NCAT/LIB", "Colorado State", "Missouri", "Oklahoma State", "Oregon", "Saint Louis", "New Mexico St.", \
  #                  "Memphis",  "MTSU/STM",  "Michigan State",  "Valparaiso",  "Creighton",  "Cincinnati",  "Duke",  "Albany", \
  #                  "Gonzaga", "Southern Univ.",  "Pittsburgh",  "Wichita State",  "Wisconsin",  "Mississippi",  "Kansas State",  "BSU/La Salle", \
  #                  "Arizona",  "Belmont",  "New Mexico",  "Harvard",  "Notre Dame",  "Iowa State",  "Ohio State",  "Iona", \  
  #                  "Kansas",   "Western Kentucky",  "North Carolina",  "Villanova",  "VCU",  "Akron",  "Michigan",  "South Dakota St.", \  
  #                  "UCLA",  "Minnesota",  "Florida",  "N'western St.",  "San Diego State",  "Oklahoma",  "Georgetown",  "Fla. Gulf Coast", \
  #                  "Indiana",  "LIU/JMU",  "NC State",  "Temple",  "UNLV",  "California",  "Syracuse",  "Montana", \  
  #                  "Butler",  "Bucknell",  "Marquette",  "Davidson",  "Illinois",  "Colorado",  "Miami (FL)",  "Pacific"]
  
  round1_Winners = ["Louisville", "Colorado State", "Oregon", "Saint Louis", 
                    "Memphis",  "Michigan State",  "Creighton",  "Duke", 
                    "Gonzaga", "Wichita State",  "Mississippi",  "BSU/La Salle", 	
                    "Arizona",  "Harvard",  "Iowa State",  "Ohio State",   
                    "Kansas",   "North Carolina",  "VCU",  "Michigan",   
                    "Minnesota",  "Florida",  "San Diego State",  "Fla. Gulf Coast", 
                    "Indiana",  "Temple",  "California",  "Syracuse",   
                    "Butler",  "Marquette", "Illinois",  "Miami (FL)"]
  
  round2_Winners = ["Louisville", "Oregon", "Michigan State",  "Duke", 
                    "Wichita State", "BSU/La Salle",  "Arizona",  "Ohio State", 
                    "Kansas",  "Michigan", "Florida",  "Fla. Gulf Coast", 
                    "Indiana",  "Syracuse", "Marquette", "Miami (FL)"]

  round3_Winners = ["Louisville", "Duke", "Wichita State", "Ohio State",  "Michigan",  "Florida",  "Syracuse",  "Marquette"]
  round4_Winners = ["Louisville", "Wichita State", "Michigan",  "Syracuse"]
  round5_Winners = ["Louisville", "Michigan"]
  round6_Winners = "Louisville"
      
  score = 0;
  n = 1;
  for i in 0..(32/n-1)
    if( round1_Winners[i] == round1[i].get_Winner.get_long_name )
      score = score + 10*n;
    end
  end

  n = 2;
  for i in 0..(32/n-1)
    if( round2_Winners[i] == round2[i].get_Winner.get_long_name )
      score = score + 10*n;
    end
  end
  
  n = 4;
  for i in 0..(32/n-1)
    if( round3_Winners[i] == round3[i].get_Winner.get_long_name )
      score = score + 10*n;
    end
  end

  n = 8;
  for i in 0..(32/n-1)
    if( round4_Winners[i] == round4[i].get_Winner.get_long_name )
      score = score + 10*n;
    end
  end

  n = 16;
  for i in 0..(32/n-1)
    if( round5_Winners[i] == round5[i].get_Winner.get_long_name )
      score = score + 10*n;
    end
  end

  n = 32;
  for i in 0..(32/n-1)
    if( round6_Winners[i] == round6[i].get_Winner.get_long_name )
      score = score + 10*n;
    end
  end

# disp(['Wilbon: ', num2str(240)]);
# disp(['Kornheiser: ', num2str(280)]);
# disp(['Lunardi: ', num2str(280)]);
# disp(['Vitale: ', num2str(290)]);
# disp(['Obama: ', num2str(300)]);
# disp(['Chalk: ', num2str(1120)]);
# disp(['ESPN Winner: ', num2str(1660)]);   

return score      

end  
