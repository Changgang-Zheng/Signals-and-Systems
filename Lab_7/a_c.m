function  [x_n,Xc,wc]=a_c(Ou,N)
    
    T=1/N;
    
    n=[0:N-1];
    t=n*T;
    x_n=sin(Ou.*n.*T);

    [Xc,wc] =ctfts(x_n,T);