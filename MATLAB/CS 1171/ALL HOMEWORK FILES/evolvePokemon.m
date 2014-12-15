function result = evolvePokemon(pokedex, pokemon)
    %Determines the evolutionary line of a pokemon. Yells at you if you don't provide a valid pokemon.
    i = 1;
    evLine = {pokemon};
    evNum = 1;
    poke = pokemon;
    name = pokedex(1).Name;
    while true
        if i == length(pokedex)
            result = [pokemon, ' is not a Pokemon.'];
            break;
        end
        if strcmpi(name,poke);
            name = pokedex(i).Evolution;
            poke = name;
            if isempty(name)
                result = evLine;
                break;
            end
            evLine(evNum + 1) = {name};
            evNum = evNum + 1;
            i = 1;
            name = pokedex(i).Name;
            continue;
        else
            i = i + 1;
            name = pokedex(i).Name;
        end
    end
end