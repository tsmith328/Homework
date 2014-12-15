function TMNT(menu, limit)
  fileIn = fopen(menu,'r');
  limPrice = str2double(limit(2:end));
  [name, ext] = strtok(menu,'.');
  fileOut = fopen([name, '_order', ext],'w');
  fprintf(fileOut, '%s', fgets(fileIn));