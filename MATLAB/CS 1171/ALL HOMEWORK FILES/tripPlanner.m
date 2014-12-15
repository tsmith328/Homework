function price = tripPlanner(school,area,bus)
    %Calculates the price each student must pay for the field trip.
    
    [totalStu, secondStu] = schoolRoster(school); %Retrieves student data.
    students = ceil(totalStu .* secondStu); %Finds number of second graders.
    
    [miles, gasPrice, tax] = cityInfo(area); %Gathers data on the trip.
    mpg = busInfo(miles,bus); %Determines mpg for bus over trip.
    
    %Calculate price of gas.
    gallons = miles ./ mpg;
    gasTot = gallons .* gasPrice;
    gasEach = gasTot ./ students;
    
    %Calculate ticket price with tax.
    tixPrice = ticketPrice(area,miles,students);
    ticket = tixPrice .* (1+tax);
    
    %Calculating price for each student:
    price1 = 40 + ticket + gasEach;
    price = 10 .\ round(10 .* price1);
end