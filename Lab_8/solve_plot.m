%Name: Matlab: Signals and Systems Lab 8th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT

function solve_plot(up, down)
    zero = roots(up);
    pole = roots(down);
    figure;
    plot(real(zero),imag(zero),'o','LineWidth',1.3);
    hold on;
    plot(real(pole),imag(pole),'x','LineWidth',1.3);
    axis([-6 6 -6 6]);
    
    %set(gca,'XTick',-4:0.5:4); 
    %set(gca,'YTick',-5:2:5);
    grid on;
end