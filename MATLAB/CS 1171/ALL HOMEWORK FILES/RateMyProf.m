function [avg, ids] = RateMyProf(ratings)
    id = ratings(1,:);
    rating = ratings(2,:);
    high = [];
    lowId = [];
    lowScore = [];
    for i = 1:3
        [ma,ind] = max(rating);
        high(end+1) = ma;
        rating(ind) = [];
        id(ind) = [];
        [mi, ind2] = min(rating);
        lowScore(end+1) = mi;
        lowId(end+1) = id(ind2);
        rating(ind2) = [];
        id(ind2) = [];
    end
    [~,index] = sort(lowScore,'ascend');
    ids = lowId(index);
    avg = mean(high);
end