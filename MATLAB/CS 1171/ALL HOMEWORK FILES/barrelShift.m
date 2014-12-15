function BS = barrelShift(vect, num)
    num = mod(num, length(vect));
    if num < 0
        num = length(vect) + num;
    end
    for i = 1:num
        copy = vect;
        vect(1) = copy(end);
        vect(2:end) = copy(1:end-1);
    end
    BS = vect;
end