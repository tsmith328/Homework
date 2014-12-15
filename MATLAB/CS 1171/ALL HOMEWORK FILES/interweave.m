function mixed = interweave(left, right)
    totalLen = 2*max(length(left),length(right));
    mixed = zeros(1,totalLen);
    evens = 2:2:totalLen;
    odds = 1:2:totalLen-1;
    if length(left) < length(right)
        odds = odds(1:length(left));
    elseif length(right) < length(left)
        evens = evens(1:length(right));
    end
    leftInd = 1:length(left);
    rightInd = 1:length(right);
    mixed(evens) = right(rightInd);
    mixed(odds) = left(leftInd);
end