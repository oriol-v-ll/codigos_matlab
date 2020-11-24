clear all
close all
syms t w; % definimos las variables simbolicas 
ft=(10*sin(pi*t)*heaviside(t+2.5)-(10*sin(pi*t)*heaviside(t-2.5)));  %% definimos la funcion ft en el tiempo 
Fw=fourier(ft); % Encontramos la expresion de la transformada de Fourier 
Fw=simplify(Fw); % Simplificamos la expresiin

%Definimos la F(w) obtenida analiticamente (expresión teórica)
fc=1i*20*sinc(2*(w+pi))+1i*20*sinc(2*(w-pi));

% dibujamos la f(t)
subplot(3,1,1)
hg=ezplot(ft,[-20,20]); 
set(hg,'LineWidth',1.5)
ylim([-12 12]);
xlabel('Tiempo (s)');
ylabel('f(t)')
title('Señal en el dominio de tiempo');
grid on;

% dibujamos el modulo de F(w)
rangoW = 15; %definimos un rango de w para dibujar el espectro
subplot(3,1,2)
hg=ezplot(abs(Fw),[-rangoW,rangoW]); %dibujamos la función obtenida en Matlab
set(hg,'color', [0.3010, 0.7450, 0.9330])
set(hg,'LineWidth',4.5)
hold on
hct= ezplot(abs(fc),[-rangoW,rangoW]); %dibujamos la expresion teorica
set(hct,'color', 'r')
set(hct,'LineWidth', 1.5)
ylim([-1 25]);
xlabel('\omega');
ylabel('|F(\omega)|');
title('Transformada de Fourier de la señal (Módulo)');
grid on;
legend('Matlab', 'Teórica')

% dibujamos la fase de F(w)
subplot(3,1,3)
hg=ezplot(angle(Fw),[-rangoW,rangoW]);  %dibujamos la función obtenida en Matlab
set(hg,'color', [0.3010, 0.7450, 0.9330])
set(hg,'LineWidth',4.5)
hold on
hct= ezplot(angle(fc),[-rangoW,rangoW]); %dibujamos la expresion teorica
set(hct,'color', 'r')
set(hct,'LineWidth', 1.5)
ylim([-5 5]);
xlabel('\omega');
ylabel('arg[F(\omega)]');
title('Transformada de Fourier de la señal (Fase)');
grid on;
legend('Matlab', 'Teórica')