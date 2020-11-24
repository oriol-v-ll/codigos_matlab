%%Pràctica 1 Fonaments de Comunicació 1

%% Apartat A

w0=4*pi;
T=2*pi/w0;
u = inline('t>=0')
t=-4*T:T/100:4*T;
x1=3*u(t-0.5).*cos(4*pi*t+pi/3) ;
plot(t,x1)
axis([-4*T 4*T -5 5]);
title('Señal 1a');
grid;
xlabel('Tiempo (segundos)');
ylabel('x1(t)'); 


%%
%Apartat b

%% Apartat A

w0=4*pi;
T=2*pi/w0;
u = inline('t>=0')
t=-4*T:T/100:4*T;
x1=cos(pi*t-1) ;
plot(t,x1)
axis([-4*T 4*T -5 5]);
title('Señal 1b');
grid;
xlabel('Tiempo (segundos)');
ylabel('x1(t)'); 



%% 3.2 a

T=1;
t=-4*T:T/100:4*T;
xa= exp(-abs(t-1));   %la funcio en si 
xan= exp(-abs(-t-1)); 
xap = 1/2*(xa + xan); % par
xai = 1/2*(xa - xan); %impar
xat= xap + xai;
plot(t,xat) 
axis([-4*T 4*T -5 5]);
title('Señal 3a)');
grid; 
xlabel('Temps');



%% 3.2 b 
% Per a fer el escalo hem de sumar dos escalons.


T=1;
t=-4*T:T/100:4*T;
xa= 2*u(t+1)-2*u(t-3);  %funció
xan= 2*u(-t+1)-2*u(-t-3);
xap = 1/2*(xa + xan); % par
xai = 1/2*(xa - xan); %impar
xat= xap + xai;
plot(t,xat) 
axis([-4*T 4*T -5 5]);
title('Señal 3b)');
grid; 
xlabel('Temps');


%% 3.2 c

T=1;
t=-4*T:T/100:4*T;
xa= 3*sin(6*pi*t);   %funció
xan= 3*sin(6*pi*-t); 
xap = 1/2*(xa + xan); % par
xai = 1/2*(xa - xan); %impar
xat= xap + xai;
plot(t,xat) 
axis([-4*T 4*T -5 5]);
title('Señal 3c)');
grid; 
xlabel('Temps');


%% 3.2 d

T=1;
t=-4*T:T/100:4*T;
xa=4*cos(2*pi*t);   %funció
xan=4*cos(2*pi*t); 
xap = 1/2*(xa + xan); % par
xai = 1/2*(xa - xan); %impar
xat= xap + xai;
plot(t,xat) 
axis([-4*T 4*T -5 5]);
title('Señal 3d)');
grid; 
xlabel('Temps');


%% 3.3 


syms T
syms t
%código para representar la señal
T=1;
t=-2:1/200:2;
x33=(t>-1/2)&(t<1/2);
plot(t,x33)
title('Senyal a)');
grid;
axis([-4*T 4*T -5 5]);
xlabel('Tiempo (segundos)');
ylabel('x(t)');
%Cálculo de energia y poténcia
u=inline('t>=0')
t=-2:1/200:2;
x=(1-1*u(t-0.5)).*(1*u(t+0.5));
sum=0;
for n=1:length(t)
sum=sum+(x(n)^2)*0.01;
n=n+0.01
end
energia=sum
%Potencia en señales contínuas=0.
potencia=0


%% 3.4

clear all
close all
clc
A=2;
fo=1; % Frecuencia
phi=-pi/4; % Fase inicial
N=60;
Ts=1/60;
for n=0:N-1
 t=0:1/60:1;
 plot(A*cos(2*pi*t), A*sin(2*pi*t),'k:') % Circulo 1
 hold on
 plot(A/2*cos(2*pi*t), A/2*sin(2*pi*t),'k:') % Circulo 2
 hold on
 z1=A*exp(j*(2*pi*fo*n*Ts+phi));
 z2=A/2*exp(j*(2*pi/60*fo*n*Ts+phi));
 plot([0, real(z1)], [0,imag(z1)], [0, real(z2)], [0,imag(z2)])
 % dentro sprintf crea un formato string
 title(sprintf('Time=%1.4f s',n*Ts*60));
 axis(1.1*[-A A -A A]); axis equal;
 plot(real(z1),imag(z1),'r.', 'MarkerSize',18)
 plot(real(z2),imag(z2),'r.', 'MarkerSize',18)
 pause(1)
 hold off
end


%% 3.4 b 

clear all
close all
clc
A=1;
fo=1; % Frecuencia
phi=-pi/4; % Fase inicial
N=60;
Ts=1/60;
for n=0:N-1
 t=0:1/60:1;
 plot(A*cos(4*pi*t), A*sin(4*pi*t),'k:') % Circulo 1
 hold on
 plot(A/2*cos(4*pi*t), A/2*sin(4*pi*t),'k:') % Circulo 2
 hold on
 z1=A*exp(j*(2*pi*fo*n*Ts+phi));
 z2=A/2*exp(j*(2*pi/60*fo*n*Ts+phi));
 plot([0, real(z1)], [0,imag(z1)], [0, real(z2)], [0,imag(z2)])
 % dentro sprintf crea un formato string
 title(sprintf('Time=%1.4f s',n*Ts*60));
 axis(1.1*[-A A -A A]); axis equal;
 plot(real(z1),imag(z1),'r.', 'MarkerSize',18)
 plot(real(z2),imag(z2),'r.', 'MarkerSize',18)
 pause(1)
 hold off
end

