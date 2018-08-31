%Name: Matlab/CUDA: Signals and Systems Lab 4th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: Perform convolution. 2.2(a)(b)(c)(d)(e)(f)(g)


function  problem_1st
    %% problem a
    a1=[1];
    b1=[0.5 1 2];
    %%
    
    %% problem b
    
    a2=[1 -0.8];
    b2=[2];
    
    %%
    
    %% problem c
        
    a3=[1 -0.8];
    b3=[0 2];
    %%
    
    %% problem d
    n=[1:4];
    x=[1 2 3 4];
    y1=filter(b1,a1,x);
    y2=filter(b2,a2,x);
    y3=filter(b3,a3,x);
  
    
    figure;                         % create a new window for plotting
    stem(n,y1);                     % plot the picture
    title('The graph of y1[n]');    % name the title of the figure as 'The graph of y1[n]'
    xlabel('n');                    % name the label of x-axis as 't'
    ylabel('y1[n]');                % name the label of y-axis as 'y1[t]'
    
    figure;                         % create a new window for plotting
    stem(n,y2);                     % plot the picture
    title('The graph of y2[n]');    % name the title of the figure as 'The graph of y2[n]'
    xlabel('n');                    % name the label of x-axis as 't'
    ylabel('y2[n]');                % name the label of y-axis as 'y2[t]'
    
    figure;                         % create a new window for plotting
    stem(n,y3);                     % plot the picture
    title('The graph of y3[n]');    % name the title of the figure as 'The graph of y3[n]'
    xlabel('n');                    % name the label of x-axis as 't'
    ylabel('y3[n]');                % name the label of y-axis as 'y3[t]'
    %%
    %% problem e
    x_e=ones(1,6);
    n_x=[0:5];
    h=[0:5];
    
    %%
    
    %% problem f
    
    y_f=filter(h,1,x_e);

    figure;                         % create a new window for plotting
    stem(n_x,y_f);                  % plot the picture
    title('The graph of y_f[n]');   % name the title of the figure as 'The graph of y_f[n]'
    xlabel('n');                    % name the label of x-axis as 't'
    ylabel('y_f[n]');               % name the label of y-axis as 'y_f[t]'
    %%
    
    %% problem g
    x_g=[ones(1,6) zeros(1,5)];
    y_g=filter(h,1,x_g);
    
    figure;                         % create a new window for plotting
    stem([0:10],y_g);               % plot the picture
    title('The graph of y_g[n]');   % name the title of the figure as 'The graph of y_g[n]'
    xlabel('n');                    % name the label of x-axis as 't'
    ylabel('y_g[n]');               % name the label of y-axis as 'y_g[t]'
    
    %%
    
    
    %{
    h_h=[0:5];
    
    y2_i=filter(h_h,1,x_e);
    stem([-5:0],y2_i);
    
    x2_j=[x_e zeros(1,5)]
    %}
    
    