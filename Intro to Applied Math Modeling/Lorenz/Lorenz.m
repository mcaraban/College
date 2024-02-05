function z= Lorenz(t,u)

sigma=10;
b=8/3;
r=100;

z1=sigma.*(-u(1)+u(2));
z2=r.*u(1)-u(2)-u(1).*u(3);
z3=-b.*u(3)+u(1).*u(2);

z=[z1;z2;z3];




