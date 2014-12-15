function [perKid wasted] = candy(size,kids)
    wasted = mod(size,kids);
    perKid = floor(size/kids);
end
    