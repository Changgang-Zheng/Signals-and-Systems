%Name: Matlab: Signals and Systems Lab 5th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: Perform convolution. 3.4(a)(b)(c)

function  problem_2nd
    
    %% problem 3.4(a)
    n=[-20:100];
    x1=exp(1i*(pi/4).*n);
    x2=sin((pi/8).*n+pi/16);
    x3=(9/10).^n;
    x4=n+1;
    
    figure;                                                 % create a new window for plotting
    subplot(4,1,1);
    stem(n,real(x1),'.');                                   % plot the picture
    hold on;
    stem(n,imag(x1));                                       % plot the picture
    title('The real part and imaginary part of x1[n]');     % name the title of the figure as
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('x1[n]');                                        % name the label of y-axis as 'x1[n]'
    legend('Real part of x1[n]','imaginary part of x1[n]'); % set the label for each line 'Real part of x1[n]','imaginary part of x1[n]'
    grid on;
    
 
    subplot(4,1,2);                                         % set the place for pictures in a picture, which is plotted in a window
    stem(n,x2,'.');                                         % plot the picture
    title('The graph of x2[n]');                            % name the title of the figure as 'The graph of x2[n]'
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('x2[n]');                                        % name the label of y-axis as 'x2[n]'
    grid on;
    
    subplot(4,1,3);                                         % set the place for pictures in a picture, which is plotted in a window
    stem(n,x3,'.');                                         % plot the picture
    title('The graph of x3[n]');                            % name the title of the figure as
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('x3[n]');                                        % name the label of y-axis as 'x3[n]'
    grid on;
    
    subplot(4,1,4);                                         % set the place for pictures in a picture, which is plotted in a window
    stem(n,x4,'.');                                         % plot the picture
    title('The graph of x4[n]');                            % name the title of the figure as
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('x4[n]');                                        % name the label of y-axis as 'x4[n]'
    grid on;


    %%
    
    %% problem 3.4(b)
    a=[1 -0.25];
    b=[1 0.9];
    y1=filter(b,a,x1);
    y2=filter(b,a,x2);
    y3=filter(b,a,x3);
    y4=filter(b,a,x4);
    
    figure;                                                 % create a new window for plotting       
    subplot(4,1,1);                                         

    stem([-20:-1],real(y1(1:20)),'.','g');                  % plot the picture
    hold on;
    stem([0:100],real(y1(21:121)),'.');                     % plot the picture
    hold on;
    stem([-20:-1],imag(y1(1:20)),'.','m');                  % plot the picture
    hold on;
    stem([0:100],imag(y1(21:121)),'.');                     % plot the picture
    title('the imaginary part and the real part of the response of y1[n]'); 
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('y1[n](imaginary&real)');                        % name the label of y-axis as 'y1[n](imaginary) and y1[n](real)'
    legend('real part of y1[n]','real part of y1[n]','imaginary part of y1[n]','imaginary part of y1[n]')
    grid on;
    
                                                            % create a new window for plotting
    subplot(4,1,2);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([-20:-1],y2(1:20),'.');                            % plot the picture
    hold on;
    stem([0:100],y2(21:121),'.');                           % plot the picture
    title('y2[n]----the response of x2[n]');                % name the title of the figure as 'y2[n]----the response of x2[n]'
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('y2[n]');                                        % name the label of x-axis as 'y2[n]'
    grid on;
    
    subplot(4,1,3);                                         % set the place for pictures in a picture, which is plotted in a window
     stem([-20:-1],y3(1:20),'.');                           % plot the picture
    hold on;
    stem([0:100],y3(21:121),'.');                           % plot the picture                                        % plot the picture
    title('y3[n]----the response of x3[n]');                % name the title of the figure as
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('y3[n]');                                        % name the label of x-axis as 'y3[n]'
    grid on;
    
    subplot(4,1,4);                                         % set the place for pictures in a picture, which is plotted in a window
     stem([-20:-1],y4(1:20),'.');                           % plot the picture
    hold on;
    stem([0:100],y4(21:121),'.');                           % plot the picture
    title('y4[n]----the response of x4[n]');                % name the title of the figure as
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('y4[n]');                                        % name the label of x-axis as 'y4[n]'
    grid on;

    %% 
    
    %% problem 3.4(c)
    H1=y1./x1;
    H2=y2./x2;
    H3=y3./x3;
    H4=y4./x4;
    % H1_real=real(y1)./real(x1); % wrong
    % H1_imag=imag(y1)./imag(x1); % wrong
    H1_real=real(y1./x1);
    H1_imag=imag(y1./x1);
    
    
    figure;                                                 % create a new window for plotting
    subplot(4,1,1);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([-20:-1],H1_real(1:20),'.','g');                   % plot the picture
    hold on;
    stem([0:100],H1_real(21:121),'.');                      % plot the picture
    hold on;
    stem([-20:-1],H1_imag(1:20),'.','m');                   % plot the picture
    hold on;
    stem([0:100],H1_imag(21:121),'.');                      % plot the picture
    title('real & imaginary part of H1');                   % name the title of the figure as
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('H1-real & H1-imag[n]');                         % name the label of x-axis as 'H1_imag[n]'
    legend('real part of H1[n]','real part of H1[n]','imaginary part of H1[n]','imaginary part of H1[n]')
    grid on;
    
    subplot(4,1,2);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([-20:-1],H2(1:20),'.');                            % plot the picture
    hold on;
    stem([0:100],H2(21:121),'.');                           % plot the picture
    title('H2[n]');                                         % set the title
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('H2[n]');                                        % name the label of y-axis as H2[n]
    grid on;
    
    subplot(4,1,3);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([-20:-1],H3(1:20),'.');                            % plot the picture
    hold on;
    stem([0:100],H3(21:121),'.');                           % plot the picture
    title('H3[n]');                                         % set the title
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('H3[n]');                                        % name the label of y-axis as H3[n]
    grid on;
    
    subplot(4,1,4);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([-20:-1],H4(1:20),'.');                            % plot the picture
    hold on;
    stem([0:100],H4(21:121),'.');                           % plot the picture
    title('H4[n]');                                         % set the title
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('H4[n]');                                        % name the label of y-axis as H4[n]
    grid on;

    %% 