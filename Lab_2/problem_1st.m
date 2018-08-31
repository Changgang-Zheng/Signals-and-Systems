%Name: Matlab/CUDA: Signals and Systems Lab 2nd
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT

function  problem_1st

    x=sym('sin(2*pi*t/T)');                 % creat the sybolic expression of the signal
    
    x5=subs(x,'T','5');                     %Use the subs function to replacee T by 5
    
    ezplot(x5,[0,10]);                      % plot the discrete signal
    title('The graph of sin(2*pi*t/T)');    % name the title of the figure as 'The graph of sin(2*pi*t/T)'
    xlabel('n in the range of 2T');         % name the label of x-axis as 'n'
    ylabel('graph of sin(2*pi*t/T)')        % name the label of y-axis as 'The graph of sin(2*pi*t/T)'
    

    
