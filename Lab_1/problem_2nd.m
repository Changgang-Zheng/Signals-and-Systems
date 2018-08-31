%Name: Matlab/CUDA: Signals and Systems Lab 1st
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT

function  problem_2nd
    figure; %create a new window for ploting
    nx=-3:1:7;
    ny3=-7:1:3;
    x=[0,0,0,2,0,1,-1,3,0,0,0];
    
    a=length(x);
    
    y1=zeros(1,11);
    y2=zeros(1,11);
    y3=zeros(1,11);
    y4=zeros(1,11);
    
    % The fist one/ right shift by two units
    for n=1:a-2
        y1(n+2)=x(n);
    end
    % The second one/ left shift by one units
    for n=1:a-1
        y2(n)=x(n+1);
    end
    % The third one/ inversed along y-axis
    for n=1:a
        y3(n)=x(a-n+1);
    end
     % The fourth one/ inversed along  y-axis and right shift by one unit
    for n=1:a-1
        y4(n+1)=y3(n);
    end
    
    subplot(1,1,1);     %build 1 rows and 1 columns of figure in that window, and place this figure in the first position of the window
    stem(nx,x)          %plot the figure of x
    title('Graph for x[n]');    %name the title of the first figure as 'Graph for x[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('x[n]');     %name the label of y-axis as 'x[n]'
    
    figure;             %create a new window for ploting
    
    subplot(4,1,1);     %place this figure in the first position of the window
    stem(nx,y1)         %plot the figure of y1
    title('Graph for y1[n]');   %name the title of the first figure as 'Graph for y1[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('y1[n]');    %name the label of y-axis as 'y1[n]'
    
    subplot(4,1,2);     %place this figure in the second position of the window
    stem(nx,y2)         %plot the figure of y2
    title('Graph for y2[n]');   %name the title of the second figure as 'Graph for y2[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('y2[n]');    %name the label of y-axis as 'y2[n]'
    
    subplot(4,1,3);     %place this figure in the third position of the window
    stem(ny3,y3)        %plot the figure of y3
    title('Graph for y3[n]');   %name the title of the thirt figure as 'Graph for y3[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('y3[n]');    %name the label of y-axis as 'y3[n]'
    
    subplot(4,1,4);     %place this figure in the fourth position of the window
    stem(ny3,y4)        %plot the figure of y4
    title('Graph for y4[n]');   %name the title of the fourth figure as 'Graph for y4[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('y4[n]');    %name the label of y-axis as 'y4[n]'