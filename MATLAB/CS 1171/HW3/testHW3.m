function hw3 = testHW3
    %rate my prof
    A = [23, 12, 24, 25, 91, 41;
       100, 95, 90, 25, 59.9, 69];
    [avg, ID] = RateMyProf(A);
    [avgs,IDs] = RateMyProf_soln(A);
    B = [13,66,33,25,64,32,62,76,14;56,43,32,54,76,87,12,44,31];
    [avg2,ID2] = RateMyProf(B);
    [avgs2,IDs2] = RateMyProf_soln(B);
    part1 = isequal(avg,avgs)&&isequal(avg2,avgs2)&&isequal(ID,IDs)&&isequal(ID2,IDs2);
    
    %angPlane
    out1 = angPlane([11,0], [0 23], [0 0]);
    outs1 = angPlane_soln([11,0],[0,23],[0,0]);
    out2 = angPlane([10 9], [-2 4], [0 1]);
    outs2 = angPlane_soln([10 9], [-2 4], [0 1]);
    out3 = angPlane([12 13 89], [-23 11 -9], [0 1 -1]);
    outs3 = angPlane_soln([12 13 89], [-23 11 -9], [0 1 -1]);
    part2 = isequal(out1,outs1)&&isequal(out2,outs2)&&isequal(out3,outs3);
    
    %stretchArr
    arr1 = [45 67 12 4 ;
          3  12 43 1 ;  
          2  1  4  6 ;
          34 12 7 55];
    out1 = stretchArr(arr1, 0.5);
    outs1 = stretchArr(arr1, 0.5);
    arr2 = [21 3 4];
    out2 = stretchArr(arr2, 3);
    outs2 = stretchArr(arr2, 3);
    arr3 = [240 45 56; 
         23  5  18];
    out3 = stretchArr(arr3, 1);
    outs3 = stretchArr(arr3, 1);
    part3 = isequal(out1,outs1)&&isequal(out2,outs2)&&isequal(out3,outs3);

    %arrayReplace
    arr1 = [9 9 9 9;
            9 7 7 9;
            9 7 7 9;
            9 9 9 9];
    arr2 = [5 5 5 5;
            5 0 1 5;
            5 2 3 5;
            5 5 5 5];

    out1 = arrayReplace(arr1, arr2, 7);
    outs1 = arrayReplace_soln(arr1, arr2, 7);
    out2 = arrayReplace(arr1, arr2, 9);
    outs2 = arrayReplace_soln(arr1, arr2, 9);
    out3 = arrayReplace(arr1, arr2, 6);
    outs3 = arrayReplace_soln(arr1, arr2, 6);
    part4 = isequal(out1,outs1)&&isequal(out2,outs2)&&isequal(out3,outs3);
    
    %barrelShift
    A = [4 5 6 7 8];
    B = [1 5 2 6 3 7 4 8];
    C = [2 10 5 7 1 12 8 6 3 4 9 11];
    s1 = barrelShift(A, 2);
    ss1 = barrelShift(A, 2);
    s2 = barrelShift(B, 5);
    ss2 = barrelShift(B, 5);
    s3 = barrelShift(C, 33);
    ss3 = barrelShift(C, 33);
    s4 = barrelShift(C, -3);
    ss4 = barrelShift(C, -3);
    part5 = isequal(s1,ss1)&&isequal(s2,ss2)&&isequal(s3,ss3)&&isequal(s4,ss4);
   
    %polarVortex
    temps1 = [NaN NaN NaN 49 52 35 37;
              51 51 25 47 49 49 64; 
              59 58 58 52 46 43 44 ;
              48 58 50 42 46 46 49;
              51 55 53 49 48 48 NaN];
    temps2 = [NaN NaN NaN NaN NaN NaN 85;
              82 75 76 81 73 71 74;
              76 74 73 81 83 82 75;
              72 74 75 48 43 56 69;
              73 75 81 83 77 73 74;
              78 NaN NaN NaN NaN NaN NaN];
    drop1 = polarVortex(temps1);
    drop2 = polarVortex(temps2);
    soln1 = polarVortex_soln(temps1);
    soln2 = polarVortex_soln(temps2);
    part6 = isequal(drop1,soln1)&&isequal(drop2,soln2);
    
    hw3 = part1&&part2&&part3&&part4&&part5&&part6;
end