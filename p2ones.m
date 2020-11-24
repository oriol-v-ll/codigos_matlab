clear all;
clc;
close all;

%% Per a poder mesurar la amplitud segons la freqüència.
A=[1.36, 1.60, 1.84, 2.16, 2.24, 2.40, 2.56, 2.56, 2.48, 2.24, 2 ];
F=[40.7, 40.8, 40.9, 41, 41.1, 41.2, 41.3, 41.4, 41.5, 41.6, 41.7];

%% Per a poder medir la amplitud variant la distància.
D=[5.65, 10, 14.1, 17.4, 21.7, 25.2];
A2=[2.56, 1.36, 0.64, 0.4, 0.4, 0.24];

%% Durada del pols/distància
d=[1.39, 1.56, 1.71, 1.91]; % ms
dist=[23, 26.9, 29.48, 32.93]; % cm


%% Implementació del esquema. 
figure
plot(F, A);
grid on;
ylabel('Amplitud');
xlabel('Frequencia');
title('Gràfica');

figure
plot(D, A2);
grid on;
ylabel('Amplitud');
xlabel('Distància (cm)');
title('Gràfica');

figure
plot(d, dist);
grid on;
ylabel('distància cm');
xlabel('durada ms');
title('Gràfica');