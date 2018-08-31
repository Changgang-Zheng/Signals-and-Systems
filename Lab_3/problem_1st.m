%Name: Matlab/CUDA: Signals and Systems Lab 3rd
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: Perform convolution. 2.1(a)(b)(c), 2.7(a)(b)(c)(d)(e)

function  problem_1st
    %% Question 2.1 a
    x=ones(1,6);
    y=[ 1  2  3  4  5  6  5  4  3  2  1]; %y[n]=x[0]x[n]+x[1]x[n-1]+x[2]x[n-2]+x[3]x[n-3]+x[4]x[n-4]+x[5]x[n-5]
    %%
    %% Question 2.1 b
    x_a=[ones(1,6)];
    y_a=conv(x_a,x_a);
    ny_a = [0:10];
    
    figure;                     % create a window for ploting 
    stem(ny_a,y_a)              % plot the picture
    title('The result of convolution y[n]=x[n]*x[n]');  % name the title of the figure as ''The result of convolution y[n]=x[n]*x[n]''
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y[n]=x[n]*x[n]');   % name the label of y-axis as 'y[n]=x[n]*x[n]'
    %%
    
    %% Question 2.1 c
    h=[0 1 2 3 4 5];
    y=[0 0 1 3 6 10 15 14 12 9 5]; % y[n]=x[0]h[n]+x[1]h[n-1]+x[2]h[n-2]+x[3]h[n-3]+x[4]h[n-4]+x[5]h[n-5]

    x_c=[0 ones(1,5)];
    h_c=[0:5];
    y_c=conv(x_c,h_c);
    n_c=[0:10];
    
    figure;                     % create a window for ploting 
    stem(n_c,y_c);              % plot the picture
    title('The result of convolution y[n]=x[n]*h[n]');  % name the title of the figure as 'The result of convolution y[n]=x[n]*h[n]'
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y[n]=x[n]*x[n]');   % name the label of y-axis as 'y[n]=x[n]*x[n]'
    %%

    
    %% Question 2.7 a 
    X_a=[zeros(1,5) 1 0 1 zeros(1,3)];
    H_a=[zeros(1,4) 2 0 -2 zeros(1,4)];
    Y_a=conv(X_a,H_a);
    N_a=[-10:10];
    
    figure;                     % create a window for ploting 
    stem(N_a,Y_a)               % plot the picture
    title('The result of convolution y[n]=x[n]*h[n]');  % name the title of the figure as 'The result of convolution y[n]=x[n]*h[n]'
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y[n]');             % name the label of y-axis as 'y[n]'
    %%
    
    %% Question 2.7 b
    % We make an assumption that a<b and c<d
    % N_b is from a+c to b+d
    a=2;
    b=4;
    c=4;
    d=5;
    
    N_b=(a+c:b+d);
    X_b=[1 zeros(1,b-a-1) 1];
    H_b=[1 zeros(1,d-c-1) 1];
    Y_b=conv(H_b,X_b);
    
    figure;                     % create a window for ploting 
    stem(N_b,Y_b);              % plot the picture
    title('The result of convolution y[n]=x[n]*h[n]');  % name the title of the figure as 'The result of convolution y[n]=x[n]*h[n]'
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y[n]');             % name the label of y-axis as 'y[n]'
    %%
    
    %% Question 2.7 c
    N_c=[0:24];
    U_c=[zeros(1,2) ones(1,23)];
    H_c=ones(1,15);
    X_c=((1/2).^(N_c-2)).*U_c;
    Y_c=conv(X_c,H_c);
    
    H_c_long=ones(1,100);
    Y_c_long=conv(X_c,H_c_long);
    
    figure;                                             % create a window for ploting 
    stem([0:38],Y_c)                                    % plot the picture
    hold on;
    stem([-2:38],Y_c_long(1:41),'p')
    % hold on;                                          % plot the star picture
    % stem([39:45],zeros(1,7),'p')                      % plot the picture
    title('The result of convolution y[n] when h[n] is from 0 to 14 or -2 to infinity');  % name the title of the figure as 'The result of convolution'
    xlabel('n');                                        % name the label of x-axis as 'n'
    ylabel('y[n]');                                     % name the label of y-axis as 'y[n]'
    
    %%
    
    %% Question 2.7 d
    syms Nd
    Hd =@(Nd)0.9^Nd;
    H_d = zeros(1,100);  
    
    for i=1:10
        H_d(i) = subs(Nd,Hd(i-1));
    end
    
    N_d=[0:99];
    X_d = cos(N_d.^2).*sin(2*pi.*N_d/5);
    Y_d=conv(X_d,H_d);

    figure;                     % create a window for ploting 
    stem([0:99],Y_d(1:100))     % plot the picture
    title('The result of convolution y[n]=h[n]*x[n]');  % name the title of the figure as 'The result of convolution y[n]=x[n]*h[n]'
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y[n]');             % name the label of y-axis as 'y[n]'
    
    
    %%
    
    %% Question 2.7 e
    X_d1=[X_d(1,1:50) zeros(1,50)];
    X_d2=[zeros(1,50) X_d(1,51:100)];

    Y_d1=conv(X_d1,H_d);
    Y_d2=conv(X_d2,H_d);
    
    
    figure; % create a window for ploting 
    subplot(3,1,1)          
    stem([0:99],Y_d1(1:100))        % plot the picture
    title('The result of convolution y_d1[n]=h[n]*x_d1[n]');  % name the title of the figure as 'The result of convolution y[n]=x[n]*h[n]'
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y_d1[n]');          % name the label of y-axis as 'y_d1[n]'
    subplot(3,1,2)
    stem([0:99],Y_d2(1:100))    % plot the picture
    title('The result of convolution y[n]=h[n]*x_d2[n]');  % name the title of the figure as 'The result of convolution y[n]=x[n]*h[n]'
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y_d2[n]');          % name the label of y-axis as 'y_d2[n]'
    subplot(3,1,3)
    stem([0:99],Y_d1(1:100)+Y_d2(1:100))    % plot the picture
    title('The result of convolution y[n]=y_d1[n]+y_d2[n]');  % name the title of the figure as 'The result of convolution y[n]=y_d1[n]+y_d2[n]'
    xlabel('n');                % name the label of x-axis as 'n'
    ylabel('y[n]');             % name the label of y-axis as 'y[n]'
    
    %%
    
    
        