%%
N=20;
n=[0:2*N];
Nt=2*N+1;
w=linspace(-pi,pi,Nt);
H=zeros(1,Nt);
for i=1:Nt
    if (w(i) < 0)
        H(i)=j;
    elseif (w(i) > 0)
        H(i)=-j;
    end
end
alpha=N; %alpha = 20
Halpha=H.*exp(-j*w*alpha); %H��41��Ԫ�أ�w����[-pi,pi]

nh=n; %n=[-20,20]
nhalpha=n;
h=fftshift(ifft(ifftshift(H)));
halpha=fftshift(ifft(ifftshift(Halpha)));

%%
syms n0
nx=[0:64];
arg=pi*(n0-32)/4;
x_n0=sin(arg)/arg;
wc=pi/2;
x = zeros(1,65)
for i=0:64
    if i~=32
        x(i+1)=subs(x_n0,n0,i);
    else
        x(i+1)=0;
    end
end
x1=x.*cos(wc*nx);
%%
% halpha is defined for -20<=nhhalpha<=20
% x is defined for 0<=nx<=64
% xh_=conv(x,h) will -20<nxh<20+64
nxh_=nhalpha(1)+nx(1):nhalpha(end)+nx(end);
xh_=conv(x,halpha);

nxh=(alpha:alpha+64);
xh=xh_(nxh);
Xh=fftshift(fft(xh,256));

x2=xh.*sin(wc*nx);
X2=fftshift(fft(x2,256));

y=x1+x2;
Y=fftshift(fft(y,256));

%%
figure(1)
clf

subplot(311)
plot(nxh_,real(xh_));
title('full conv result')
a=axis

subplot(312)
plot(nx,real(x));
title('x')
axis(a)

subplot(313)
plot(nx,real(xh));
title('real of xh')
axis(a)

figure(2)

subplot(221)
plot(linspace(-pi,pi,256),abs(Xh));
title('Magnitude of Xh')

subplot(222)
plot(linspace(-pi,pi,256),unwrap(angle(Xh)));
title('Angle of Xh')

subplot(223)
plot(linspace(-pi,pi,256),abs(X2));
title('Magnitude of X2')

subplot(224)
plot(linspace(-pi,pi,256),unwrap(angle(X2)));
title('Angle of X2')

figure(3)

subplot(311)
plot(nx,y);
%stem(nx,y)
title('output of y')

subplot(312)
plot(linspace(-pi,pi,256),abs(Y));
%stem(linspace(-pi,pi,256),abs(Y))
title('Magnitude of Y')

subplot(313)
plot(linspace(-pi,pi,256),unwrap(angle(Y)));
title('Angle of Y')