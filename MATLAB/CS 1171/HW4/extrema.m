function vert = extrema(func)
    [~ , a] = strtok(func,'=');
    [aVal , func1] = strtok(a,'=+-');
    aConst = strtok(aVal,'x');
    
    [b , func2] = strtok(func1,'+-');
    bConst = strtok(b,'x');
    
    c = func2;
    
   aNum = str2num(aConst);
   bNum = str2num(bConst);
   cNum = str2num(c);
   
   x = -bNum./( 2.*aNum);
   y = aNum.*x.^2 + bNum.*x + cNum;
   vert = [x,y];
end