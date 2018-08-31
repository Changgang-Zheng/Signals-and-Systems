%Name: Matlab: Signals and Systems Lab 6th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 4.4(a)-(e)

function  problem_2nd
    %% problem 4.4(a)
    
    syms a W;
    H_analytical=@(a,W)(a/(a+1i*W));
    %%
    %% problem 4.4(b)
    w=linspace(0,10);
    a1=[1 3];
    b1=3;
    a2=[1 1/3];
    b2=1/3;
    H1=freqs(b1,a1,w)'; 
    H2=freqs(b2,a2,w)';
    
    
    figure;
    subplot(2,1,1)
    plot(w,abs(H1));
    hold on;
    plot(w,abs(H2));
    title('The graph of |H1(jw)|&|H2(jw)|');                % name the title of the figure 
    xlabel('w');                                            % name the label of x-axis 
    ylabel('|H1(jw)|&|H2(jw)|');                            % name the label of y-axis
    legend('|H1(jw)|','|H2(jw)|');
    grid on;
    
    
    H1_an=zeros(1,length(w));
    H2_an=zeros(1,length(w));
    for i=1:length(w)
        H1_an(i)=H_analytical(3,w(i));
        H2_an(i)=H_analytical(1/3,w(i));
    end
    
    subplot(2,1,2)
    plot(w,abs(H1_an));
    hold on;
    plot(w,abs(H2_an));
    title('The graph of |H1-analytical(jw)|&|H2-analytical(jw)|');      % name the title of the figure 
    xlabel('w');                                                        % name the label of x-axis 
    ylabel('|H1-analytical(jw)| & |H2-analytical(jw)|');                % name the label of y-axis 
    legend('|H1-analytical(jw)|','|H2-analytical(jw)|');
    grid on;
    
    
    figure;
    subplot(2,1,1)
    plot(w,phase(H1));
    hold on;
    plot(w,phase(H2));
    title('The graph of phase-H1(jw)& phase-H2(jw)');                   % name the title of the figure 
    xlabel('w');                                                        % name the label of x-axis 
    ylabel('phase-H1(jw)&phase-H2(jw)');                                % name the label of y-axis 
    legend('phase-H1(jw)','phase-H2(jw)');
    grid on;
    

    subplot(2,1,2)
    plot(w,phase(H1_an));
    hold on;
    plot(w,phase(H2_an));
    title('The graph of phase-H1-analytical(jw)&phase-H2-analytical(jw)');  % name the title of the figure 
    xlabel('w');                                                            % name the label of x-axis 
    ylabel('phase-H1-analytical(jw) & phase-H2-analytical(jw)');            % name the label of y-axis
    legend('phase-H1-analytical(jw)','phase-H2-analytical(jw)');
    grid on;
    %%
    
    %% problem 4.4(c)
    %%
    t=linspace(0,5);
    h1=impulse(b1,a1,t);
    h2=impulse(b2,a2,t);
    figure;
    subplot(2,1,1)
    plot(t,h1);
    xlabel('t');
    ylabel('h1(t)');
    title('UIR h1(t)');
    grid on;
    subplot(2,1,2);
    plot(t,h2);
    xlabel('t');
    ylabel('h2(t)');
    title('UIR h2(t)');
    grid on;
    %%
    
    %% problem 4.4(d)
    %r1=diff(h2')./diff(t);
    %R1=diff(H2')./diff(w);
    
    figure;
    subplot(2,1,1)
    plot(t,abs(h1));
    hold on;
    plot(t,abs(h2));
    xlabel('t');
    ylabel('h1&h2(t)');
    title('h1&h2(t)');
    legend('h1','h2(t)');
    grid on;
    subplot(2,1,2);
    plot(w,abs(H1));
    hold on;
    plot(w,abs(H2));
    xlabel('w');
    ylabel('H1(jw)&H2(jw)');
    title('H1(jw)&H2(jw)');
    legend('H1(jw)','H2(jw)');
    grid on;
    %%

    %% problem 4.4(e)
    wc=3;
    [b2,a2]=butter(2,wc,'s');
    Hb=freqs(b2,a2,w)'; 
    
    figure;

    plot(linspace(0,10),abs(Hb));
    title('The graph of |H-butter(jw)|&|H1|');              % name the title of the figure as
    xlabel('w');                                            % name the label of x-axis 
    ylabel('|H-butter(jw)|&|H1|');                          % name the label of y-axis 
    hold on;
    plot(w,abs(H1));                                        % name the label of y-axis 
    legend('|H-butter(jw)|','|H1|');
    grid on;
    %%