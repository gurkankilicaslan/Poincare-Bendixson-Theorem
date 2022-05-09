clear
[x1,x2] = meshgrid(0:0.1:3); 
A = 1;
B = 1;
q = 1;

dx1 = B - x1 - (x1.*x2)./(1+q*x1.*x1);
dx2 = A - (x1.*x2)./(1+q*x1.*x1);   

% plots nullclines
syms t1 t2 z1 z2;
z1 = (B - t1)*(1+q*t1^2)/t1;
fplot(z1 ,"r",'LineWidth',3);
hold on
z2 = (A)*(1+q*t2^2)/t2;
fplot(z2 ,"r",'LineWidth',3);


% plot arrows
r = sqrt(dx1.^2 + dx2.^2); % normalization
quiver(x1,x2,dx1./r,dx2./r,1/2,'LineWidth',1); % plot arrows
axis equal;
set(gca,'FontSize',20);
axis([0 3 0 3]);

while (true)
    x0 = ginput(1); % take a graphical input 
    tspan = [0 20];
    [t,x] = ode45(@(t,x) odefcn(x), tspan, x0);
    plot(x(:,1),x(:,2),'-o');
end

function dxdt = odefcn(x)
A = 1;
B = 1;
q = 1;
dxdt = zeros(2,1);
dxdt(1) = B - x(1) - (x(1)*x(2))/(1+q*x(1)^2); % describes derivatives
dxdt(2) = A - (x(1)*x(2))/(1+q*x(1)^2);   % describes derivatives
end