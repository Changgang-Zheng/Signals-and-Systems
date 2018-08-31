%Name: Matlab/CUDA: Signals and Systems Lab 3rd
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: Further familiar with the properties of LTI systems. 2.4(a)(d), 2.5(d)(e)(f)(g)

function  problem_2nd
    %% Question 2.4 a  
    n_a_x1=[0:9];
    n_a_h1=[0:4];
    n_a_h2=[0:4];
   
    x1_a=[ones(1,5) zeros(1,5)];
    h1_a=[1 -1 3 0 1]; 
    h2_a=[0 2 5 4 -1];
   
    figure;                         % create the first window for ploting 
    subplot(3,1,1)
    stem(n_a_x1,x1_a)               %plot the picture
    title('The graph of x1[n]');    % name the title of the figure as 'The graph of x1[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('x1[n]');                % name the label of y-axis as 'x1[n]'
    
    subplot(3,1,2)
    stem(n_a_h1,h1_a)               % plot the picture
    title('The graph of h1[n]');    % name the title of the figure as 'The graph of h1[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('h1[n]');                % name the label of y-axis as 'h1[n]'
   
    subplot(3,1,3)
    stem(n_a_h2,h2_a)               % plot the picture
    title('The graph of h2[n]');    % name the title of the figure as 'The graph of h2[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('h2[n]');                % name the label of y-axis as 'h2[n]'
    %% 
    
    %% Question 2.4 d
    w_a=conv(x1_a,h1_a);            % 0 to 13
    y_d1=conv(w_a,h2_a);            % 0 to 17
    h_ser=conv(h1_a,h2_a);          % 0 to 8
    y_d2=conv(x1_a,h_ser);          % 0 to 17
    

    figure;                         % create a new window for plotting
    subplot(2,1,1)
    stem([0:17],y_d1)               % plot the picture
    title('The graph of y_d1[n]');  % name the title of the figure as 'The graph of y_d1[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('y_d1[n]');              % name the label of y-axis as 'y_d1[n]'
    subplot(2,1,2)
    stem([0:17],y_d2)               % plot the picture
    title('The graph of y_d2[n]');  % name the title of the figure as 'The graph of y_d2[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('y_d2[n]');              % name the label of y-axis as 'y_d2[n]'
    figure;                         % create a new window for plotting
    subplot(2,1,1)
    stem([0:13],w_a)                % plot the picture
    title('The graph of w[n]');     % name the title of the figure as 'The graph of w_a[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('w[n]');                 % name the label of y-axis as 'w_a[n]'
    subplot(2,1,2)
    stem([0:8],h_ser)               % plot the picture
    title('The graph of hser[n]');  % name the title of the figure as 'The graph of h_ser[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('hser[n]');              % name the label of y-axis as 'h_ser[n]'
    %%
    
    %% Question 2.5 d
    n_d=[-1:20];
    x_d=[0 1 zeros(1,20)];
    h_d_1=filter([1],[1,-(3/5)],x_d);
    h_d_2=zeros(1,22);

    for i=1:22
        if i==1
            h_d_2(i)=0;
        else
            h_d_2(i)=(3/5)^(i-2)*h_d_2(i-1)+x_d(i);
        end
    end
    
    figure;                         %create a new window for plotting
    subplot(2,1,1)
    stem(n_d(2:21),h_d_1(2:21))     % plot the picture
    title('The graph of h1[n]');    % name the title of the figure as 'The graph of h1[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('h1[n]');                % name the label of y-axis as 'h1[n]'
    
    subplot(2,1,2)
    stem(n_d(2:21),h_d_2(2:21))                 % plot the picture
    title('The graph of h2[n]');    % name the title of the figure as 'The result of convolution y[n]=x[n]*h[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('h2[n]');                % name the label of y-axis as 'h2[n]'
    %%
    
    %% Question 2.5 e
    n_e=[-1:20];
    x_e=[0 1 ones(1,20)];
    s_e_1=filter([1],[1,-(3/5)],x_e);
    s_e_2=zeros(1,22);

    for i=1:22
        if i==1
            s_e_2(i)=0;
        else
            s_e_2(i)=(3/5)^(i-2)*s_e_2(i-1)+x_e(i);
        end
    end
    
    figure; %create a new window for plotting
    subplot(2,1,1)
    stem(n_e(2:21),s_e_1(2:21))     % plot the picture
    title('The graph of s1[n]');    % name the title of the figure as 'The graph of s1[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('s1[n]');                % name the label of y-axis as 's1[n]'
    subplot(2,1,2)
    stem(n_e(2:21),s_e_2(2:21))     % plot the picture
    title('The graph of s2[n]');    % name the title of the figure as 'The graph of s2[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('s2[n]');                % name the label of y-axis as 's2[n]'
    %%

    %% Question 2.5 f
    n_f=[0:19];
    u_f=ones(1,20);
    z_f_1=conv(h_d_1(1,2:21),u_f);
    z_f_2=conv(h_d_2(1,2:21),u_f);
    
    figure;
    subplot(2,1,1)
    stem(n_f,z_f_1(1:20))           % plot the picture
    hold on;
    stem([20:38],z_f_1(21:39),'p')
    title('The graph of z1[n]');    % name the title of the figure as 'The graph of z1[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('z1[n]');                % name the label of y-axis as 'z1[n]'
    subplot(2,1,2)
    stem(n_f,z_f_2(1:20))           % plot the picture
    hold on;
    stem([20:38],z_f_2(21:39),'p')  % plot the picture
    title('The graph of z2[n]');    % name the title of the figure as 'The graph of z2[n]'
    xlabel('n');                    % name the label of x-axis as 'n'
    ylabel('z2[n]');                % name the label of y-axis as 'z2[n]'
    
    %%
    
    %% Question 2.5 g
    figure;
    subplot(2,1,1)
    stem(n_e(2:21),s_e_1(2:21),'*')         % plot the picture
	hold on;
    stem(n_f,z_f_1(1:20))                   % plot the picture
    title('The graph of z1[n] and s1[n]');  % name the title of the figure as 'The graph of z1[n] and s1[n]'
    xlabel('n');                            % name the label of x-axis as 'n'
    ylabel('z1[n] and s1[n]');              % name the label of y-axis as 'z1[n] and s1[n]'
    
    subplot(2,1,2)              
    stem(n_e(2:21),s_e_2(2:21),'*')         % plot the picture
	hold on;
    stem(n_f,z_f_2(1:20))                   % plot the picture
    title('The graph of z2[n] and s2[n]');  % name the title of the figure as 'The graph of z2[n] and s2[n]'
    xlabel('n');                            % name the label of x-axis as 'n'
    ylabel('z2[n] and s2[n]');              % name the label of y-axis as 'z2[n] and s2[n]'
    %%
    