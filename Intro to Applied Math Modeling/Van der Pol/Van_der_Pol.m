function z= Van_der_Pol(t,u)

mu=5;

z1=u(2);
z2=-u(1)+mu.*u(2).*(1-u(1).^2);
z=[z1;z2];

