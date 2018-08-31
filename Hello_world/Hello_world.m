 %% Question 2.5 g
    figure;
    subplot(2,1,1)
    stem(n_e,s_e_1,'*')
	hold on;
    stem(n_f,z_f_1(1:20))
    subplot(2,1,2)
    stem(n_e,s_e_2,'*')
	hold on;
    stem(n_f,z_f_2(1:20))
    %%
    figure;
syms n
s1 = filter([1],[1,-(3/5)],[1 ones(1,19)])
h1 = filter([1],[1,-(3/5)],[1 zeros(1,19)])
un = [ones(1,20)];
z1 = conv(h1,un);
s2 = [zeros(1,20)];
s2(1) = 1;
for i=0:18
    s2(i+2) = (3/5)^(i+1)*s2(i+1)+1;
end
z2 = conv(h2,un);

subplot(3,1,1)
stem([0:38],z1(1:39),'r')
hold on;
stem([0:19],s1,'b')
subplot(3,1,2)
stem([0:19],s2,'b')
subplot(3,1,3)
stem([0:19],z2(1:20),'r')