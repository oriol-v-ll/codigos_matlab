clear all;
clc;
close all;

G=[-1.6, -1.7, -0.72, 0.64, 1.069, 2.35, 1.81, 3.17, 3.58, 4.32, 3.57 ];
F=[1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8, 3];

plot(F, G);
grid on;
xlabel('GHz');
ylabel('Guany (dB)');
title('Guany en funció de freqüència');