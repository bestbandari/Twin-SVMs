function [u v] = svm_train(m,n,c1,c2,eps,gammar)
[rh ~] = size(m);
[rg ~] = size(n);
x=[m;n];
[rx ~] = size(x);
Q = zeros(rx,rx);

if  numel(gammar) == 1
    for i=1:rx
        for j=1:rx
            Q(i,j) = exp(-gammar*norm(x(i,:)-x(j,:))^2);
        end
    end
end
%h = [m,ones(rh,1)];
%g = [n ones(rg,1)];

c1 = ones(rx,1)*c1;  
y = [ones(rh,1);-1*ones(rg,1)];
y=y';
e = ones(1,rx)*-1;
opts = optimset('Algorithm','interior-point-convex','Display','off');

quadprog(Q,e,[],[],[],[],zeros(rx,1),c1,[],opts);




