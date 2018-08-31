x3=[ones(1,8) zeros(1,24)];
nx3=[0:length(x3)-1];    %---------------------------------
N=63;    %---------------------------------
for n=0:N    %---------------------------------
    r=mod(n,32);    %---------------------------------
    x3_(n+1)=x3(r+1);    %---------------------------------
end    %---------------------------------
c = (1/32)*fft(x3);
n = 0:31;

x32 = 0;x38 = 0;x312 = 0;x3all = 0;

for t=1:3
    x32 = x32 + c(t)*exp(1j*(t-1)*(2*pi/32)*n);
end
for t=2:3
    x32 = x32 + conj(c(t))*exp(1j*(1-t)*(2*pi/32)*n);
end   
    
for t=1:9
    x38 = x38 + c(t)*exp(1j*(t-1)*(2*pi/32)*n);
end
for t=2:9
    x38 = x38 + conj(c(t))*exp(1j*(1-t)*(2*pi/32)*n);
end   

for t=1:13
    x312 = x312 + c(t)*exp(1j*(t-1)*(2*pi/32)*n);
end
for t=2:13
    x312 = x312 + conj(c(t))*exp(1j*(1-t)*(2*pi/32)*n);
end   

for t=1:17
    x3all = x3all + c(t)*exp(1j*(t-1)*(2*pi/32)*n);
end
for t=2:16
    x3all = x3all + conj(c(t))*exp(1j*(1-t)*(2*pi/32)*n);
end   

figure
subplot(2,2,1);stem(x32);ylabel('x_{3\_2}[n]');xlabel('n')
subplot(2,2,2);stem(x38);ylabel('x_{3\_8}[n]');xlabel('n')
subplot(2,2,3);stem(x312);ylabel('x_{3\_{12}}[n]');xlabel('n')
subplot(2,2,4);stem(real(x3all));ylabel('x_{3\_all}[n]');xlabel('n')


