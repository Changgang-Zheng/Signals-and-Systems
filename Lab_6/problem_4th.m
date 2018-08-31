%Name: Matlab: Signals and Systems Lab 6th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 4.6(a)(b)(c)(d)

function  problem_4th
    %% problem 4.6(a)

    load new.mat 
    %load ctftmod.mat
    
    fprintf('f1 = %d f2 = %d\n', f1, f2);
    z=[Dash Dash Dot Dot];
  
    figure;
    subplot(4,1,1)
    plot(t(1:length(x)),x);
    title('message x(t)');
    xlabel('t');                                    % name the label of x-axis
    ylabel('x(t)');                                 % name the label of y-axis
    grid on;
    subplot(4,1,2)
    plot(t(1:length(Dash)),Dash);
    title('dash(t)');
    xlabel('t');                                  	% name the label of x-axis 
    ylabel('dash(t)');                              % name the label of y-axis 
    grid on;
    subplot(4,1,3)
    plot(t(1:length(Dot)),Dot);
    title('dot(t)');
    xlabel('t');                                   % name the label of x-axis 
    ylabel('dot(t)');                              % name the label of y-axis 
    grid on;
    subplot(4,1,4)
    plot(t(1:length(z)),z);
    title('created signal z(t)');
    xlabel('t');                                   % name the label of x-axis 
    ylabel('z(t)');                                % name the label of y-axis 
    grid on;
    figure;
    
    %% problem 4.6(b)
    
    freqs(bf,af)
    
    %% problrm 4.6(c)
    
    fprintf('f1 = %d f2 = %d\n', f1, f2);
    ydash=lsim(bf,af,Dash,t(1:length(Dash))); 
    ydot=lsim(bf,af,Dot,t(1:length(Dot))); 
    
    figure;
    subplot(2,1,1)
    plot(t(1:length(Dash)),Dash);
    hold on;
    plot(t(1:length(Dash)),ydash);
    title('dash(t) and dash(t) after filter');
    xlabel('t');                                    % name the label of x-axis 
    ylabel('dash(t)/ydash(t)');                     % name the label of y-axis 
    legend('dash','ydash','Location','Eastoutside');
    grid on;
    subplot(2,1,2)
    plot(t(1:length(Dot)),Dot);
    hold on;
    plot(t(1:length(Dot)),ydot);
    title('dot(t) and dot(t) after filter');
    xlabel('t');                                    % name the label of x-axis 
    ylabel('dot(t)/doty(t)');                       % name the label of y-axis 
    legend('dot','ydot','Location','Eastoutside');
    grid on;
    
    
    
    %% problrm 4.6(d)
    y=Dash.*cos(2*pi*f1*t(1:length(Dash)));
    yo=lsim(bf,af,y,t(1:length(y)));
    

    figure;
    subplot(2,1,1)
    plot(t(1:length(Dash)),y);
    title('orginal y(t)');                          % name the title of the figure 
    xlabel('t');                                    % name the label of x-axis 
    ylabel('y(t)');                                 % name the label of y-axis
    grid on;
    
    subplot(2,1,2)
    plot(t(1:length(Dash)),yo);
    title('y(t) after filter');                     % name the title of the figure 
    xlabel('t');                                    % name the label of x-axis
    ylabel('yo(t)');                                % name the label of y-axis
    grid on;
    