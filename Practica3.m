syms tau t; %% definimos las variables simbólicas
ft=5*heaviside(t-10)-10*heaviside(t)+5*heaviside(t+10); %% definimos la función ft en el tiempo
Fw=fourier(ft); %% Encontramos la expresión de la transformada de Fourier
Fw=simplify(Fw) %% Simplificamos la expresión
ft=subs(ft,tau,5); %% sustituimos el parámetro tau por 1.
subplot(2,1,1)
ezplot(ft,[-20,20]); %% dibujamos la expresión simbólica en (-2,2)
grid on 
ylim([-10 10])
xlabel('Tiempo (s)');
ylabel('f(t)')
title('Señal en el dominio de tiempo')
Fw=subs(Fw,tau,5);%% sustituimos el parámetro tau por 1.
subplot(2,1,2)
hg=ezplot(abs(Fw),[-10,10]);
set(hg,'color','r')
ylim([0 80])
xlabel('\omega');
ylabel('F(\omega)')
title('Transformada de Fourier de la señal')
grid on


