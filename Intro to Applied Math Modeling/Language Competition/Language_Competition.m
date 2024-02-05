function z = Language_Competition(t,u)

a_x=10;
a_y=10;
c=1*10^-5;
S_x=1500;
S_y=2800;

z1= (c*u(1)*u(2))+a_x*u(1)*(1-(u(1)/S_x));
z2=(-c*u(1)*u(2))+a_y*u(2)*(1-(u(2)/S_y));
z=[z1;z2];





