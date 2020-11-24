syms tau t; %% definimos las variables simb�licas
ft=5*heaviside(t-10)-10*heaviside(t)+5*heaviside(t+10); %% definimos la funci�n ft en el tiempo
Fw=fourier(ft); %% Encontramos la expresi�n de la transformada de Fourier
Fw=simplify(Fw) %% Simplificamos la expresi�n
ft=subs(ft,tau,5); %% sustituimos el par�metro tau por 1.
subplot(2,1,1)
ezplot(ft,[-20,20]); %% dibujamos la expresi�n simb�lica en (-2,2)
grid on 
ylim([-10 10])
xlabel('Tiempo (s)');
ylabel('f(t)')
title('Se�al en el dominio de tiempo')
Fw=subs(Fw,tau,5);%% sustituimos el par�metro tau por 1.
subplot(2,1,2)
hg=ezplot(abs(Fw),[-10,10]);
set(hg,'color','r')
ylim([0 80])
xlabel('\omega');
ylabel('F(\omega)')
title('Transformada de Fourier de la se�al')
grid on


