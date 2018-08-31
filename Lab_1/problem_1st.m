%Name: Matlab/CUDA: Signals and Systems Lab 1st
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT

function  problem_1st
    figure;             %create a new window for ploting
    n=1:31;
    x1=sin(pi*n/4).*cos(pi*n/4);
    x2=cos(pi*n/4).^2;
    x3=sin(pi*n/4).*cos(pi*n/8);

    
    subplot(3,1,1);     %build 3 rows and 1 columns of figure in that window, and place this figure in the first position of the window
    stem(n,x1);         %plot the figure of x1
    title('Graph for x1[n]');   %name the title of the figure as 'Graph for x1[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('x1[n]');    %name the label of y-axis as 'x1[n]'

    subplot(3,1,2);     %place this figure in the second position of the window
    stem(n,x2);         %plot the figure of x2
    title('Graph for x2[n]');   %name the title of the figure as 'Graph for x2[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('x2[n]');    %name the label of y-axis as 'x2[n]'
    
    subplot(3,1,3);     %place this figure in the third position of the window
    stem(n,x3);         %plot the figure of x3
    title('Graph for x3[n]');   %name the title of the figure as 'Graph for x3[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('x3[n]');    %name the label of y-axis as 'x3[n]'