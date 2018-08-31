%Name: Matlab: Signals and Systems Lab 8th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 10.1(a)(b)


function  problem_2nd

    %% Problem a
    zero = [1 -1 0];
    pole = [1 3 2];
    figure;
    dpzplot(zero,pole);
    title('Pole-Zero plot of H(z)');   
    xlabel('Re');                                           
    ylabel('Im');     
    %% Problem b
    zero = 1;
    pole = [1 1 0.5];
    figure;
    dpzplot(zero,pole);
    title('Pole-Zero plot of H(z)');   
    xlabel('Re');                                           
    ylabel('Im');     