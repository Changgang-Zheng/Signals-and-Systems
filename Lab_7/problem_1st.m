%Name: Matlab: Signals and Systems Lab 7th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 7.1 (a)(b)(c)(d)

function  problem_1st
    %% Problem a
    Ou=2000*pi;
    T=1/8192;
    N=8192;
    n=[0:8191];
    t=n*T;
    x_n=sin(Ou*t);
   
    %% Problem b
    figure;
    subplot(2,1,1);
    stem(n(1:50),x_n(1:50),'.');
    title('Graph of x[n]');
    xlabel('n');                        % name the label of x-axis 
    ylabel('X[n]');                     % name the label of y-axis 
    grid on;
    
    subplot(2,1,2);
    plot(n(1:50),x_n(1:50));
    title('Graph of x(t)');
    xlabel('t');                        % name the label of x-axis 
    ylabel('x(t)');                     % name the label of y-axis 
    grid on;
    
    %% Problem c
     
    [Xc,wc] =ctfts(x_n,T);
    
    figure;
    subplot(311)
    stem(wc,abs(Xc),'.');
    title('Magnitude of Xc(w)');
    xlabel('w');                           % name the label of x-axis 
    ylabel('|Xc(w)|');                     % name the label of y-axis 
    grid on;
    
    
    subplot(312);
    stem(wc,angle(Xc),'.');
    title('Angle of Xc(w)');
    xlabel('w');                             % name the label of x-axis 
    ylabel('Angle of Xc(w)');                % name the label of y-axis 
    grid on;
    
    
    subplot(313);
    stem(wc,angle(erroroff(Xc,N)),'.');
    title('Angle of Xc(w)(Exclue those with extremely small magnitude)');
    xlabel('w');                              % name the label of x-axis 
    ylabel('Angle of Xc(w)');                 % name the label of y-axis 
    grid on;
    
    %% Problem d
    N=8192;
    [x1,Xd1,wd1]=a_c(2*pi*1500,N);
    [x2,Xd2,wd2]=a_c(2*pi*2000,N);
    
    figure;
    subplot(311);
    stem(wd1,abs(Xd1),'.');
    title('Magnitude of Xd1(w)');
    xlabel('w');                                    
    ylabel('|Xd1(w)|');                    
    grid on;
    subplot(312);
    stem(wd1,angle(Xd1),'.');
    title('Angle of Xd1(w)');
    xlabel('w');                                    
    ylabel('Angle of Xd1(w)');                    
    grid on;
    subplot(313);
    stem(wd1,angle(erroroff(Xd1,N)),'.');
     title('Angle of Xd1(w)(Exclue those with extremely small magnitude)');
    xlabel('w');                                  
    ylabel('Angle of Xd1(w)');                     
    grid on;
    
    figure;
    subplot(311);
    stem(wd2,abs(Xd2),'.');
    title('Magnitude of Xd2(w)');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('|Xd2(w)|');                             % name the label of y-axis 
    grid on;
    subplot(312);
    stem(wd2,angle(Xd2),'.');
    title('Angle of Xd2(w)');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle of Xd2(w)');                      % name the label of y-axis 
    grid on;
    subplot(313);
    stem(wd2,angle(erroroff(Xd2,N)),'.');
    title('Angle of Xd2(w)(Exclue those with extremely small magnitude)');
    xlabel('w');                                    % name the label of x-axis 
    ylabel('Angle of Xd2(w)');                      % name the label of y-axis 
    grid on;

    figure;
    subplot(2,1,1);    
    stem(n(1:50),x1(1:50),'.');
    title('Graph of xd1[n]');
    xlabel('n');                                    % name the label of x-axis 
    ylabel('Xd1[n]');                               % name the label of y-axis 
    grid on;
    
    subplot(2,1,2);
    plot(n(1:50),x1(1:50));
    title('Graph of xd1(t)');
    xlabel('t');                                    % name the label of x-axis 
    ylabel('xd1(t)');                               % name the label of y-axis 
    grid on;
    
    
    figure;
    subplot(2,1,1);
    stem(n(1:50),x2(1:50),'.');
    title('Graph of xd2[n]');
    xlabel('n');                                    % name the label of x-axis 
    ylabel('Xd2[n]');                               % name the label of y-axis 
    grid on;
    
    subplot(2,1,2);
    plot(n(1:50),x2(1:50));
    title('Graph of xd2(t)');
    xlabel('t');                                    % name the label of x-axis 
    ylabel('xd2(t)');                               % name the label of y-axis 
    grid on;