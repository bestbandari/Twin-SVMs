function pre = tsvm_predict(data,C,u,v,gammar)

[rd,~]=size(data);

nu = numel(u);
nv = numel(v);
pre = ones(rd,1);

for i = 1:rd
    k = kernel(data(i,:),C,gammar);
    d1 = k*u(1:nu-1)+u(nu);
    d2 = k*v(1:nv-1)+v(nv);
    
    if  abs(d1) > abs(d2)
        pre(i) = -1;
    end
end
