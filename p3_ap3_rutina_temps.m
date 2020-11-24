dim=512;
close all

% CREAR VECTOR TEMPS I VOLTATGE



% SEL·LECCIONAR PORT(COMXX) ON ESTÀ CONNECTAT L'ARDUINO  
%borrar previos
delete(instrfind({'Port'},{'COM9'}));
%creació objecte serie
s = serial('COM9','BaudRate',115200,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

% OBRIR EL PORT
fopen(s);

% DESENVOLUPEU EL BUCLE QUE AGAFA LES DADES DE L'ARDUINO PEL PORT SÈRIE
% LA ESTRUCTURA DE LA TRAMA ÉS: DADA 1 TEMPS, DADA 1 VOLTATGE, DADA 2
% TEMPS, DADA 2 VOLTATGE, ETC FINS LA DADA DIM
% FEU SERVIR LA FUNCIÓ DE LECTURA fscanf(s,'%d')'
vector= [];

for n=1:dim
    vector =[vector fscanf(s,'%d')]
end
 temps = vector(1:2:dim-1);
 Amplitud = vector(2:2:dim);
 
 plot(temps, Amplitud);


% SEPAREU LES DADES DELS VECTOR TEMPS I VOLTATGE
% REPRESENTEU EL SENYAL VOLTATGE=f(TEMPS), TEMPS EN (ms)
% ESTIMEU EL TEMPS DE MOSTREIG
% GUARDEU EL VECTOR VOLTATGE I EL TEMPS DE MOSTREIG PER REPRESENTAR
% L'ESPECTRE DEL SENYAL

 temps = vector(1:2:dim-1);
 Amplitud = vector(2:2:dim);
 
 plot(temps, Amplitud);
 
% TANCAR EL PORT
fclose(s);


