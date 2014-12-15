function winner = myFootball(teams, records, difficulties)
    %Determines which team will win the Super Bowl!

   [team1, team2SemiColon] = strtok(teams,';');
   team2 = strtok(team2SemiColon,';');
   
   if records(2) == 0
       record1 = records(1);
   else
       record1 = records(1) ./ records(2);
   end
   
   if records(4) == 0
       record2 = records(3);
   else
       record2 = records(3) ./ records(4);
   end
   
   [multi1, multi2Semi] = strtok(difficulties,';');
   multi2 = strtok(multi2Semi,';');
   
   switch multi1
       case 'Hard'
           skill1 = record1 .* 100;
       case 'Medium'
           skill1 = record1 .* 75;
       case 'Easy'
           skill1 = record1 .* 50;
   end
   
   switch multi2
       case 'Hard'
           skill2 = record2 .* 100;
       case 'Medium'
           skill2 = record2 .* 75;
       case 'Easy'
           skill2 = record2 .* 50;
   end
   
   if skill1 > skill2
       winner = sprintf('%s win the Superbowl!', team1);
   elseif skill2 > skill1
       winner = sprintf('%s win the Superbowl!', team2);
   else
       winner = 'Tie Ballgame!';
   end
end