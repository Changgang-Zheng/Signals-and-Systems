%Name: Matlab/CUDA: Signals and Systems Lab 4th
%Auther: Changgang Zheng
%Student Number UESTC:2016200302027
%Student Number UoG:2289258z
%Institution: Glasgow College UESCT
%Question: Perform convolution. 2.3(a)(b)

function  problem_2nd
    
    %% problem 2.3(a)
    t_a=[0:0.5:10];
    num_0=2/0.5;
    x_a=[zeros(1,num_0) ones(1,length(t_a)-num_0)];
    b_a=[1];
    a_a=[1 2];
    y_a=lsim(b_a,a_a,x_a,t_a);      % calculate the result after the (continuous LCCDE) system
    
    figure;                         % create a new window for plotting
    plot(t_a,y_a,'--');             % plot the picture
    title('The result of x(t) after passing the LTI system dy(t)/dt+2y(t)=x(t)');   
                                    % name the title of the figure as 'The result of x(t) after passing the LTI system dy(t)/dt+2y(t)=x(t)'
    xlabel('t');                    % name the label of x-axis as 't'
    ylabel('y(t)');                 % name the label of y-axis as 'y(t)'
    %%

    %% problem 2.3(b)
    
    intrerval=0.1;
    t_b=[0:intrerval:10];
    b_b=1;
    a_b=[1 0.5];
    
    s=step(b_b,a_b,t_b);            % calculate the result after the LTI system (unit step response)
   
    h=impulse(b_b,a_b,t_b);         % calculate the result after the LTI system (unit impluse response)
    
    syms t;
    s_real=heaviside(t)*2*(1-(exp(-t/2)));
    h2=diff(s_real);                % calculate the differencial
    
    t=[0:1:10];
    x=ones(1,length(t));
    b=1;
    a=[1 0.5];
    s2=lsim(b,a,x,t);               % calculate the result after the LTI system(continuous LCCDE)
    
    
    figure;                         % create a new window for plotting
    fplot(s_real,[0,10],'g');       % plot the picture
    title('The out put from "step" function compare with picture 2.6');   
                                    % name the title of the figure as
    xlabel('t');                    % name the label of x-axis as 't'
    ylabel('s(t)');                 % name the label of y-axis as 's(t)'
    
    hold on;                        % plot two lines in one picture
    plot(t,s2,'b');                 % plot the picture
                                    
    hold on;                        % plot two lines in one picture
    plot(t_b,s,'--');               % plot the picture
    legend('real response','unit impulse response by "lsim" function','unit impulse response by "step" function');  
                                    % set the label for each line

    
    figure;                         % create a new window for plotting
    plot(t_b,h,'g');                % plot the picture
    title('The result get by "impulse" function compare with using the real response'); 
                                    % name the title of the figure as 'The result get by impulse compare with using the real response'
    xlabel('t');                    % name the label of x-axis as 't'
    ylabel('h(t) and ds(t)/dt');    % name the label of y-axis as 'h(t) and ds(t)/dt'

    hold on;
    fplot(h2,[0,10],'--');          % plot the picture
    legend('The result get by "impulse" function','The result of the real response');    
                                    % set the label for each line
    %%

