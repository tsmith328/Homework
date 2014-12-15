function replaced = arrayReplace(arr1, arr2, num)
    log = arr1 == num;
    arr1(log) = arr2(log);
    replaced = arr1;
end