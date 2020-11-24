%% Pràctica 4 Fonaments de comunicació I
% Bernat Sort, Oriol Villanova
clear all;
close all;
clc;

figure;
hold off;
alpha = 0.2;
beta = 0.5;
T=0.01;
t=-1:T:6;
x=sin(pi*t).*((t>1)&(t<3));
h=2.*((t>1)&(t<3));
y=conv(x,h)*T;
tc=-2:T:12; %Vector de tiempo para la convolución
plot(t,x,'b');
hold on;
plot(t,h,'r');
plot(tc,y,'k');
grid;
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Señal b): alpha = 0.2 beta = 0.5');
legend('x(t)', 'h(t)', 'y(t)'); 