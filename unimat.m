~function [ m ] = unimat( step,lx,mx )

y = lx:step:mx;
y = y';
num = numel(y);
x = lx*(ones(num,1));

grad = step*ones(num,1);
m = [x,y];
for i = 1:num
    t = [x,y];
    m = [m;t];
    x = x+grad;
end

