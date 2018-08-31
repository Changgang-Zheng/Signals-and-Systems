%Name: Matlab: Signals and Systems Lab 8th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 9.2 (a)(b)


function  problem_3rd
    
    %% Problem a
    zero = 1;
    a1 = [1 0 1];
    a2 = [1 0.5 1];
    a3 = [1 2 1];
    a4 = [1 4 1];
    solve_plot(zero,a1);
    title('Pole-Zero plot of H_1(s)');   
    xlabel('Re');                                           
    ylabel('Im');   
    solve_plot(zero,a2);
    title('Pole-Zero plot of H_2(s)');   
    xlabel('Re');                                           
    ylabel('Im');   
    solve_plot(zero,a3);
    title('Pole-Zero plot of H_3(s)');   
    xlabel('Re');                                           
    ylabel('Im');   
    solve_plot(zero,a4);
    title('Pole-Zero plot of H_4(s)');   
    xlabel('Re');                                           
    ylabel('Im');   
    
    figure;
    solve_plot_tog(zero,a1);
    solve_plot_tog(zero,a2);
    solve_plot_tog(zero,a3);
    solve_plot_tog(zero,a4);
    title('Pole-Zero plot of H_1(s) to H_2(s)');   
    xlabel('Re');                                           
    ylabel('Im'); 
    legend('H_1(s)','H_2(s)','H_3(s)','H_4(s)')
    %% Problem a
    omega = -5:0.1:5;
    H1 = freqs(zero,a1,omega);
    H2 = freqs(zero,a2,omega);
    H3 = freqs(zero,a3,omega);
    H4 = freqs(zero,a4,omega);
    figure;
    subplot(221);
    plot(omega,abs(H1));
    xlabel('w');
    ylabel('|H_1(jw)|');
    title('|H_1(jw)|');
    set(gca,'XTick',-5:2.5:5); 
    %set(gca,'YTick',-5:2:5);
    grid;
    subplot(222);
    plot(omega,abs(H2));
    xlabel('w');
    ylabel('|H_2(jw)|');
    title('|H_2(jw)|');
    set(gca,'XTick',-5:2.5:5); 
    %set(gca,'YTick',-5:2:5);
    grid;
    subplot(223);
    plot(omega,abs(H3));
    xlabel('w');
    ylabel('|H_3(jw)|');
    title('|H_3(jw)|');
    set(gca,'XTick',-5:2.5:5); 
    %set(gca,'YTick',-5:2:5);    
    grid;
    subplot(224);
    plot(omega,abs(H4));
    xlabel('w');
    ylabel('|H_4(jw)|');
    title('|H_4(jw)|');
    set(gca,'XTick',-5:2.5:5); 
    %set(gca,'YTick',-5:2:5);    
    grid;
