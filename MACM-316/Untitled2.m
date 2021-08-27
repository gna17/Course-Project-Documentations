


f=@(t,y) t;
w_arr=euler(f,0,2,0.1,0);

xx=0:0.1:2;
plot(xx,xx.^2/2);
hold on;
scatter(xx,w_arr);