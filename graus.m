clear all;
clc;
close all;

g=[0, 10, 20, 30, 40, 50, 60, 70, 80, 90];
P=[-13.29, -13.61, -15.17, -17.17, -18.37, -21.99, -25.51, -27.02, -26.42, -27.08 ];
o=P/-13.29;

plot(g, o);
grid on;
ylabel('Relacio potencies');
xlabel('Graus');
title('Relacio de potencies');