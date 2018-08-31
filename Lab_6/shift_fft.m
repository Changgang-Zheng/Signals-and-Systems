%Name: Matlab/CUDA: Signals and Systems Lab 5th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT

function  a=shift_fft(a)
    a=[a(floor((length(a)/2))+2:length(a)) a(1:floor(length(a)/2)+1)];
