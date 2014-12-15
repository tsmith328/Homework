function [winner, mostMedals] = myOlympics(countries)
    %I do declare these Olympic Games to be open!
    [n, m] = size(countries);
    maxMedals = 0;
    maxCountry = 0;
    for i = (1:n)
        for j = (1:m)
            aths = countries(i,j).Athletes;
            countryTotal = 0;
            for k = (1:length(aths))
                athMedals = aths(k).Gold + aths(k).Silver + aths(k).Bronze;
                if athMedals > maxMedals
                    bestAth = aths(k).Name;
                    maxMedals = athMedals;
                    bestAthCountry = countries(i,j).Country;
                end
                countryTotal = countryTotal + athMedals;
            end
            if countryTotal > maxCountry
                bestCountry = countries(i,j).Country;
                maxCountry = countryTotal;
            end
        end
    end
    winner = struct('Winning_Country', bestCountry, 'Total_Medals', maxCountry);
    mostMedals = struct('Most_Decorated_Star', bestAth, 'Country', bestAthCountry, 'Medals', maxMedals);
end