ABCs_hw12_pretest
%checkImage
out1 = checkImage('apples.png', 'oranges.png');
out2 = checkImage('flower1.png', 'flower2.png');
out3 = checkImage('oranges.png', 'tangerines.png');
soln1 = checkImage_soln('apples.png', 'oranges.png');
soln2 = checkImage_soln('flower1.png', 'flower2.png');
soln3 = checkImage_soln('oranges.png', 'tangerines.png');
d = 'The RGB values are different.';
if isequal(d,out1)
    pic1 = isequal(imread('applesVSoranges.png'),imread('applesVSoranges.soln.png'));
else
    pic1 = true;
end
if isequal(d,out2)
    pic2 = isequal(imread('flower1VSflower2.png'),imread('flower1VSflower2.soln.png'));
else
    pic2 = true;
end
if isequal(d,out3)
    pic3 = isequal(imread('orangesVStangerines.png'),imread('orangesVStangerines.soln.png'));
else
    pic3 = true;
end
if isequal(out1,soln1)&&isequal(out2,soln2)&&isequal(out3,soln3)
    part1 = pic1&&pic2&&pic3;
else
    part1 = false;
end

%puzzle
out1 = puzzle('p.png', 'p1.png', 'p2.png');
out2 = puzzle('q.png', 'q1.png', 'q2.png');
out3 = puzzle('r.png', 'r1.png', 'r2.png');
soln1 = puzzle_soln('p.png', 'p1.png', 'p2.png');
soln2 = puzzle_soln('q.png', 'q1.png', 'q2.png');
soln3 = puzzle_soln('r.png', 'r1.png', 'r2.png');

if isequal(out1,soln1)&&isequal(out2,soln2)&&isequal(out3,soln3)
    part2 = true;
else
    part2 = false;
end

%smurfed
smurfed('channing.png');
smurfed('jennifer.png');
smurfed('ryan.png');
smurfed_soln('channing.png');
smurfed_soln('jennifer.png');
smurfed_soln('ryan.png');
celeb1 = imread('channing_smurf.png');
celeb1soln = imread('channing_smurf.soln.png');
case1 = isequal(celeb1,celeb1soln);
case2 = isequal(imread('jennifer_smurf.png'),imread('jennifer_smurf.soln.png'));
case3 = isequal(imread('ryan_smurf.png'),imread('ryan_smurf.soln.png'));
part3 = case1&&case2&&case3;

%CBN
[nums1] = colorByNumber2('spiderman2.png','crayonBox.xls');
[nums2] = colorByNumber2('mario5.png','crayonBox.xls');
[numssoln1] = colorByNumber2_soln('spiderman2.png','crayonBox.xls');
[numssoln2] = colorByNumber2_soln('mario5.png','crayonBox.xls');
arrs = isequal(nums1,numssoln1)&&isequal(nums2,numssoln2);
[equal1, ~] = system(['fc ' 'spiderman.txt' ' ' 'spiderman.soln.txt']);
[equal2, ~] = system(['fc ' 'mario.txt' ' ' 'mario.soln.txt']);
files = (equal1==0)&&(equal2==0);
if arrs&&files
    part4 = true;
else
    part4 = false;
end

%barcode
barcode('Apples', 1.25, 'apples.png', [183, 149]);
barcode('Zebra', .52, 'zebra.png', [30, 100]);
barcode('Toyota', 1, 'yoda.png', [257, 158]);
barcode_soln('Apples', 1.25, 'apples.png', [183, 149]);
barcode_soln('Zebra', .52, 'zebra.png', [30, 100]);
barcode_soln('Toyota', 1, 'yoda.png', [257, 158]);
case1 = isequal(imread('barcodedapples.png'),imread('barcodedapples.soln.png'));
case2 = isequal(imread('barcodedzebra.png'),imread('barcodedzebra.soln.png'));
case3 = isequal(imread('barcodedyoda.png'),imread('barcodedyoda.soln.png'));
if (case1&&case2&&case3)
    part5 = true;
else
    part5 = false;
end

%final
if part1&&part2&&part3&&part4&&part5
    hw12 = true
else
    hw12 = false
end

close all