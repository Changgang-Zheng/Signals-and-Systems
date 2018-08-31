%Name: Matlab: Signals and Systems Lab 7th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 8.1 (c)(d)(e) (i)-(n) 

function  problem_2nd
    %% problem c
    
    
    
    %% problem d
  
    a=20;
    
    %h(21)=0;
    for n=0:40 
        %if h(n+1)~=(1-cos((n+1-20)*pi))./(pi*(n+1-20))
        %    h(n+1)
        %    n+1
        %    h(n+1)
        %end
        h(n+1)=(1-cos((n-20)*pi))./(pi*(n-20));
    end
    h(21)=0;
    
    n=linspace(0,40,41);
    figure;
    stem(n,h,'.');
    title('Graph of h[n]');
    xlabel('n');                                    % name the label of x-axis 
    ylabel('Graph of h[n]');  
    grid on;
    %% problem e
    w=linspace(-pi,pi,256);
    H=fft(h,256);
    Hp=unwrap(fftshift((angle(H))));
    H=fftshift(H);
    %{
    figure;
    subplot(211);
    plot(w,Hp);
    title('Graph of Hp[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Graph of Hp[w]');
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:0.2:5);
    grid on;
    %}
    figure;
    subplot(311);
    plot(w,abs(H)); 
    title('Graph of |H[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Graph of |H[w]|');  
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',0:0.2:6);
    grid on;
    
    subplot(312);
    
    plot(w,angle(H));
    title('Angle of H[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle of H[w]');  
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    
    subplot(313);
    plot(w,Hp);
    title('Phase of H[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Phase of H[w]');  
    set(gca,'XTick',-4:0.5:4); 
    %set(gca,'YTick',-200:40:200);
    grid on;
    %% problem i
    wc=pi/2;
    N=65;
    n=linspace(0.000000001,64,N);
    x=(sin(pi.*(n-32)./4))./(pi.*(n-32)./4);
    X=fftshift(fft(x,256));
    figure;
    subplot(311);
    plot(w,X);
    title('Graph of X[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Graph of X[w]'); 
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    subplot(312);
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    plot(w,abs(X));
    title('Graph of |X[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|X[w]|');  
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',0:1:6);
    grid on;
    subplot(313);
    plot(w,angle(X));
    title('Angle of X[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle of X[w]');  
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    
    figure;
    plot(n,x);
    title('Graph of x[n]');
    xlabel('n');                                    % name the label of x-axis 
    ylabel('x[n]');  
    grid on;
    
    %% problem j
   
    x1=x.*cos(wc.*n);
    X1=fftshift(fft(x1,256));
    
    figure;
    subplot(311);
    plot(w,X1);
    title('Graph of X1[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('X1[w]');
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    subplot(312);
    plot(w,abs(X1));
    title('Graph of |X1[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|X1[w]|');  
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',0:1:6);
    grid on;
    subplot(313);
    plot(w,angle(X1));
    title('Angle of X1[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle of X1[w]');  
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    %% problem k
    n=linspace(0.00000001,64,65);
    h=(1-cos(pi*(n-a)))./(pi*(n-a));
    %h=(1-cos(pi*linspace(0.00000001,40,41)))./(pi*linspace(0.00000001,40,41));
    xh1=conv(h(1:41),x);
    xh=conv(h,x);
    
    figure;
    subplot(211);
    plot([0-20:length(xh1)-21],xh1);
    title('Graph of xh[n](cov be h(from 0 to 40) and x(from 0 to 64))');
    xlabel('n');                                    % name the label of x-axis 
    ylabel('xh[n]');  
    grid on;
    subplot(212);
    plot([0-20:length(xh)-21],xh);
    title('Graph of xh[n](cov be h(from 0 to 64) and x(from 0 to 64))');
    xlabel('n');                                    % name the label of x-axis 
    ylabel('xh[n]');  
    grid on;
    %% problem l
    xh=xh1;
    Xh=fftshift(fft(xh(21:85),256));
    figure;
    subplot(311);
    plot(w,Xh);
    title('Graph of Xh[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Xh[w]'); 
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    subplot(312);
    plot(w,abs(Xh));
    title('Graph of |Xh[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|Xh[w]|');   
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',0:1:6);
    grid on;
    subplot(313);
    plot(w,angle(Xh));
    title('Angle of Xh[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle of Xh[w]');
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    %% problem m
    x2=xh(21:85).*sin(wc.*[20:84]);
    X2=fftshift(fft(x2,256));
    figure;
    subplot(311);
    plot(w,X2);
    title('Graph of X2[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('X2[w]'); 
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    subplot(312);
    plot(w,abs(X2));
    title('Graph of |X2[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|X2[w]|');
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',0:1:6);
    grid on;
    subplot(313);
    plot(w,angle(X2));
    title('Angle of X2[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle f X2[w]'); 
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    %% problem n
    y=x1+x2;
    Y=fftshift(fft(y,256));
    
    figure;
    subplot(311);
    plot(w,Y);
    title('Graph of Y[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Y[w]');
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;
    
    subplot(312);
    plot(w,abs(Y));
    title('Graph of |Y[w]|');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|Y[w]|');
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',0:1:6);
    grid on;
    subplot(313);
    plot(w,angle(Y));
    title('Angle of Y[w]');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle of Y[w]');  
    set(gca,'XTick',-4:0.5:4); 
    set(gca,'YTick',-5:2:5);
    grid on;