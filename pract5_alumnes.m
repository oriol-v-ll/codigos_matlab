%%% COMUNICACIONS DIGITALS %%%
%%% PR�CTICA 5 
% tanco totes les figures anteriors
close all

% nSamp: Nombre de mostres per s�mbol (no tocar)
nSamp = 8; 
% numSymb: Nombre de s�mbols a simular (posar com a m�nim 10 vegades el
% nombre de s�mbols de l'alfabet (M)


%% M: nombre de s�mbols de l'alfabet

M = 64;
numSymb = 10*M;
% GENERACI� DE SIMBOLS ALEATORIS

 % Perqu� generi la mateixa seq��ncia (comparaci� factor roll off)
   seed = [12345 54321];
   rand('state', seed(1)); randn('state', seed(2));

numPlot = 10;
msg_orig = randsrc(numSymb, 1, 0:M-1);
% Ho comento per no twnir tants plots
% stem(0:numPlot-1, msg_orig(1:numPlot), 'bx');
% xlabel('Time'); ylabel('Amplitude')


%%%%% MODULACI�

% x=0 per modulacions M-PSK / x=1 per modulacions M-QAM
x=1;

if x==0,
% Modulaci� M-PSK
  % Fase inicial
  ini_phase=45*pi/180;

  msg_tx = pskmod(msg_orig,M,ini_phase);
  h1 = scatterplot(msg_tx);
else
% Modulaci� M-QAM
  msg_tx = qammod(msg_orig,M);
  h2=scatterplot(msg_tx);
end;

%%%%% FILTRE CONFORMADOR COSINUS REAL�AT

  % R: factor de roll-off
  R = 0.5; Delay = 3; DataL = 20; Fs = 8; Fd = 1; 
  % Compensaci� retard de grup del filtre (ordre/(2*Fs))
  PropD = Delay * Fd;
[yo, to] = rcosflt(msg_tx, Fd, Fs, 'normal/fir', R, Delay);
tx = [PropD: PropD + numSymb - 1] ./ Fd;
stem(tx, msg_tx, 'kx'); hold on
plot(to, yo, 'b-'); hold off


%%%%% DIAGRAMA DE L'ULL
N=16;
yy = yo(1+Delay*N:end-Delay*(N+2));
h3=eyediagram(yy,N);
h4=scatterplot(yy,N);


%%%%% DIAGRAMA VECTORIAL (constel.laci� amb traject�ries)
h5 = scatterplot(yy, 1, 0, 'c-');
hold on;
scatterplot(yy, N, 0, 'b.',h5);
hold off;

  
%%%%% SENYAL REBUT: senyal transm�s + soroll additiu blanc gaussi�
    
 % SNR: relaci� senyal a soroll
 SNR = 20;
 
 msg_rx = awgn(yy, SNR, 'measured', [], 'dB');
 h6 = scatterplot(msg_rx,N);
 h7 = eyediagram(msg_rx, N);
 
 
 % Solapar senyals enviats i rebuts
 msg_rx1 = awgn(yo, SNR, 'measured', [], 'dB');
 figure;
 stem(tx, msg_tx, 'kx'); hold on
 % Plot filtered data
 plot(to, yo, 'b-',to,msg_rx1,'r'); hold off
