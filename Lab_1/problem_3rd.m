%Name: Matlab/CUDA: Signals and Systems Lab 1st
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT

function  problem_3rd

    syms t; %set t as a variable
    x1=cos(pi*t/5);
    x2=sin(pi*t/5);
    x3=exp(1i*2*pi*t/3)+exp(1i*pi*t);
    
    conjugate=subs(x3,'1i','-1i');  %Use the subs function to get the conjugate complex number of x3
    energy3=conjugate*x3;
    
    syms a
    Energy3=int(energy3,-a,a);  % Integral to get the Energy3(t from -a to a)
    Energy2=int(x2^2,-a,a);     % Integral to get the Energy2(t from -a to a)
    Energy1=int(x1^2,-a,a);     % Integral to get the Energy1(t from -a to a)
    
    E3=int(energy3,0,a);  % Integral to get the Energy3(t from 0 to a)
    E2=int(x2^2,0,a);     % Integral to get the Energy2(t from 0 to a)
    E1=int(x1^2,0,a);     % Integral to get the Energy1(t from 0 to a)
    
    Power1=E1/a;       % Get the average Power1
    Power2=E2/a;       % Get the average Power2
    Power3=E3/a;       % Get the average Power3
    
    P_together12=simplify(Power2+Power1); % Add the x2(t)'s power signals with x3(t)'s signal.
    
    E1=@(a)(a/2 + (5*sin((2*pi*a)/5))/(4*pi));    % Calculate the total energy E1 at a>=t>=-a
    E2=@(a)(a/2 - (5*sin((2*pi*a)/5))/(4*pi));    % Calculate the total energy E2 at a>=t>=-a
    E3=@(a)(2*a + (6*sin((pi*a)/3))/pi);          % Calculate the total energy E3 at a>=t>=-a
    
    fprintf('E1 equals to %.5g during a period\n',E1(10)); % Print the total energy E1 at a>=t>=-a
    fprintf('E2 equals to %.5g during a period\n',E2(10)); % Print the total energy E2 at a>=t>=-a
    fprintf('E3 equals to %.5g during a period\n',E3(6)); % Print the total energy E3 at a>=t>=-a
    
    
    figure; %create a new window for ploting
    
    subplot(4,1,1);         %build 4 rows and 1 columns of figure in that window, and place this figure in the first position of the window
    fplot(x1, [-10,10]);    %plot the figure of x1 in the range of -10<=t<=10
    xlabel('t');            %name the label of x-axis as 't'
    ylabel('x1(t)');        %name the label of y-axis as 'x1(t)'
    title('Graph for x1(t)');   %name the title of the first figure as 'Graph for x1(t)'
    
    subplot(5,1,2);         %place this figure in the second position of the window
    fplot(x2, [-10,10]);    %plot the figure of x2 in the range of -10<=t<=10
    xlabel('t');            %name the label of x-axis as 't'
    ylabel('x2(t)');        %name the label of y-axis as 'x2(t)'
    title('Graph for x2(t)');   %name the title of the second figure as 'Graph for x2(t)'
    
    
    subplot(4,1,3);         %place this figure in the third position of the window
    fplot(imag(x3),[-6,6]); %plot the figure of x3(imaginary part） in the range of -6<=t<=6
    xlabel('t');            %name the label of x-axis as 't'
    ylabel('imagine x3(t)');    %name the label of y-axis as 'imagine x3(t)'
    title('Graph for imagine part of x3(t)');   %name the title of the third figure as 'Graph for imagine x3(t)'
    
    subplot(4,1,4);         %place this figure in the fourth position of the window
    fplot(real(x3),[-6,6]); %plot the figure of x3(real part) in the range of -6<=t<=6
    xlabel('t');            %name the label of x-axis as 't'
    ylabel('real x3(t)');   %name the label of y-axis as 'real x3(t)'
    title('Graph for real part of x3(t)');  %name the title of the fourth figure as 'Graph for real x3(t)'
    
    
    figure; %create a second window for ploting 

    subplot(3,1,1);                 %build 3 rows and 1 columns of figure in that window, and place this figure in the second position of the window
    ezplot(E1,[0,30]);         %plot the figure of Energy1 in the range of -a<=t<=a
    xlabel('a');                    %name the label of x-axis as 'a'
    ylabel('total energy1(a)');     %name the label of y-axis as 'total energy1(a)'
    title('Graph for total energy1(a)');%name the title of the fourth figure as 'Graph for total energy1(a)'

    
    subplot(3,1,2);                 %place this figure in the second position of the window
    ezplot(E2,[0,30]);         %plot the figure of Energy2 in the range of -a<=t<=a
    xlabel('a');                    %name the label of x-axis as 'a'
    ylabel('total energy2(a)');     %name the label of y-axis as 'total energy2(a)'
    title('Graph for total energy2(a)');%name the title of the fourth figure as 'Graph for total energy2(a)'

    
    subplot(3,1,3);                 %place this figure in the third position of the window
    ezplot(E3,[0,30]);         %plot the figure of Energy3 in the range of -a<=t<=a
    xlabel('a');                    %name the label of x-axis as 'a'
    ylabel('total energy3(a)');     %name the label of y-axis as 'total energy3(a)'
    title('Graph for total energy3(a)');%name the title of the fourth figure as 'Graph for total energy3(a)'
    
    figure; %create a second window for ploting 

    subplot(3,1,1);                 %build 3 rows and 1 columns of figure in that window, and place this figure in the second position of the window
    ezplot(Energy1,[0,30]);         %plot the figure of Energy1 in the range of -0<=t<=30
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('total energy1(t)');     %name the label of y-axis as 'total energy1(t)'
    title('Graph for total energy1(t)');%name the title of the fourth figure as 'Graph for total energy1(t)'

    
    subplot(3,1,2);                 %place this figure in the second position of the window
    ezplot(Energy2,[0,30]);         %plot the figure of Energy2 in the range of -0<=t<=30
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('total energy2(t)');     %name the label of y-axis as 'total energy2(t)'
    title('Graph for total energy2(t)');%name the title of the fourth figure as 'Graph for total energy2(t)'

    
    subplot(3,1,3);                 %place this figure in the third position of the window
    ezplot(Energy3,[0,30]);         %plot the figure of Energy3 in the range of -0<=t<=30
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('total energy3(t)');     %name the label of y-axis as 'total energy3(t)'
    title('Graph for total energy3(t)');%name the title of the fourth figure as 'Graph for total energy3(t)'

    
    figure;%create a second window for ploting 
    
    subplot(3,1,1);                 %place this figure in the first position of the window
    ezplot(Power1,[0.1,60]);        %plot the figure of Power1 in the range of -0.1<=t<=60
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('average power1(t)');    %name the label of y-axis as 'total Power1(t)'
    title('Graph for average power1(t)');%name the title of the fourth figure as 'Graph for average power1(t)'
    
    subplot(3,1,2);                 %place this figure in the second position of the window
    ezplot(Power2,[0.1,60]);        %plot the figure of Power2 in the range of -0.1<=t<=60
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('average power2(t)');    %name the label of y-axis as 'total Power2(t)'
    title('Graph for average power2(t)');   %name the title of the fourth figure as 'Graph for average power2(t)'
    
    subplot(3,1,3);                 %place this figure in the third position of the window
    ezplot(Power3,[0.1,60]);        %plot the figure of Power3 in the range of -0.1<=t<=60
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('average power3(t)');    %name the label of y-axis as 'total Power3(t)'
    title('Graph for average power3(t)');%name the title of the fourth figure as 'Graph for average power3(t)'
    
    figure;                         %place this figure in the third position of the window
    ezplot(P_together12,[0.1,600]); %plot the figure of P_together12 in the range of -0.1<=t<=600
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('average power1(t)+power1(t)');    %name the label of y-axis as 'average power1(t)+power2(t)'
    title('Graph for average power1(t)+power2(t)');%name the title of the fourth figure as 'Graph for average power1(t)+power2(t)'
    
    figure;                         %place this figure in the third position of the window
    ezplot(Power1,[0.1,60]);        %plot the figure of Power1 in the range of -0.1<=t<=60
    hold on;
    ezplot(Power2,[0.1,60]);        %plot the figure of Power2 in the range of -0.1<=t<=60
    xlabel('t');                    %name the label of x-axis as 't'
    ylabel('average power1(t) and power2(t)');    %name the label of y-axis as 'Graph for average power1(t) and power2(t)'
    title('Graph for average power1(t) and power2(t)');%name the title of the fourth figure as 'Graph for average power1(t) and power2(t)'
    

    
    
    Energy1     %force it to display Energy1
    Energy2     %force it to display Energy2
    Energy3     %force it to display Energy3
      
    Power1      %force it to display Energy1
    simplified_Power1=simplify(Power1)  %force it to display simplified Energy1 (don't neet to simplified it twice as: simplify(simplify(Power1)) = simplify(Power1))
    Power2      %force it to display Energy2
    simplified_Power2=simplify(Power2)  %force it to display simplified Energy2 (simplified it twice)
    Power3      %force it to display Energy3
    simplified_Power3=simplify(Power3)  %force it to display simplified Energy3 (simplified it twice)
    
    X1_add_X2=simplify(x1+x2)
    P_together12%force it to display P_together12
