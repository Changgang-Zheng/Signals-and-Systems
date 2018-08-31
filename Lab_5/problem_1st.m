%Name: Matlab/CUDA: Signals and Systems Lab 5th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: Perform convolution. 3.2

function  problem_1st
    %% problem a
    a1=[1 -0.8];
    b1=[2 0 -1];
    %%
    %% problem b
    N=4;
    [H1,omega1]=freqz(b1,a1,N);
    H1.'
    omega1.'
    %% 
    %% problem c
    N=4;
    [H2,omega2]=freqz(b1,a1,N,'Whole');
    H2.'
    omega2.'
    %% 