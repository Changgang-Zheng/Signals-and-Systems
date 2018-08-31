%Name: Matlab/CUDA: Signals and Systems Lab 2nd
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT

function  problem_2nd
    a=5; % set constant value
    b=7; % set constant value   
    
    n_x=[-5:9];
    n_y=[-6:9];
    
    n=[-20:20];
    x_a1=zeros(1,41); % creat a all zero vector
    x_a1(1,21)=1;
    x_a2=zeros(1,41); % creat a all zero vector
    x_a2(1,21)=2;
    
    u=zeros(1,41); % creat a all zero vector
    
    for i=21:41
        u(i)=1;
    end
    
    x_b1=u;
    x_b2=zeros(1,41);

    y_input= sin((pi/2)*(a*x_a1+b*x_a2)); 
    y_output = a*sin((pi/2)*x_a1)+b*sin((pi/2)*x_a2);
    
    %% The plot of 1.4 a
    figure;             %create the first window for ploting 
    subplot(2,1,1);     % set the place to display the plotting result
    stem(n,y_input);    %plot the figure 
    title('Graph for the output for y[n] when x[n]=a*x1[n]+b*x2[n]');   %name the title of the figure as 'Graph for the output for y[n] when x[n]=a*x1[n]+b*x2[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('y[n] when x[n]=a*x1[n]+b*x2[n]');    %name the label of y-axis as 'y[n]'
    
    subplot(2,1,2);     % set the place to display the plotting result
    stem(n,y_output);   %plot the figure 
    title('Graph for the output for y[n]=a*y1[n]+b*y2[n]'); %name the title of the figure as 'Graph for the output for y[n]=a*y1[n]+b*y2[n]'
    xlabel('n');        %name the label of x-axis as 'n'
    ylabel('y[n]=a*y1[n]+b*y2[n]')  %name the label of y-axis as 'y[n]=a*y1[n]+b*y2[n]'
    %%
    
    for i=1:40
        x_b2(i)=x_b1(i+1);
    end
    
    Y=x_b2+x_b1;
    
    Y_display=zeros(1,16); % set constant value
    X_display=zeros(1,15); % set constant value
    
    for i=1:16
        Y_display(i)=Y(i+14);
    end
    
    for i=1:15
        X_display(i)=x_b1(i+15);
    end
    
    %% The plot of 1.4 b
    figure;         %create a window for ploting 
    subplot(2,1,1); %set the place to display the plotting result
    stem(n_x,X_display);    %plot the figure 
    title('Graph for the output for x[n]');   %name the title of the figure as 'Graph for the output for x[n]'
    xlabel('n');    %name the label of x-axis as 'n'
    ylabel('x[n]')  %name the label of y-axis as 'x[n]'
    
    subplot(2,1,2); %set the place to display the plotting result
    stem(n_y,Y_display);    %plot the figure 
    title('Graph for the output for y[n]');   %name the title of the figure as 'Graph for the output for y[n]'
    xlabel('n');    %name the label of x-axis as 'n'
    ylabel('y[n]=a*y1[n]+b*y2[n]') %name the label of y-axis as 'y[n]=a*y1[n]+b*y2[n]'
    %%
    
    %% The 1.4 c
    % x_c=zeros(1,41);    % set constant value
    % y_c=log(x_c);
    % y_c                 % Force to plot the y_c, which is all infinity however x_c finit which means unstable
    x_c = 2*cos(pi*n/10).^2;
    y_c=log(x_c);
    
    figure;         %create a window for ploting 
    subplot(2,1,1);
    stem(n,x_c);    %plot the figure 
    title('x_c[n]; Graph for checking the system is unstable');   % name the title of the figure as 'x[n]; Graph for checking the system is unstable'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('x_c[n]')% name the label of y-axis as 'x[n]'
    
    subplot(2,1,2);
    stem(n,y_c);    %plot the figure 
    ylim([-60,10]);
    title('y_c[n]; Graph for checking the system is unstable');   % name the title of the figure as 'x[n]; Graph for checking the system is unstable'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('y_c[n]')% name the label of y-axis as 'x[n]'
    
    %%
    x_f_linear_1=[-20:20];
    x_f_linear_2=[-10:30];
    x_F_linear=a*x_f_linear_1+b*x_f_linear_2;
    y_F_input_linear=n.*x_F_linear;
    y_F_output_linear=a*n.*x_f_linear_1+b*n.*x_f_linear_2;
    
    %% The plot of 1.4 f linear
    figure;         % create a window for ploting 
    
    subplot(4,1,1); % set the place to display the plotting result
    stem(n,x_f_linear_1);   %plot the figure 
    title('Graph for the x_f linear 1[n]');   %name the title of the figure as 'Graph for the x_f_linear_1'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('x_f linear 1[n]');   %name the label of y-axis as 'x_f_linear_1'
    
    subplot(4,1,2); % set the place to display the plotting result
    stem(n,x_f_linear_2);  % plot the figure 
    title('Graph for the x_f linear 2[n]');   %name the title of the figure as 'Graph for the x_f_linear_2'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('x_f linear 2[n]') % name the label of y-axis as 'x_f_linear_2'
    
    subplot(4,1,3); % set the place to display the plotting result
    stem(n,y_F_input_linear);   %plot the figure 
    title('Graph for the output for y[n] when x[n]=a*x_f linear 1[n]+b*x_f linear 2[n]');   %name the title of the figure as 'Graph for the output for y[n] when x[n]=a*x1[n]+b*x2[n'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('y[n] when x[n]=a*x_f linear 1[n]+b*x_f linear 2[n]');   %name the label of y-axis as 'y[n]'
    
    subplot(4,1,4); % set the place to display the plotting result
    stem(n,y_F_output_linear);  % plot the figure 
    title('Graph for the output for y_F_output_linear=a*n.*x_f linear 1+b*n.*x_f linear 2');   %name the title of the figure as 'Graph for the output for y_F_output_linear=a*n.*x_f_linear_1+b*n.*x_f_linear_2'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('y_F output linear=a*n.*x_f linear 1+b*n.*x_f linear 2') % name the label of y-axis as 'y_F_output_linear=a*n.*x_f_linear_1+b*n.*x_f_linear_2'
    %%
    
    x_f_invariant_1=zeros(1,41);
    x_f_invariant_2=zeros(1,41);
    
    for i=1:5
        x_f_invariant_1(i+18)=1;
    end
     for i=3:7
        x_f_invariant_2(i+18)=1;
    end
    
    y_f_invariant_1=n.*x_f_invariant_1;
    y_f_invariant_2=n.*x_f_invariant_2;
    
    %% The plot of 1.4 f invariant
    figure;     %create a window for ploting 
    
    subplot(2,2,1); % set the place to display the plotting result
    stem(n,y_f_invariant_1);%plot the figure 
    title('y1[n]; Graph for checking the property of the time invariant');   %name the title of the figure as 'y1[n];Graph for checking the property of the time invariant'
    xlabel('n');    %name the label of x-axis as 'n'
    ylabel('y1[n]') %name the label of y-axis as 'y1[n]'
    
    subplot(2,2,2); % set the place to display the plotting result
    stem(n,x_f_invariant_1);    %plot the figure 
    title('x1[n]; Graph for checking the property of the time invariant');   %name the title of the figure as 'x1[n];Graph for checking the property of the time invariant'
    xlabel('n');    %name the label of x-axis as 'n'
    ylabel('x1[n]') %name the label of y-axis as 'x1[n]'
    
    subplot(2,2,3); % set the place to display the plotting result
    stem(n,y_f_invariant_2);    % plot the figure 
    title('y2[n]; Graph for checking the property of the time invariant');   %name the title of the figure as 'y2[n]; Graph for checking the property of the time invariant'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('y2[n](get from the x2[n])') %name the label of y-axis as 'y2[n](get from the x2[n])'
    
    subplot(2,2,4); % set the place to display the plotting result
    stem(n,x_f_invariant_2);% plot the figure 
    title('x2[n]; Graph for checking the property of the time invariant');   % name the title of the figure as 'x2[n];Graph for checking the property of the time invariant'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('x2[n](get from the time shift of x1[n])') % name the label of y-axis as 'x2[n](get from the time shift of x1[n])'
    %%
    
    x_f_causal=u;
    y_f_causal=n.*x_f_causal;
    
    %% The plot of 1.4 f casual
    figure; % create a window for ploting 
    
    subplot(2,1,1); % set the place to display the plotting result
    stem(n,x_f_causal); % plot the figure 
    title('x[n]; Graph for checking the property of casual');   %name the title of the figure as 'x[n]; Graph for checking the property of casual'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('x[n]')  % name the label of y-axis as 'x[n]'
    
    subplot(2,1,2); % set the place to display the plotting result
    stem(n,y_f_causal); % plot the figure 
    title('y[n]; Graph for checking the property of casual');   %name the title of the figure as 'y[n]; Graph for checking the property of casual'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('y[n]')  % name the label of y-axis as 'y[n]'
    %%
    
    n_f_stable=[1:100];
    x_f_stable=ones(1,length(n_f_stable));
    y_f_stable=n_f_stable.*x_f_stable;
    
    %% The plot of 1.4 f stable
    figure; % create a window for ploting 
    
    subplot(2,1,1); % set the place to display the plotting result
    stem(n_f_stable,x_f_stable);    % plot the figure 
    title('x[n]; Graph for checking the property of the stability');   % name the title of the figure as 'x[n]; Graph for checking the property of the stability'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('x[n]')  % name the label of y-axis as 'x[n]'
    
    subplot(2,1,2); % set the place to display the plotting result
    stem(n_f_stable,y_f_stable);    % plot the figure 
    title('y[n]; Graph for checking the property of the stability');   % name the title of the figure as 'y[n]; Graph for checking the property of the stability'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('y[n]')  % name the label of y-axis as 'y[n]'
    %%
    
    inverse=1./n;
    x_f_invertible=ones(1,41);
    y_f_invertible=n.*x_f_invertible;
    y_f_invertible_to_x=y_f_invertible.*inverse;
    
    %% The plot of 1.4 f invertible
    figure;%create a window for ploting 
    
    subplot(4,1,1);% set the place to display the plotting result
    stem(n,x_f_invertible);%plot the figure 
    title('x[n]; Graph for checking the property of invertible');   %name the title of the figure as 'x[n]; Graph for checking the property of invertible'
    xlabel('n');   %name the label of x-axis as 'n'
    ylabel('x[n]') %name the label of y-axis as 'x[n]'
    
    subplot(4,1,2);% set the place to display the plotting result
    stem(n,y_f_invertible);%plot the figure 
    title('y[n]; Graph for checking the property of invertible');   % name the title of the figure as 'y[n]; Graph for checking the property of invertible'
    xlabel('n');   %name the label of x-axis as 'n'
    ylabel('y[n]') %name the label of y-axis as 'y[n]'
    
    subplot(4,1,3); % set the place to display the plotting result
    stem(n,inverse);% plot the figure 
    title('Inverse Function; Graph for checking the property of invertible');   % name the title of the figure as 'Inverse Function; Graph for checking the property of invertible'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('Inverse Function inverse=1/n') % name the label of y-axis as 'x[n]'
    
    subplot(4,1,4); % set the place to display the plotting result
    stem(n,y_f_invertible_to_x);    % plot the figure 
    title('Function inversed back to x[n]; Graph for checking the property of invertible');   % name the title of the figure as 'Function inversed back to x[n]; Graph for checking the property of invertible'
    xlabel('n');    % name the label of x-axis as 'n'
    ylabel('Function inversed back to x[n]') % name the label of y-axis as 'Function inversed back to x[n]'
    %%
   