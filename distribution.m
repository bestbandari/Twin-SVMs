function [average_p,deviation_p,average_n,deviation_n,dif] = distribution( m,n,C,u,v,gammar )
%DISTRIBUTION Summary of this function goes here
%   Detailed explanation goes here
x = [m;n];
[rd,~]=size(x);

d1 = zeros(rd,1);
d2 = zeros(rd,1);

for i = 1:rd
    k = kernel(x(i,:),C,gammar);
    d1(i) = k*u(1:end-1)+u(end);
    d2(i) = k*v(1:end-1)+v(end);
    
end

average_p = mean(d1(1:size(m,1),:));

deviation_p = std(d1(1:size(m,1),:));

average_n = mean(d2(size(m,1)+1:end,:));

deviation_n = std(d2(size(m,1)+1:end,:));

dif = mean(abs(d1 - d2));

end

