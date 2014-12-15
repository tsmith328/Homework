%------------------------------------------------------------------------------------------------------------------------
%Click run to load the test cases
%------------------------------------------------------------------------------------------------------------------------
athletes1 = struct('Name', {'Michael Phlelps','Ryan Lochte','Gunnar Bentz','Kobe Brian','Shawn White','Mark Spitz'},...
	'Gold',{20, 5, 6, 2, 3, 7}, 'Silver',{1, 3, 3, 0, 0, 0},'Bronze', {3, 1, 0, 1, 2, 0});

athletes2 = struct('Name', {'Yannick Agnel','Alain Bernard','Jeremy Stravius','Fabion Gilot'},...
	'Gold',{2, 1, 3, 0}, 'Silver',{0, 7, 2, 2},'Bronze', {2, 0, 2, 4});

athletes3 = struct('Name', {'Caesar Cielo','Marcelo Chergini','Raphael Blanes'},...
	'Gold',{0, 2, 0}, 'Silver',{1, 0, 0},'Bronze', {3, 2, 0});


competitors1 = struct('Country',{'America', 'France', 'Brazil'},'Athletes', {athletes1, athletes2, athletes3});
%-----------------------------------------------------------------------------------------------------------------------

athletes4 = struct('Name', {'Naruto Uzimaki','Sasuke Uchiha','Tobi a.k.a Obita', 'The Six Paths of Pain', 'The Pervy Sage'},...
	'Gold',{2, 1, 0, 4, 2}, 'Silver',{0, 3, 4, 2, 1},'Bronze', {0, 0, 0, 2, 1});

athletes5 = struct('Name', {'Pikachu', 'Charazard', 'Zaptos', 'Entei', 'Lugio'},...
	'Gold',{5, 3, 1, 2, 6}, 'Silver',{2, 0, 1, 3, 4},'Bronze', {7, 4, 2, 1, 0});

athletes6 = struct('Name', {'James Magnusson','Ian Thorpe','Grant Hackett'},...
	'Gold',{4, 1, 2}, 'Silver',{0, 2, 3},'Bronze', {0, 3, 5});

competitors3 = struct('Country',{'Naruto Shippuden', 'Pokemon', 'Australia'},'Athletes', {athletes4, athletes5, athletes6});

athletes7 = struct('Name', {'AndyQua'},...
	'Gold',{30}, 'Silver',{1},'Bronze', {0});

athletes8 = struct('Name', {'Usain Bolt','Asafa Powell','Yohan Blake'},...
	'Gold',{3, 1, 2}, 'Silver',{0, 7, 2},'Bronze', {2, 0, 2});

athletes9 = struct('Name', {'Sukara Abee','Nobuyuki Tsujii','Kosuke Kitajima','Kosuke Hagino'},...
	'Gold',{10, 2, 0, 2}, 'Silver',{1, 9, 2, 4},'Bronze', {1, 0, 1, 0});

competitors4 = struct('Country',{'Vietnam', 'Jamaica', 'Japanese'},'Athletes', {athletes7, athletes8, athletes9});

%-----------------------------------------------------------------------------------------------------------------------

competitors2 = [competitors1; competitors3; competitors4];

