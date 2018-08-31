%Name: Matlab: Signals and Systems Lab 6th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: 4.3(a)-(f) 

function  problem_1st
    %% problem 4.3(a)
    load splat
    y=y(1:8192);
    N=8192;
    fs=8192;
    sound(y,fs);
    y_hold=y;
    
    Y=fftshift(fft(y));
    Y_hold=Y;
    w=[-pi:2*pi/N:pi-pi/N]*fs;
    
    y=ifft(Y);
    y=real(y);
    
    
    Y=abs(fftshift(fft(y)));
    
    figure;
    subplot(3,1,1)

    plot([0:8191],y_hold);
    axis([0 9000 -2 2]);
    title('The graph of original y(t)');                    % name the title of the figure 
    xlabel('t');                                            % name the label of x-axis 
    ylabel('y(t)');                                         % name the label of y-axis 
    grid on;
    
    subplot(3,1,2)
    plot(w,Y');                                             % plot the picture
    axis([-30000 30000 -10 70]);
    title('The graph of Y(jw)');                            % name the title of the figure 
    xlabel('w');                                            % name the label of x-axis
    ylabel('Y(jw)');                                        % name the label of y-axis 
    grid on;
    
    subplot(3,1,3)
    plot([0:8191],y)
    axis([0 9000 -2 2]);
    title('The graph of y(t) got from the ifft');           % name the title of the figure as
    xlabel('t');                                            % name the label of x-axis 
    ylabel('y(t)');                                         % name the label of y-axis 
    grid on;
   
    %% 
    %% problem 4.3(b)
    Y1=conj(Y_hold);
    y1=real(ifft(Y1));
    sound(y1,fs)
    
    figure;
    subplot(2,1,1)

    plot([0:8191],y_hold);
    axis([-1000 9000 -4 7]);
    title('The graph of original y(t)');                        % name the title of the figure 
    xlabel('t');                                                % name the label of x-axis 
    ylabel('y(t)');                                             % name the label of y-axis 
    grid on;
    
    subplot(2,1,2)  
    plot([0:8191],y1);                                          % plot the picture
    axis([-1000 9000 -4 7]);
    title('The graph of y1(t)=real(ifft(conj(Y)))');            % name the title of the figure as
    xlabel('t');                                                % name the label of x-axis 
    ylabel('y1(t)');                                            % name the label of y-axis 
    grid on;
    
    
    
    %% 
    %% problem 4.3(c)
    
    Y2=abs(Y_hold);
    Y3=exp(1i.*phase(Y_hold));
    %% 
    %% problem 4.3(d)
    Y2=abs(Y_hold);
    y2=ifft(Y2);
    sound(y2,fs)
    
     %% problem 4.3(d)
    Y2=abs(Y_hold);
    y2=ifft(Y2);
    sound(y2,fs)
    
    figure;
    subplot(2,1,1);
    plot(w,Y2);
    title('The graph of original Y2(jw)');                      % name the title of the figure 
    xlabel('jw');                                               % name the label of x-axis
    ylabel('Y2(jw)');                                           % name the label of y-axis 
    grid on;
    
    subplot(2,1,2);    
    plot([0:8191],y2);
    title('The graph of original y2(t)');                       % name the title of the figure as
    xlabel('t');                                                % name the label of x-axis 
    ylabel('y2(t)');                                            % name the label of y-axis 
    grid on;
    %% 
    %% problem 4.3(e)
    Y3=exp(1i.*phase(Y_hold));
    y3=real(ifft(Y3));
    sound(y3,fs)
    
    figure;
    subplot(2,1,1);
    plot(w,Y3);
    title('The graph of original Y3(jw)');                      % name the title of the figure as
    xlabel('jw');                                               % name the label of x-axis
    ylabel('Y3(jw)');                                           % name the label of y-axis
    grid on;
    
    subplot(2,1,2);
    plot([0:8191],y3);
    title('The graph of original y3(t)');                       % name the title of the figure as
    xlabel('t');                                                % name the label of x-axis 
    ylabel('y3(t)');                                            % name the label of y-axis 
    grid on;
    %%
    
    %% problem 4.3(f)
    figure;
    subplot(3,1,1)
    plot([0:8191],y_hold);
    title('The graph of original y(t)');                        % name the title of the figure as
    xlabel('t');                                                % name the label of x-axis 
    ylabel('y(t)');                                             % name the label of y-axis 
    grid on;
    
    
    subplot(3,1,2)
    plot([0:8191],y2);
    title('The graph of original y2(t)');                       % name the title of the figure as
    xlabel('t');                                                % name the label of x-axis 
    ylabel('y2(t)');                                            % name the label of y-axis 
    grid on;
    
    subplot(3,1,3) 
    plot([0:8191],y3);
    title('The graph of y3(t)');                                % name the title of the figure as
    xlabel('t');                                                % name the label of x-axis 
    ylabel('y3(t)');                                            % name the label of y-axis 
    grid on;
    
    figure;
    subplot(3,1,1)
    plot(w,Y');                                                 % plot the picture
    title('The graph of Y(jw)');                                % name the title of the figure as
    xlabel('w');                                                % name the label of x-axis
    ylabel('Y(jw)');                                            % name the label of y-axis 
    grid on;
    
    subplot(3,1,2)  
    plot(w,Y2);                                                 % plot the picture
    title('The graph of Y2(jw)');                               % name the title of the figure as
    xlabel('w');                                                % name the label of x-axis 
    ylabel('Y2(jw)');                                           % name the label of y-axis 
    grid on;
    
    subplot(3,1,3)  
    plot(w,Y3);                                                 % plot the picture
    title('The graph of Y3(jw)');                               % name the title of the figure as
    xlabel('w');                                                % name the label of x-axis 
    ylabel('Y3(jw)');                                           % name the label of y-axis 
    grid on;
    %%