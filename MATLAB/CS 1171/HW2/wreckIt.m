function wreck = wreckIt(force,num,load)
    %This function determines whether or not the building will be wrecked!
    
    tot_force = force * num; %Calculates the total force on the building
    
    if tot_force > load
        wreck = true;
    elseif tot_force <= load
        wreck = false;
    end
end