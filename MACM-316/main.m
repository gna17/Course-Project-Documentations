

%sol=sympletic_euler(0,200,0.0005,[(1-0.6);0;0;sqrt((1+0.6)/(1-0.6))]);

%x=sol(1,:)
%y=sol(2,:)
%plot(x,y)
%xlabel('x','fontsize',16)
%ylabel('y','fontsize',16)
h = 0.0005;
w0 = [(1-0.6);0;0;sqrt((1+0.6)/(1-0.6))];
sol=sympletic_euler(0,200,0.0005,w0);
q1=sol(1,:);q2=sol(2,:);
p1=sol(3,:);p2=sol(4,:);
figure();
plot(q1,q2);




A=q1.*p2-q2.*p1;
H= 0.5* (p1.^2 +p2.^2)-1./(q1.^2+q2.^2).^(1/2);
figure();
plot(0:h:200, A)
title("Sympletic euler,A");
ylabel("A");
xlabel("Time");
figure();
plot(0:h:200,H)
title("sympletic euler, H");
ylabel("H");
xlabel("Time");
