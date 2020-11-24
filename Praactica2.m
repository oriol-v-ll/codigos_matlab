dim= 100;    %Quantitat de mostres necessaries      %Periode de mostreig
Fs= 20  ;   %Frequencia de mostreig
Ts=1/Fs;
Tobs= Ts*dim;    %Temps d'observació.
t=[0:dim-1]*Ts;
R=50;

Fa1=  2.5;              
Ta1= 1/Fa1;                
A=1;

y1=A*cos(2*pi*Fa1*t);
subplot(2,2,1);
plot(t,y1,'Red');


Fa2= 17.5;
Ta2=1/Fa2;
y2=A*cos(2*pi*Fa2*t);
subplot(2,2,2);
plot(t,y2,'Green');

dim_nova=dim*10;
k=(0:dim_nova-1)*Fs/dim_nova-Fs/2;
V1= (1/dim)*(fft(y1,dim_nova)); %Transformada de fourier del senyal.
V2= (1/dim)*(fft(y2,dim_nova));


P1=(1/R)*V1.*conj(V1);
Pdbm1=10*log10(P1) + 30;

subplot(2,2,3);
plot(k,fftshift(Pdbm1))


P2=(1/R)*V2.*conj(V2);
Pdbm2=10*log10(P2) + 30;

subplot(2,2,4);
plot(k,fftshift(Pdbm2))


