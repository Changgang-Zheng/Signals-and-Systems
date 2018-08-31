%{
% Part1.m
% Author: Charles Yang
% Signal&System 7.1(a)(b)(c)(d)
%% (a)(b)
N=8192;
T=1/N;
n=0:N-1;
t=n*T;
cps0=1000;
ohm0=2*pi*cps0;
x=sin(ohm0*t);
figure;
subplot(211)
stem(n(1:50),x(1:50));
subplot(212)
plot(t(1:50),x(1:50));
%% (c)
[X,f]=ctfts(x,T);
Xr=roff(X);
figure;
subplot(211)
plot(f,abs(Xr));
subplot(212)
plot(f,angle(Xr));
%% (d)
cps1=1500;
ohm1=2*pi*cps1;
x1=sin(ohm1*t);
[X1,~]=ctfts(x1,T);
X1r=roff(X1);
cps2=2000;
ohm2=2*pi*cps2;
x2=sin(ohm2*t);
[X2,f]=ctfts(x2,T);
X2r=roff(X2);
figure;
subplot(211);stem(n(1:50),x1(1:50));
subplot(212);stem(n(1:50),x2(1:50));
figure;
subplot(221);plot(f,abs(X1r));
subplot(222);plot(f,angle(X1r));
subplot(223);plot(f,abs(X2r));
subplot(224);plot(f,angle(X2r));
%% Round Function
function ro=roff(x)
n=4;
N=10^n;
ro=(round(x*N))/N;
end



%% problem d
    %a=20;
    %n=128;
    %w=[-pi:pi/n:pi-pi/n];
    %H=1j*[ones(1,n) -ones(1,n)];
    %Ha=exp(-1j*a*w).*H;
    %ha=fftshift(ifft(Ha));
    %nd=[0:40];
    %figure;
    %stem(nd,ha(1:41));
    
    
    
    
    
    
    %Name: Matlab: Signals and Systems Lab 7th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 8.1 (c)(d)(e) (i)-(n) 

function  problem_2nd
    %% problem c
    
    
    
    %% problem d
    %{
    a=20;
    H2=[1j*ones(1,40) -1j*ones(1,41)];
    w2=linspace(-pi,pi,81);
    ha2=fftshift(ifft(ifftshift(H2.*exp(-1j.*a.*w2))));
    h2=fftshift(ifft(ifftshift(H2)));
    figure;
    stem([0:40],h2(20:60));
    figure;
    stem([0:40],ha2(20:60));
    h=h2(20:60);
    %}
    
    a=20;
    n=linspace(0.00000001,40,41);
    h=(1-cos(pi*(n-a)))./(pi*(n-a));
    figure;
    stem(n,h);
    
    %% problem e
    w=linspace(-pi,pi,256);
    H=fftshift(fft(h,256));
    Hp=unwrap(abs(H));
    
    figure;
    subplot(311);
    plot(w,Hp);
    subplot(312);
    plot(w,abs(H));  
    subplot(313);
    plot(w,angle(H));
    
    %% problem i
    wc=pi/2;
    N=65;
    n=linspace(0.000000001,64,N);
    x=(sin(pi.*(n-32)./4))./(pi.*(n-32)./4);
    X=fftshift(fft(x,256));
    figure;
    subplot(311);
    plot(w,X);
    title('graph of X[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('graph of X[w]');  
    subplot(312);
    plot(w,abs(X));
    title('graph of |X[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|X[w]|');  
    subplot(313);
    plot(w,angle(X));
    title('angle of X[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('angle of X[w]');  
    
    figure;
    plot(n,x);
    
    %% problem j
   
    x1=x.*cos(wc.*n);
    X1=fftshift(fft(x1,256));
    
    figure;
    subplot(311);
    plot(w,X1);
    title('graph of X1[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('X1[w]');  
    subplot(312);
    plot(w,abs(X1));
    title('graph of X1[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('X1[w]');  
    subplot(313);
    plot(w,angle(X1));
    title('graph of X1[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('X1[w]');  
    
    %% problem k

    %h=(1-cos(pi*linspace(0.00000001,40,41)))./(pi*linspace(0.00000001,40,41));
    xh=conv(h,x);
    figure;
    plot(n,xh(21:85));
    %% problem l
    Xh=fftshift(fft(xh(21:85),256));
    figure;
    subplot(311);
    plot(w,Xh);
    title('graph of Xh[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Xh[w]');  
    subplot(312);
    plot(w,abs(Xh));
    title('graph of |Xh[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|Xh[w]|');           
    subplot(313);
    plot(w,angle(Xh));
    title('angle of Xh[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('angle of Xh[w]');           
    %% problem m
    x2=xh(21:85).*sin(wc.*[20:84]);
    X2=fftshift(fft(x2,256));
    figure;
    subplot(311);
    plot(w,X2);
    title('graph of X2[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('X2[w]'); 
    subplot(312);
    plot(w,abs(X2));
    title('graph of |X2[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|X2[w]|');
    subplot(313);
    plot(w,angle(X2));
    title('angle of X2[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('angle f X2[w]');  
    %% problem n
    y=x1+x2;
    Y=fftshift(fft(y,256));
    
    figure;
    subplot(311);
    plot(w,Y);
    title('graph of Y[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Y[w]'); 
    subplot(312);
    plot(w,abs(Y));
    title('graph of |Y[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|Y[w]|');
    subplot(313);
    plot(w,angle(Y));
    title('angle of Y[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('angle of Y[w]');  
    %}
    %% 
    for n=[0:40] 
        h(n+1)=(1-cos((n-20)*pi))./(pi*(n-20));
    end
    %figure(1);
    %stem([0:40],h)
    title('The samples in h versus n')
    ylabel('h')
    xlabel('n')
    h(21)=0;
    %Problem 8.1(e)
    w=[-pi:2*pi/255:pi];
    Y=fft(h(1:41),256);
    
   
    Y_p=angle(Y);
    Y_p=fftshift(Y_p);
    Y_p=unwrap(Y_p);
    hold on;
    %figure(3);
    plot(w,Y_p)
    title('The phase of the DTFT of h')
    ylabel('<H')
    xlabel('w')

    %%