%Name: Matlab: Signals and Systems Lab 8th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 9.1 (a)(c) 


function  problem_1st

    %% Problem a -(i)
    up = [1 5];
    down = [1 2 3];
    solve_plot(up,down);
    title('Pole-Zero plot of H(S)');   
    xlabel('Re');                                           
    ylabel('Im');                            
    %% Problem a -(ii)
    up = [2 5 12];
    down = [1 2 10];
    solve_plot(up,down);
    title('Pole-Zero plot of H(S)');   
    xlabel('Re');                                           
    ylabel('Im');     
    %% Problem a -(iii)
    up = [2 5 12];
    down = [1 4 14 20];
    solve_plot(up,down);
    title('Pole-Zero plot of H(S)');   
    xlabel('Re');                                           
    ylabel('Im');     
    %% Problem c
    up = [1 2 5];
    down = [1 -3];
    solve_plot(up,down);
    title('Pole-Zero plot of H(S)');   
    xlabel('Re');                                           
    ylabel('Im');     
    
    
