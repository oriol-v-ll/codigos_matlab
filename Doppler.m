%Variables
dim=2048;
fs=20e3;
c=3e8;
fc=10e9;
landa=c/fc;
v1=160*0.277;
v2=80*0.277;
Ro1=3500;
Ro2=1000;
ts=1/fs;
t=[0:dim-1]*ts;

rt1=Ro1+v1*t;
rt2=Ro2-v2*t;

fd1= -(2/landa)*v1;
fd2=-(2/landa)*v2;

srt1=exp(-i*((4*pi)/landa)*rt1);
srt2=exp(-i*((4*pi)/landa)*rt2);

srt=srt1+srt2;

dim_nova=dim*10;
k=(0:dim_nova-1)*fs/dim_nova-fs/2;
V1= (1/dim)*(fft(srt,dim_nova)); %Transformada de fourier del senyal.
plot(k,fftshift(abs(V1)))

