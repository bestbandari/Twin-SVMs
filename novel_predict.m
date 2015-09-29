function [ pre ] = novel_predict( data,C,u,v,gammar,st)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[rd,~]=size(data);

pre = ones(rd,1);

for i = 1:rd
    k = kernel(data(i,:),C,gammar);
    d1 = k*u(1:end-1)+u(end);
    d2 = k*v(1:end-1)+v(end);
    
    if  abs(d1) > abs(d2)
        pre(i) = 0;
%{
    else
        if  d1-st(1)>2*st(2)
            pre(i) = 0;
        end
%}
        
%{
        if  abs(d1-d2)<st(5)
            pre(i) = 0;
        end
%}
    end
 
end
end



