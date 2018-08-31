%Name: Matlab/CUDA: Signals and Systems Lab 5th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: Perform convolution. 3.5(d)(e)(f)(h)

function  problem_3rd
    
    %% problem 3.5(d)
    N=64;
    n=[0:63];
    X1=[ones(1,8)];
    X2=[ones(1,8) zeros(1,8)];
    X3=[ones(1,8) zeros(1,24)];
    x1=zeros(1,64);
    x2=zeros(1,64);
    x3=zeros(1,64);
    N1=8;
    N2=16;
    N3=32;
    
    for i=1:N
        n1=mod(i-1,N1)+1;
        x1(i)=X1(n1);
        n2=mod(i-1,N2)+1;
        x2(i)=X2(n2);
        n3=mod(i-1,N3)+1;
        x3(i)=X3(n3);
    end

    figure;                                                 % create a new window for plotting
    subplot(3,1,1);                                         % set the place for pictures in a picture, which is plotted in a window
    stem(n,x1,'.');                                         % plot the picture
    title('The graph of x1[n]');                            % name the title of the figure as'The graph of x1[n]'
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('x1[n]');                                        % name the label of y-axis as 'x1[n]'
    grid on;
    
    subplot(3,1,2);                                         % set the place for pictures in a picture, which is plotted in a window
    stem(n,x2,'.');                                         % plot the picture
    title('The graph of x2[n]');                            % name the title of the figure as 'The graph of x2[n]'
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('x2[n]');                                        % name the label of y-axis as 'x2[n]'
    grid on;
    
    subplot(3,1,3);                                         % set the place for pictures in a picture, which is plotted in a window
    stem(n,x3,'.');                                         % plot the picture
    title('The graph of x3[n]');                            % name the title of the figure as 'The graph of x3[n]'
    xlabel('n');                                            % name the label of x-axis as 'n'
    ylabel('x3[n]');                                        % name the label of y-axis as 'x3[n]'
    grid on;
    %%
    %% problem 3.5(e)

    
    a1=(1/N1)*fft(x1(1:8));
    a2=(1/N2)*fft(x2(1:16));
    a3=(1/N3)*fft(x3(1:32));
   
    
    
    figure;                                                 % create a new window for plotting
    subplot(3,1,1);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([0:7],abs(a1(1:8)),'.');                           % plot the picture
    title('a1[k]');
    xlabel('k');                                            % name the label x
    ylabel('a1[k]');                                        % name the label y
    grid on;                                                % generate the grid
    
    subplot(3,1,2);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([0:15],abs(a2(1:16)),'.');                         % plot the picture
    title('x2[k]');
    xlabel('k');                                            % name the label x
    ylabel('a2[k]');                                        % name the label y
    grid on;                                                % generate the grid
    
    subplot(3,1,3);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([0:31],abs(a3(1:32)),'.');                         % plot the picture
    title('a3[k]');
    xlabel('k');                                            % name the label x
    ylabel('a3[k]');                                        % name the label y
    grid on;  
    
    
    
    a1=shift_fft(a1);
    a2=shift_fft(a2);
    a3=shift_fft(a3);
    
    %{
    A1=a1;
    A2=a2;
    A3=a3;
    
    for i=1:length(a1)/2-1
        a1(length(a1)/2)=A1(1);
        a1(length(a1)/2+i)=A1(1+i);
        a1(length(a1)/2-i)=A1(length(a1)-i+1);
        a2(length(a2)/2)=A2(1);
        a2(length(a2)/2+i)=A2(1+i);
        a2(length(a2)/2-i)=A2(length(a2)-i+1);
        a3(length(a3)/2)=A3(1);
        a3(length(a3)/2+i)=A3(1+i);
        a3(length(a3)/2-i)=A3(length(a3)-i+1);
    end
    %}
    
    figure;                                                     % create a new window for plotting
    subplot(4,1,1);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([0:7],x1(1:8),'.');                                    % plot the picture
    title('x1[n]');
    xlabel('n');                                                % name the label x
    ylabel('x1');                                               % name the label y
    grid on;                                                    % generate the grid
    

    subplot(4,1,2);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a1)/2)+1:length(a1)/2],a1,'.');         % plot the picture
    title('a[k] of x1');
    xlabel('k');                                                % name the label x
    ylabel('a[k]');                                             % name the label y
    grid on;                                                    % generate the grid
    
    subplot(4,1,3);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a1)/2)+1:length(a1)/2],abs(a1),'.');    % plot the picture
    title('Amplitude of a[k]');
    xlabel('k');                                                % name the label x
    ylabel('|a[k]|');                                           % name the label y
    grid on;                                                    % generate the grid
    
    subplot(4,1,4);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a1)/2)+1:length(a1)/2],phase(a1),'.');  % plot the picture
    title('Phase of a[k]');                                     % set the title
    xlabel('k');                                                % name the label x
    ylabel('Phase of a[k]');                                    % name the label y
    grid on;                                                    % generate the grid
    
    
    figure;                                                     % create a new window for plotting
    subplot(4,1,1);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([0:15],x2(1:16),'.');                                  % plot the picture
    title('x2[n]');
    xlabel('n');                                                % name the label x
    ylabel('x2[n]');                                            % name the label y
    grid on;                                                    % generate the grid
    
    subplot(4,1,2);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a2)/2)+1:length(a2)/2],a2,'.');         % plot the picture
    title('a[k] of x2');                                        % set the title
    xlabel('k');                                                % name the label x
    ylabel('a[k]');                                             % name the label y
    grid on;                                                    % generate the grid
    
    subplot(4,1,3);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a2)/2)+1:length(a2)/2],abs(a2),'.');    % plot the picture
    title('Amplitude of a[k]');
    xlabel('k');                                                % name the label x
    ylabel('|a[k]|');                                           % name the label y
    grid on;                                                    % generate the grid
    
    subplot(4,1,4);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a2)/2)+1:length(a2)/2],phase(a2),'.');  % plot the picture
    title('Phase of a[k]');
    xlabel('k');                                                % name the label x
    ylabel('Phase of a[k]');                                    % name the label y
    grid on;                                                    % generate the grid

    figure;                                                     % create a new window for plotting
    subplot(4,1,1);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([0:31],x3(1:32),'.');                                  % plot the picture
    title('x3[n]');                                             % set the title
    xlabel('k');                                                % name the label x
    ylabel('x3[n]');                                            % name the label y
    grid on;                                                    % generate the grid
    
    
    
    subplot(4,1,2);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a3)/2)+1:length(a3)/2],a3,'.');         % plot the picture
    title('a[k] of x3');                                        % set the title
    xlabel('k');                                                % name the label x
    ylabel('a[k]');                                             % name the label y
    grid on;                                                    % generate the grid
    
    subplot(4,1,3);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a3)/2)+1:length(a3)/2],abs(a3),'.');    % plot the picture
    title('Amplitude of a[k]');                                 % set the title
    xlabel('k');                                                % name the label x
    ylabel('|a[k]|');                                           % name the label y
    grid on;                                                    % generate the grid
    
    subplot(4,1,4);                                             % set the place for pictures in a picture, which is plotted in a window
    stem([-floor(length(a3)/2)+1:length(a3)/2],phase(a3),'.');  % plot the picture
    title('Phase of a[k]');                                     % set the title
    xlabel('k');                                                % name the label x
    ylabel('Phase of a[k]');                                    % name the label y
    grid on;                                                    % generate the grid

    

    %%
    %% problem 3.5(f)
    syms k n;
    E=@(k,n)(exp(k*1i*(2*pi/32)*n));
    
    x3_2=zeros(1,32);
    x3_8=zeros(1,32);
    x3_12=zeros(1,32);
    x3_all=zeros(1,32);
    
    for n=0:31
        for k=-2:2
            x3_2(n+1)=real(x3_2(n+1)+E(k,n)*a3(16+k));
        end
        for k=-8:8
            x3_8(n+1)=real(x3_8(n+1)+E(k,n)*a3(16+k));
        end
        for k=-12:12
            x3_12(n+1)=real(x3_12(n+1)+E(k,n)*a3(16+k));
        end
        for k=-15:16
            x3_all(n+1)=real(x3_all(n+1)+E(k,n)*a3(16+k));
        end
    end

    %%
    %% problem 3.5(h)
    
    figure;                                                 % create a new window for plotting
    subplot(4,1,1);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([0:length(x3_2)-1],x3_2,'.');                      % plot the picture
    title('x3-2[n]');                                       % set the title
    xlabel('n');                                            % name the label x
    ylabel('x3-2[n]');                                      % name the label y
    grid on;                                                % generate the grid
    
    subplot(4,1,2);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([0:length(x3_8)-1],x3_8,'.');                      % plot the picture
    title('x3-8[n]');                                       % set the title
    xlabel('n');                                            % name the label x
    ylabel('x3-8[n]');                                      % name the label y
    grid on;                                                % generate the grid
    
    subplot(4,1,3);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([0:length(x3_12)-1],x3_12,'.');                    % plot the picture
    title('x3-12[n]');                                      % set the title
    xlabel('n');                                            % name the label x
    ylabel('x3-12[n]');                                     % name the label y
    grid on;                                                % generate the grid
    
    subplot(4,1,4);                                         % set the place for pictures in a picture, which is plotted in a window
    stem([0:length(x3_all)-1],x3_all,'.');                  % plot the picture
    title('x3-all[n]');                                     % set the title
    xlabel('n');                                            % name the label x
    ylabel('x3-all[n]');                                    % name the label y
    grid on;                                                % generate the grid
    
    %%