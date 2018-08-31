function solve_plot_tog(up, down)
    zero = roots(up);
    pole = roots(down);
    %figure;
    plot(real(zero),imag(zero),'o','LineWidth',1.3);
    hold on;
    plot(real(pole),imag(pole),'x','LineWidth',1.3);
    axis([-6 6 -6 6]);
    
    %set(gca,'XTick',-4:0.5:4); 
    %set(gca,'YTick',-5:2:5);
    grid on;
end