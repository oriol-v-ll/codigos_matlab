A=0.1;
dc=0.3;
T=10;
w=(2*pi)/T;
t=dc*T;
n=3;
Z0=50;
tau=dc;

for i = 1:n
    
    disp(i);
    V=(A*dc)*sinc(i*dc);
    disp(V)
    P=(2*V^2)/Z0;
    PdB=10*log10(P*1000);
    disp(P);
    disp(PdB);
    %
    
end