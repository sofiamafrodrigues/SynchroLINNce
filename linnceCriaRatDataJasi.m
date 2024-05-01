function RatData = linnceCriaRatDataJasi(fName)
% Rotina desenvolvida por Vinícius Cota @ 06/10/2016
% LINNce / DEPEL / UFSJ
% Objetivo é criar uma estrutura que contenha todas as informações
% importantes sobre os animais e o salve em um arquivo
%   fName: nome do arquivo que conterá a estrutura

%Inserindo os dados dos animais============================================
%==========================================================================
% Campos da estrutura RatData:
% mRat: literal, nome do rato
% tfb: inteiro, tempo final do registro basal. Coincide com o início da
%    infusão
% tfi: tempo final da infusão. Coincide com o tempo da MIO ou CTCG, exceto
%    para os grupos em que se fez a infusão até o limiar médio de CTRL
% tmio: tempo para o disparo da mioclonia
% tctcg: tempo para o dispara da CTCG
% fName: nome do arquivo do registro LFP em formato Matlab
% mGrupo: número do grupo, dessa forma:
%   1 - CTRL-CTCG
%   2 - CTRL-MIO
%   3 - NPS-CTCG
%   4 - NPS-MIO
%   5 - NPS-LCTCG
%   6 - NPS-LMIO
%   7 - NPSCONT-LCTCG 

% Fs: frequência de amostragem

% Critério para exclusão: muito ruído/artefato no período de infusão/estimulação (principalmente)

RatData(1) = struct('mRat', 'r048', 'tfb', 42, 'tfi', 165, 'taba', 118, 'tmio', 120, 'timio', 72.3, 'tfmio', 100.8, 'tctcg', 165, 'tift', 127.5, 'tfft', 163.3, 'tifc', 163.3, 'tffc', 187.7, 'fName', 'r048_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
RatData(2) = struct('mRat', 'r052', 'tfb', 10, 'tfi', 144, 'taba', 85, 'tmio', 91, 'timio', 86.2, 'tfmio', 111.1, 'tctcg', 144, 'tift', 133.6, 'tfft', 170.5, 'tifc', 170.5, 'tffc', 189.4, 'fName', 'r052_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
% Animal 55 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 55 removido por possuir muito artefato no hipocampo, no registro filtrado
% RatData(3) = struct('mRat', 'r055', 'tfb', 18, 'tfi', 159, 'taba', 104, 'tmio', 109, 'tctcg', 159, 'fName', 'r055_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
% Animal 56 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 56 removido por possuir muito artefato no hipocampo, no registro filtrado
% RatData(4) = struct('mRat', 'r056', 'tfb', 22, 'tfi', 114, 'taba', 63, 'tmio', 71, 'tctcg', 114, 'fName', 'r056_sf2.mat', 'mGrupo', 1, 'Fs', 1000); 
RatData(5) = struct('mRat', 'r064', 'tfb', 32, 'tfi', 134, 'taba', 82, 'tmio', 87, 'timio', 56.4, 'tfmio', 95.2, 'tctcg', 134, 'tift', 109, 'tfft', 132.4, 'tifc', 132.4, 'tffc', 148.8, 'fName', 'r064_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
RatData(6) = struct('mRat', 'r065', 'tfb', 34, 'tfi', 179, 'taba', 130, 'tmio', 132, 'timio', 99.7, 'tfmio', 131.4, 'tctcg', 179, 'tift', 146, 'tfft', 196.3, 'tifc', 196.3, 'tffc', 205.6, 'fName', 'r065_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
RatData(7) = struct('mRat', 'r066', 'tfb', 31, 'tfi', 178, 'taba', 115, 'tmio', 123, 'timio', 94.6, 'tfmio', 110.2, 'tctcg', 178, 'tift', 147.7, 'tfft', 167.2, 'tifc', 167.2, 'tffc', 184, 'fName', 'r066_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
% Animal 67 removido por possuir muito artefato no hipocampo, no registro filtrado
RatData(8) = struct('mRat', 'r067', 'tfb', 33, 'tfi', 172, 'taba', 71, 'tmio', 80, 'timio', 42, 'tfmio', 71.6, 'tctcg', 172, 'tift', 140.1, 'tfft', 144.7, 'tifc', 144.7, 'tffc', 155.9, 'fName', 'r067_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
RatData(9) = struct('mRat', 'r068', 'tfb', 31, 'tfi', 165, 'taba', 106, 'tmio', 115, 'timio', 88.08, 'tfmio', 104.1, 'tctcg', 165, 'tift', 139.4, 'tfft', 156.3, 'tifc', 156.3, 'tffc', 159.6, 'fName', 'r068_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
RatData(10) = struct('mRat', 'r070', 'tfb', 32, 'tfi', 189, 'taba', 99, 'tmio', 104, 'timio', 73.6, 'tfmio', 91.9, 'tctcg', 189, 'tift', 159.7, 'tfft', 184.1, 'tifc', 184.1, 'tffc', 197.9, 'fName', 'r070_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
RatData(11) = struct('mRat', 'r072', 'tfb', 54, 'tfi', 215, 'taba', 156, 'tmio', 157, 'timio', 102.3, 'tfmio', 131.9, 'tctcg', 215, 'tift', 166, 'tfft', 175.9, 'tifc', 175.9, 'tffc', 195.7, 'fName', 'r072_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
% Animal 73 removido de todas as análises por artefato em CX, HP e TH
% RatData(12) = struct('mRat', 'r073', 'tfb', 34, 'tfi', 92, 'taba', 76, 'tmio', 87, 'tctcg', 92, 'fName', 'r073_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
% Animal 74 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 74 removido por possuir muito artefato no hipocampo, no registro filtrado
% RatData(13) = struct('mRat', 'r074', 'tfb', 54, 'tfi', 201, 'taba', 156, 'tmio', 160, 'tctcg', 201, 'fName', 'r074_sf2.mat', 'mGrupo', 1, 'Fs', 1000);
% Animal 108 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 108 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 108 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(14) = struct('mRat', 'r108', 'tfb', 32, 'tfi', 131, 'taba', 74, 'tmio', 75, 'tctcg', 131, 'fName', 'r108_sf2.mat', 'mGrupo', 1, 'Fs', 1000);

RatData(15) = struct('mRat', 'r076', 'tfb', 64, 'tfi', 146, 'taba', 131, 'tmio', 146, 'timio', 82.1, 'tfmio', 116.9, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r076_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(16) = struct('mRat', 'r077', 'tfb', 32, 'tfi', 122, 'taba', 106, 'tmio', 122, 'timio', 91.2, 'tfmio', 109.8, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r077_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(17) = struct('mRat', 'r078', 'tfb', 33, 'tfi', 74, 'taba', 70, 'tmio', 74, 'timio', 41.5, 'tfmio', 56.2, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r078_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(18) = struct('mRat', 'r079', 'tfb', 32, 'tfi', 126, 'taba', 120, 'tmio', 126, 'timio', 94.1, 'tfmio', 109.4, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r079_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(19) = struct('mRat', 'r080', 'tfb', 32, 'tfi', 115, 'taba', 112, 'tmio', 115, 'timio', 79.5, 'tfmio', 107.5, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r080_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(20) = struct('mRat', 'r081', 'tfb', 76, 'tfi', 143, 'taba', 140, 'tmio', 143, 'timio', 68, 'tfmio', 80, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r081_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(21) = struct('mRat', 'r082', 'tfb', 31, 'tfi', 118, 'taba', 108, 'tmio', 118, 'timio', 86.4, 'tfmio', 111.7, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r082_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(22) = struct('mRat', 'r083', 'tfb', 35, 'tfi', 97, 'taba', 94, 'tmio', 97, 'timio', 61.5, 'tfmio', 80.1, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r083_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(23) = struct('mRat', 'r084', 'tfb', 32, 'tfi', 124, 'taba', 120, 'tmio', 124, 'timio', 92, 'tfmio', 107.9, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r084_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(24) = struct('mRat', 'r085', 'tfb', 32, 'tfi', 117, 'taba', 113, 'tmio', 117, 'timio', 85.3, 'tfmio', 107.9, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r085_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(25) = struct('mRat', 'r086', 'tfb', 32, 'tfi', 122, 'taba', 122, 'tmio', 122, 'timio', 92.3, 'tfmio', 109, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r086_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(26) = struct('mRat', 'r090', 'tfb', 41, 'tfi', 91, 'taba', 88, 'tmio', 91, 'timio', 53.1, 'tfmio', 87.5, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r090_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(27) = struct('mRat', 'r094', 'tfb', 68, 'tfi', 152, 'taba', 148, 'tmio', 152, 'timio', 86, 'tfmio', 107.8, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r094_sf2.mat', 'mGrupo', 2, 'Fs', 1000);
RatData(28) = struct('mRat', 'r186', 'tfb', 36, 'tfi', 121, 'taba', 117, 'tmio', 121, 'timio', 88, 'tfmio', 106.3, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r186_sf2.mat', 'mGrupo', 2, 'Fs', 1000); 


% Animal 92 removido por possuir muito artefato no hipocampo, no registro sem filtrar
% Animal 92 removido por possuir muito artefato no tálamo, no registro filtrado
% Animal 92 removido por possuir muito artefato no tálamo, no registro sem filtrar
% RatData(29) = struct('mRat', 'r092', 'tfb', 88, 'tfi', 275, 'taba', 156, 'tmio', 162,'timio', 72.7, 'tfmio', 93.6, 'tctcg', 275, 'tift', 189.2, 'tfft', 216.3, 'tifc', 216.3, 'tffc', 225.1, 'fName', 'r092_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
RatData(30) = struct('mRat', 'r093', 'tfb', 39, 'tfi', 168, 'taba', 90, 'tmio', 105, 'timio', 70.5, 'tfmio', 85.1, 'tctcg', 168, 'tift', 130.6, 'tfft', 171.8, 'tifc', 171.8, 'tffc', 181.8, 'fName', 'r093_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 95 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 95 removido por possuir muito artefato no hipocampo, no registro sem filtrar
% Animal 95 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(31) = struct('mRat', 'r095', 'tfb', 27, 'tfi', 224, 'taba', 114, 'tmio', 122, 'timio', 101.6, 'tfmio', 118.5, 'tctcg', 224, 'tift', [], 'tfft', [], 'tifc', 198.2, 'tffc', 219.6, 'fName', 'r095_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 98 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 98 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(32) = struct('mRat', 'r098', 'tfb', 59, 'tfi', 176, 'taba', [], 'tmio', 126, 'timio', 75.1, 'tfmio', 94.1, 'tctcg', 176, 'tift', 122.4, 'tfft', 143.4, 'tifc', 143.4, 'tffc', 147.6, 'fName', 'r098_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 99 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 99 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(33) = struct('mRat', 'r099', 'tfb', 32, 'tfi', 174, 'taba', 113, 'tmio', 116, 'timio', 84.3, 'tfmio', 106.9, 'tctcg', 174, 'tift', 145.7, 'tfft', 148.7, 'tifc', 148.7, 'tffc', 200.6, 'fName', 'r099_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 105 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 105 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(34) = struct('mRat', 'r105', 'tfb', 46, 'tfi', 193, 'taba', 119, 'tmio', 128, 'timio', 79.3, 'tfmio', 107.9, 'tctcg', 193, 'tift', 148.1, 'tfft', 162.8, 'tifc', 162.8, 'tffc', 184.4, 'fName', 'r105_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 106 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 106 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(35) = struct('mRat', 'r106', 'tfb', 39, 'tfi', 200, 'taba', 148, 'tmio', 153, 'timio', 121.2, 'tfmio', 134.4, 'tctcg', 200, 'tift', 163.9, 'tfft', 208.1, 'tifc', 208.1, 'tffc', 222.4, 'fName', 'r106_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 107 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 107 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 107 removido por possuir muito artefato no tálamo, no registro filtrado
% Animal 107 removido por possuir muito artefato no córtex, no registro sem filtrar
% Animal 107 removido por possuir muito artefato no tálamo, no registro sem filtrar
% RatData(36) = struct('mRat', 'r107', 'tfb', 112, 'tfi', 338, 'taba', 205, 'tmio', 218, 'tctcg', 338, 'fName', 'r107_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 109 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 109 removido por possuir muito artefato no córtex, no registro sem filtrar
% Animal 109 removido por possuir muito artefato no hipocampo, no registro sem filtrar
% Animal 109 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(37) = struct('mRat', 'r109', 'tfb', 26, 'tfi', 143, 'taba', 87, 'tmio', 88, 'timio', 85.2, 'tfmio', 95.8, 'tctcg', 143, 'tift', 119, 'tfft', 168.8, 'tifc', 168.8, 'tffc', 183.4, 'fName', 'r109_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 112 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 112 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(38) = struct('mRat', 'r112', 'tfb', 32, 'tfi', 192, 'taba', 125, 'tmio', 131, 'timio', 98.2, 'tfmio', 126.5, 'tctcg', 192, 'tift', 163, 'tfft', 197.2, 'tifc', 197.2, 'tffc', 212.8, 'fName', 'r112_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 114 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 114 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(39) = struct('mRat', 'r114', 'tfb', 35, 'tfi', 170, 'taba', 106, 'tmio', 117, 'timio', 83.9, 'tfmio', 101.8, 'tctcg', 170, 'tift', 135.6, 'tfft', 198.7, 'tifc', 198.7, 'tffc', 207, 'fName', 'r114_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 115 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 115 removido por possuir muito artefato no hipocampo, no registro sem filtrar
RatData(40) = struct('mRat', 'r115', 'tfb', 32, 'tfi', 199, 'taba', 133, 'tmio', 137, 'timio', 106.8, 'tfmio', 132.5, 'tctcg', 199, 'tift', 168, 'tfft', 190.9, 'tifc', 190.9, 'tffc', 193.7, 'fName', 'r115_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
RatData(41) = struct('mRat', 'r116', 'tfb', 57, 'tfi', 174, 'taba', 149, 'tmio', 151, 'timio', 96.2, 'tfmio', 114, 'tctcg', 174, 'tift', 114, 'tfft', 119.1, 'tifc', 119.1, 'tffc', 134.8, 'fName', 'r116_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 117 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 117 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(42) = struct('mRat', 'r117', 'tfb', 35, 'tfi', 164, 'taba', 98, 'tmio', 109, 'timio', 75, 'tfmio', 94.8, 'tctcg', 164, 'tift', 129.6, 'tfft', 137.3, 'tifc', 137.3, 'tffc', 140.9, 'fName', 'r117_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
% Animal 118 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 118 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(43) = struct('mRat', 'r118', 'tfb', 36, 'tfi', 246, 'taba', 126, 'tmio', 129, 'timio', 94.6, 'tfmio', 111.3, 'tctcg', 246, 'tift', [], 'tfft', [], 'tifc', 212.6, 'tffc', 235.9, 'fName', 'r118_sf2.mat', 'mGrupo', 3, 'Fs', 1000);
RatData(44) = struct('mRat', 'r119', 'tfb', 105, 'tfi', 208, 'taba', 139, 'tmio', 149, 'timio', 43.2, 'tfmio', 77.2, 'tctcg', 208, 'tift', 107.2, 'tfft', 122.9, 'tifc', 122.9, 'tffc', 193.9, 'fName', 'r119_sf2.mat', 'mGrupo', 3, 'Fs', 1000);


% Animal 133 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 133 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(45) = struct('mRat', 'r133', 'tfb', 33, 'tfi', 114, 'taba', 111, 'tmio', 114, 'timio', 82.6, 'tfmio', 107.4, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r133_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
RatData(46) = struct('mRat', 'r134', 'tfb', 31, 'tfi', 121, 'taba', 89, 'tmio', 121, 'timio', 88.9, 'tfmio', 110.3, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r134_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
% Animal 135 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(47) = struct('mRat', 'r135', 'tfb', 50, 'tfi', 131, 'taba', 128, 'tmio', 131, 'timio', 82.4, 'tfmio', 96.7, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r135_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
RatData(48) = struct('mRat', 'r136', 'tfb', 32, 'tfi', 77, 'taba', 72, 'tmio', 77, 'timio', 42.4, 'tfmio', 66, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r136_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
RatData(49) = struct('mRat', 'r137', 'tfb', 32, 'tfi', 136, 'taba', 132, 'tmio', 136, 'timio', 102.4, 'tfmio', 109.9, 'tctcg', 142, 'tift', 120.1, 'tfft', 126.2, 'tifc', 110.2, 'tffc', 120.1, 'fName', 'r137_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
% Animal 138 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(50) = struct('mRat', 'r138', 'tfb', 32, 'tfi', 159, 'taba', 155, 'tmio', 159, 'timio', 128.8, 'tfmio', 147.7, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r138_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
% Animal 139 removido por possuir muito artefato no hipocampo, no registro filtrado
RatData(51) = struct('mRat', 'r139', 'tfb', 59, 'tfi', 164, 'taba', 154, 'tmio', 164, 'timio', 106.9, 'tfmio', 137.6, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r139_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
RatData(52) = struct('mRat', 'r140', 'tfb', 39, 'tfi', 142, 'taba', 128, 'tmio', 142, 'timio', 102.7, 'tfmio', 105.9, 'tctcg', 145, 'tift', [], 'tfft', [], 'tifc', 106.2, 'tffc', 137.2, 'fName', 'r140_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
RatData(53) = struct('mRat', 'r141', 'tfb', 34, 'tfi', 153, 'taba', 132, 'tmio', 153, 'timio', 118.8, 'tfmio', 143.2, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r141_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
RatData(54) = struct('mRat', 'r142', 'tfb', 32, 'tfi', 127, 'taba', 123, 'tmio', 127, 'timio', 94.1, 'tfmio', 119.4, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r142_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
RatData(55) = struct('mRat', 'r143', 'tfb', 32, 'tfi', 131, 'taba', 124, 'tmio', 131, 'timio', 100.9, 'tfmio', 123.9, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r143_sf2.mat', 'mGrupo', 4, 'Fs', 1000);
% Animal 144 removido por possuir muito artefato no hipocampo, no registro filtrado
RatData(56) = struct('mRat', 'r144', 'tfb', 36, 'tfi', 128, 'taba', 125, 'tmio', 128, 'timio', 90.7, 'tfmio', 117, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r144_sf2.mat', 'mGrupo', 4, 'Fs', 1000);

% Animal 120 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(57) = struct('mRat', 'r120', 'tfb', 66, 'tfi', 206, 'taba', 139, 'tmio', 146, 'timio', 81.3, 'tfmio', 124.7, 'tctcg', 215, 'tift', 149.8, 'tfft', 164.1, 'tifc', 164.1, 'tffc', 170.3, 'fName', 'r120_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 121 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 121 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(58) = struct('mRat', 'r121', 'tfb', 31, 'tfi', 164, 'taba', 82, 'tmio', 88, 'timio', 60.7, 'tfmio', 106.1, 'tctcg', 164, 'tift', 133.4, 'tfft', 144.2, 'tifc', 144.2, 'tffc', 154.7, 'fName', 'r121_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 122 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 122 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(59) = struct('mRat', 'r122', 'tfb', 32, 'tfi', 164, 'taba', 72, 'tmio', 76, 'timio', 45.5, 'tfmio', 84.7, 'tctcg', 117, 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r122_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 123 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 123 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(60) = struct('mRat', 'r123', 'tfb', 37, 'tfi', 183, 'taba', 117, 'tmio', 135, 'timio', 98.6, 'tfmio', 134.9, 'tctcg', 201, 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r123_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 125 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(61) = struct('mRat', 'r125', 'tfb', 57, 'tfi', 173, 'taba', 152, 'tmio', 156, 'timio', 98.1, 'tfmio', 119.6, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r125_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
RatData(62) = struct('mRat', 'r126', 'tfb', 35, 'tfi', 177, 'taba', 146, 'tmio', 148, 'timio', 112.5, 'tfmio', 156.4, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r126_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 127 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 127 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(63) = struct('mRat', 'r127', 'tfb', 31, 'tfi', 182, 'taba', 111, 'tmio', 115, 'timio', 83.9, 'tfmio', 119.9, 'tctcg', 193, 'tift', [], 'tfft', [], 'tifc', 163.8, 'tffc', 168.4, 'fName', 'r127_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 128 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(64) = struct('mRat', 'r128', 'tfb', 32, 'tfi', 174, 'taba', 121, 'tmio', 127, 'timio', 95.6, 'tfmio', 121.1, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r128_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
RatData(65) = struct('mRat', 'r129', 'tfb', 37, 'tfi', 165, 'taba', 114, 'tmio', 118, 'timio', 82.2, 'tfmio', 108.7, 'tctcg', 189, 'tift', 161.4, 'tfft', 168.6, 'tifc', 150.7, 'tffc', 161.4, 'fName', 'r129_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 130 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(66) = struct('mRat', 'r130', 'tfb', 34, 'tfi', 171, 'taba', 118, 'tmio', 120, 'timio', 84.9, 'tfmio', 112.9, 'tctcg', 243, 'tift', 211.5, 'tfft', 218, 'tifc', 204.8, 'tffc', 211.5, 'fName', 'r130_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 131 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 131 removido por possuir muito artefato no hipocampo, no registro sem filtrar
% Animal 131 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(67) = struct('mRat', 'r131', 'tfb', 39, 'tfi', 152, 'taba', 97, 'tmio', 102, 'timio', 64.7, 'tfmio', 90.8, 'tctcg', 164, 'tift', 126.5, 'tfft', 153.8, 'tifc', 153.8, 'tffc', 161, 'fName', 'r131_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 132 removido por possuir muito artefato no hipocampo, no registro sem filtrar
% Animal 132 removido por possuir muito artefato no hipocampo, no registro filtrado
RatData(68) = struct('mRat', 'r132', 'tfb', 70, 'tfi', 196, 'taba', 107, 'tmio', 112, 'timio', 41.4, 'tfmio', 75.1, 'tctcg', 173, 'tift', 103.8, 'tfft', 127.3, 'tifc', 127.3, 'tffc', 164.3, 'fName', 'r132_sf2.mat', 'mGrupo', 5, 'Fs', 1000);
% Animal 173 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 173 removido por possuir muito artefato no tálamo, no registro filtrado
% Animal 173 removido por possuir muito artefato no córtex, no registro sem filtrar
% Animal 173 removido por possuir muito artefato no tálamo, no registro sem filtrar
% RatData(69) = struct('mRat', 'r173', 'tfb', 48, 'tfi', 167, 'taba', 146, 'tmio', 155, 'tctcg', 239, 'fName', 'r173_sf2.mat', 'mGrupo', 5, 'Fs', 1000);


% RatData(70) = struct('mRat', 'r146', 'tfb', 33, 'tfi', 96, 'taba', 86, 'tmio', 101, 'tctcg', [], 'fName', 'r146_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 145 removido por possuir muito artefato no hipocampo, no registro filtrado
% % Animal 145 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(71) = struct('mRat', 'r145', 'tfb', 32, 'tfi', 101, 'taba', [], 'tmio', [], 'tctcg', [], 'fName', 'r145_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 147 removido por possuir muito artefato no córtex, no registro filtrado
% % Animal 147 removido por possuir muito artefato no córtex, no registro sem filtrar
% RatData(72) = struct('mRat', 'r147', 'tfb', 34, 'tfi', 90, 'taba', [], 'tmio', [], 'tctcg', [], 'fName', 'r147_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 149 removido por enqto devido ao seu registro não ter sido encontrado no banco de dados
% % RatData(73) = struct('mRat', 'r149', 'tfb', 33, 'tfi', 109, 'taba', 97, 'tmio', [], 'tctcg', [], 'fName', 'r149_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 150 removido por possuir muito artefato no tálamo, no registro sem filtrar
% RatData(74) = struct('mRat', 'r150', 'tfb', 33, 'tfi', 95, 'taba', 87, 'tmio', 91, 'tctcg', [], 'fName', 'r150_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 151 removido por possuir artefato no córtex, durante a crise, no registro filtrado
% RatData(75) = struct('mRat', 'r151', 'tfb', 32, 'tfi', 102, 'taba', 94, 'tmio', 97, 'tctcg', [], 'fName', 'r151_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% RatData(76) = struct('mRat', 'r152', 'tfb', 32, 'tfi', 104, 'taba', 91, 'tmio', 97, 'tctcg', 104, 'fName', 'r152_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 153 removido por possuir artefato no córtex, durante a crise, no registro filtrado
% RatData(77) = struct('mRat', 'r153', 'tfb', 42, 'tfi', 112, 'taba', 102, 'tmio', 107, 'tctcg', [], 'fName', 'r153_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 156 removido por possuir muito artefato no tálamo, no registro filtrado
% % Animal 156 removido por possuir muito artefato no tálamo, no registro sem filtrar
% RatData(78) = struct('mRat', 'r156', 'tfb', 32, 'tfi', 97, 'taba', [], 'tmio', [], 'tctcg', [], 'fName', 'r156_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% RatData(79) = struct('mRat', 'r157', 'tfb', 47, 'tfi', 113, 'taba', [], 'tmio', [], 'tctcg', [], 'fName', 'r157_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% RatData(80) = struct('mRat', 'r159', 'tfb', 43, 'tfi', 95, 'taba', [], 'tmio', [], 'tctcg', [], 'fName', 'r159_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% % Animal 190 removido por enqto devido ao seu registro não ter sido convertido
% % RatData(81) = struct('mRat', 'r190', 'tfb', 37, 'tfi', 113, 'taba', [], 'tmio', [], 'tctcg', [], 'fName', 'r190_sf2.mat', 'mGrupo', 7, 'Fs', 1000);


% Animal 192 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 192 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(82) = struct('mRat', 'r192', 'tfb', 34, 'tfi', 127, 'taba', 115, 'tmio', 119, 'timio', 84.8, 'tfmio', 99.7, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r192_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% Aos 48s o estimulador é ligado e logo em seguida foi desligado (atenção a possíveis artefatos)
% Animal 194 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 194 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 194 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(83) = struct('mRat', 'r194', 'tfb', 76, 'tfi', 170, 'taba', 154, 'tmio', 156, 'timio', [], 'tfmio', [], 'tctcg', [], 'fName', 'r194_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% Animal 195 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(84) = struct('mRat', 'r195', 'tfb', 38, 'tfi', 130, 'taba', [], 'tmio', [], 'timio', [], 'tfmio', [], 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r195_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% Animal 197 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 197 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(85) = struct('mRat', 'r197', 'tfb', 44, 'tfi', 122, 'taba', [], 'tmio', [], 'timio', [], 'tfmio', [], 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r197_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% Animal 198 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 198 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(86) = struct('mRat', 'r198', 'tfb', 58, 'tfi', 146, 'taba', 139, 'tmio', [], 'timio', [], 'tfmio', [], 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r198_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
% Animal 199 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(87) = struct('mRat', 'r199', 'tfb', 46, 'tfi', 107, 'taba', [], 'tmio', [], 'timio', [], 'tfmio', [], 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r199_sf2.mat', 'mGrupo', 6, 'Fs', 1000);
RatData(88) = struct('mRat', 'r200', 'tfb', 39, 'tfi', 105, 'taba', [], 'tmio', [], 'timio', [], 'tfmio', [], 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r200_sf2.mat', 'mGrupo', 6, 'Fs', 1000);

% Animal 171 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 171 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(89) = struct('mRat', 'r171', 'tfb', 32, 'tfi', 137, 'taba', 118, 'tmio', 124, 'tctcg', [], 'fName', 'r171_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 172 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 172 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 172 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(90) = struct('mRat', 'r172', 'tfb', 32, 'tfi', 150, 'taba', 91, 'tmio', 96, 'tctcg', 144, 'fName', 'r172_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 174 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 174 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 174 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(91) = struct('mRat', 'r174', 'tfb', 32, 'tfi', 154, 'taba', 118, 'tmio', 125, 'tctcg', [], 'fName', 'r174_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
RatData(92) = struct('mRat', 'r175', 'tfb', 34, 'tfi', 152, 'taba', 111, 'tmio', 113, 'timio', 81.3, 'tfmio', 100.1, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r175_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 176 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 176 removido por possuir muito artefato no tálamo, no registro filtrado
RatData(93) = struct('mRat', 'r176', 'tfb', 33, 'tfi', 149, 'taba', 65, 'tmio', 68, 'timio', 36.1, 'tfmio', 95.1, 'tctcg', 140, 'tift', 107.7, 'tfft', 118.5, 'tifc', 118.5, 'tffc', 133.3, 'fName', 'r176_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 177 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 177 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 177 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(94) = struct('mRat', 'r177', 'tfb', 55, 'tfi', 170, 'taba', 116, 'tmio', 124, 'tctcg',176, 'fName', 'r177_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 180 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 180 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 180 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(95) = struct('mRat', 'r180', 'tfb', 38, 'tfi', 166, 'taba', 133, 'tmio', 138, 'tctcg', [], 'fName', 'r180_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 181 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 181 removido por possuir muito artefato no hipocampo, no registro sem filtrar
% Animal 181 removido por possuir muito artefato no tálamo, no registro filtrado
% Animal 181 removido por possuir muito artefato no tálamo, no registro sem filtrar
% RatData(96) = struct('mRat', 'r181', 'tfb', 34, 'tfi', 153, 'taba', 141, 'tmio', 151, 'timio', 116.2, 'tfmio', 165.1, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [],'fName', 'r181_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 182 removido por possuir muito artefato no córtex, no registro filtrado
% Animal 182 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 182 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(97) = struct('mRat', 'r182', 'tfb', 37, 'tfi', 189, 'taba', 107, 'tmio', 112, 'tctcg', 182, 'fName', 'r182_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 183 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 183 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(98) = struct('mRat', 'r183', 'tfb', 35, 'tfi', 186, 'taba', 134, 'tmio', 141, 'tctcg', [], 'fName', 'r183_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 184 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 184 removido por possuir muito artefato no tálamo, no registro filtrado
% RatData(99) = struct('mRat', 'r184', 'tfb', 45, 'tfi', 187, 'taba', 123, 'tmio', 126, 'tctcg', 201, 'fName', 'r184_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 185 removido por possuir muito artefato no hipocampo, no registro filtrado
% Animal 185 removido por possuir muito artefato no tálamo, no registro filtrado
% Animal 185 removido por possuir muito artefato no tálamo, no registro sem filtrar
% RatData(100) = struct('mRat', 'r185', 'tfb', 49, 'tfi', 184, 'taba', 134, 'tmio', 139, 'timio', 87, 'tfmio', 138.8, 'tctcg', [], 'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r185_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 187 removido por possuir muito artefato no hipocampo, no registro filtrado
RatData(101) = struct('mRat', 'r187', 'tfb', 46, 'tfi', 172, 'taba', 138, 'tmio', 144, 'timio', 98, 'tfmio', 146, 'tctcg', [],  'tift', [], 'tfft', [], 'tifc', [], 'tffc', [], 'fName', 'r187_sf2.mat', 'mGrupo', 7, 'Fs', 1000);
% Animal 188 removido por possuir muito artefato no hipocampo, no registro filtrado
RatData(102) = struct('mRat', 'r188', 'tfb', 44, 'tfi', 173, 'taba', 139, 'tmio', 146, 'timio', 101.6, 'tfmio', 133.3, 'tctcg', 191, 'tift', 147.1, 'tfft', 152.1, 'tifc', [], 'tffc', [], 'fName', 'r188_sf2.mat', 'mGrupo', 7, 'Fs', 1000);


%Ratos eliminado da estrutura é porque não tem arquivo disponível, ou
%porque tem menos de 20 segundos de basal

save(fName, 'RatData');
fprintf('Estrutura RatData, com %i entradas, foi salva no arquivo %s\n', length(RatData), fName);