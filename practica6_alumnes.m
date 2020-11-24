%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COMUNICACIONS DIGITALS. PRÀCTICA 6 v2
%% PROBABILITAT D'ERROR DE BIT M-PSK O M-QAM 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Definiu ordre de la modulació M
M=8;

% Eix de abscises (Eb_No) en dB per exemple de 1 dB a 20 dB 201 punts
Eb_No=linspace(0,20,201);

% Definiu el argument de la funció Q depenen de la modulació

%QAM x= sqrt(((3*log2(M))/(M-1))*(10.^(Eb_No/10)));
xp4=sqrt(2.*10.^(Eb_No/10));
xp8=sqrt(2.*10.^(Eb_No/10)*log2(8))*sin(pi/8);
xp16=sqrt(2.*10.^(Eb_No/10)*log2(16))*sin(pi/16);
xq8=sqrt(((3*log2(8))/(8-1))*(10.^(Eb_No/10)));
xq16=sqrt(((3*log2(16))/(16-1))*(10.^(Eb_No/10)));
% Funció Q;
%QAM Q=0.5.*erfc(x./sqrt(2));
QP4=0.5.*erfc(xp4./sqrt(2));
QP8=0.5.*erfc(xp8./sqrt(2));
QP16=0.5.*erfc(xp16./sqrt(2));
Qq8=0.5.*erfc(xq8./sqrt(2));
Qq16=0.5.*erfc(xq16./sqrt(2));
% Definiu Pb i Pe si cal
Pe4= 2*QP4;
Pe8=2*QP8;
Pe16=2*QP16;
%QAM Pb= (4/log2(M))*(1-1/sqrt(M))*Q;
Pb4=Pe4/log2(4);
Pb8=Pe8/log2(8);
Pb16=Pe16/log2(16);
Pbq8= (4/log2(8))*(1-1/sqrt(8))*Qq8;
Pbq16= (4/log2(16))*(1-1/sqrt(16))*Qq16;
% Representeu la Pb en funció de Eb_No
figure;
semilogy(Eb_No,Pb4);grid on;
hold on
semilogy(Eb_No,Pb8);
hold on 
semilogy(Eb_No,Pb16);
hold on
semilogy(Eb_No,Pbq8);
hold on
semilogy(Eb_No,Pbq16);


% Ajusteu els eixos si cal
axis([0 20 10^-6 10^0]);

% Si voleu representar varies modulacions a lhora creeu un array de Pb
% Feu servir legend per representar modulacions a la mateixa figura
legend('QPSK','8-PSK', '16-PSK', '8-QAM', '16-QAM');
xlabel('Eb/N0[dB]');
ylabel('Pb');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







