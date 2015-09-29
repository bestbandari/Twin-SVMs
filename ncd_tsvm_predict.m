function [ pre,dif ] = ncd_tsvm_predict( data,C, u, v, gammar,st,method )
%NCD_TSVM_PREDICT Summary of this function goes here
%   Detailed explanation goes here

row = size(data,1);
pre = zeros(row,1);
dif = zeros(row,5);
if  (numel(gammar) == 0)
    for j = 1:5
        p = novel_predict(data, C(:,:,j)', u(:,j),v(:,j),[],st(:,j));
        pre = pre + p;
    end
end

if  (numel(gammar) > 0)
    for j = 1:5
        p = novel_predict(data, C(:,:,j)', u(:,j),v(:,j),gammar(j),st(:,j));
        pre = pre + p;
    end
end

if  strcmp(method,'one') == 1
    for i = 1:row
        if  pre(i) < 1
            pre(i) = 0;
        end
    end
end

if  strcmp(method,'majority') == 1
    for i = 1:row
        if  pre(i) <= 5/2
            pre(i) = 0;
        end
    end
end


end

