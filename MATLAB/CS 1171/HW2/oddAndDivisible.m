function answer = oddAndDivisible(num, d1, d2)
    %A function to test whether or not num is odd and divisible by both d1
    %and d2. v1.2
    
    %Pre-setting boolean values
    odd = false;
    d1_bool = false;
    d2_bool = false;
    
    %Logical tests:
    if (mod(num,2) == 1)
        odd = true;
    end
    
    if (mod(num,d1) == 0)
        d1_bool = true;
    end
    
    if (mod(num,d2) == 0)
        d2_bool = true;
    end
    
    %Final analysis:
    
    if odd && d1_bool && d2_bool %Edited Jan. 14, 2014: 14:44. Used & operator in place of and() function.
        answer = true;
    else
        answer = false;
    end
end