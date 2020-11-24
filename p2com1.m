%%%%% COEFICIENTES DE LA SERIE DE FOURIER %%%%%
clear all; % Elimina variables utilizadas en otras rutinas
close all; % Ciera las figuras abiertas
clc; % Limpia la pantalla
% N�mero de t�rminos de la serie (entero, > 0), excluido av
N = 10;
%Rango de n
n = 1:N;
% Amplituid de la se�al
A=1;
% Periodo de la funci�n (> 0)
T0 =20; %Valor del estudio previo
w0=2*pi/T0;
tau=5;
Xdc=(1/10)*tau;
% Coeficientes de la serie (expresiones algebraicas en funci�n de n)
Cn = (tau/10)*sinc(n*tau/10); % Se�al de onda cuadrada
M = abs(Cn); fase = atan2(imag(Cn), real(Cn));
% Representaci�n de m�dulos
subplot (3, 1, 1);
grid on;
xlabel ('armonico n', 'FontName', 'Times', 'Fontsize', 14);
ylabel ('M�dulo', 'FontName', 'Times', 'Fontsize', 14);
stem (n, M);
hold on;
stem (0, abs(Xdc));
stem (-n, M);
title ('Series de Fourier', 'FontName', 'Times', 'Fontsize', 14);
% Representaci�n de fases
subplot (3, 1, 2);
stem (0, (180/pi)*angle(Xdc));
stem (n, (180/pi)*fase(n));
hold on
stem (0, angle(Xdc));
stem (-n, -(180/pi)*fase(n));
grid on;
xlabel ('armonico n', 'FontName', 'Times', 'Fontsize', 14);
ylabel ('Fase (�)', 'FontName', 'Times', 'Fontsize', 14);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Reconstrucci�n%%%%%%%%%%%%%%%%%%%%%%%
% N�mero de periodos a representar (entero, > 0)
np = 4;
% Base de tiempos
tinicial = 0; % Instante inicial del primer periodo
inicial = tinicial - (np/2)*T0; final = - inicial; puntos = 1000;
t = linspace (inicial, final, puntos);
% C�lculo de m�dulos y fases
% Se�al reconstruida
subplot (3, 1, 3);
senyal = Xdc;
k = 1;
while k<=N
senyal = senyal + 2*M(k)*cos((2*pi*k/T0)*t + fase(k));
k = k + 1;
end
plot (t, senyal, 'b', 'LineWidth', 2);
grid on;
xlabel ('Tiempo (s)', 'FontName', 'Times', 'Fontsize', 14);
ylabel ('Se�al', 'FontName', 'Times', 'Fontsize', 14);
axis ([inicial, final, -(3/2)*abs(min(senyal)),
(3/2)*abs(max(senyal))]);