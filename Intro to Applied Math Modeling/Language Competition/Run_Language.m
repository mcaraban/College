tvec=[0 25];
u=zeros(2,1);
u(1)=1*10^3;
u(2)=1*10^3;
[t,u]=ode45(@Language_Competition,tvec,u);

figure(1)
plot(t,u(:,1)) 
xlabel('time')
ylabel('x')

figure(2)
plot(t, u(:,2))
xlabel('time')
ylabel('y')
 
figure(3)
plot(u(:,1),u(:,2))
xlabel('x')
ylabel('y')



