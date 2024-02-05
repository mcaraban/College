

function z = odesystem_test(t,u)

a=.7;
b=.8;
c=3;

z1= c.*(u(1)-((u(1)^3)./3)-u(2));
z2=(1/c).*(u(1)+a-b.*u(2));
z=[z1;z2];
