function [u, v] = tsvm_train(m,n,c1,c2,gammar)
[rh, ~] = size(m);
[rg, ~] = size(n);
C = [m;n]';
eps = 0.01;

h = [kernel(m,C,gammar) ones(rh,1)];
g = [kernel(n,C,gammar) ones(rg,1)];
%h = [m,ones(rh,1)];
%g = [n ones(rg,1)];
[rh, ch] = size(h);
[rg, cg] = size(g);

c1 = ones(rg,1)*c1;  
c2 = ones(rh,1)*c2; 

H = inv(h'*h+eps*eye(ch));
G = inv(g'*g+eps*eye(cg));

Q = g*H*g';
e = ones(1,rg)*-1;
opts = optimset('Algorithm','interior-point-convex','Display','off');
Q=(Q+Q')/2;
a = quadprog(Q,e,[],[],[],[],zeros(rg,1),c1,[],opts);
u = -1*H*g'*a;

Q = h*G*h';
e = ones(1,rh)*-1;
Q=(Q+Q')/2;
b = quadprog(Q,e,[],[],[],[],zeros(rh,1),c2,[],opts);
v = G*h'*b;


