function cipher = caesar(input, shift)
    shift = mod(shift,26);
    letters = (input >='a' & input <= 'z') | (input >= 'A' & input <= 'Z');
    dub = double(input(letters));
    shifted = dub + shift;
    cipher = input;
    cipher(letters) = char(shifted);
end