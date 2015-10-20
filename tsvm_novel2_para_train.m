function [ u,v,para,cor,round ] = tsvm_novel2_para_train( m,n,k)
%TSVM_PARA_SELE Summary of this function goes here
%   Detailed explanation goes here

iter = 10;
g = logspace(1,-8,iter);
c1 = logspace(1,-8,iter);
c2 = logspace(1,-8,iter);
para = [];
cor = 0;
round = 0;

if  strcmp(k, 'RBF') == 1   %RBF
    for gammar = g
        i = 1;
        j = 1;

        while i<=iter && j<=iter
            round = round + 1;
            
            [rate, r1, r2] = ten_cross_valid(m,n,c1(i),c2(j),gammar,'tsvm');
            fprintf('%d: g:%f, i:%d, j:%d, rate:%f\n', round, gammar, i, j, rate);
            
            if  rate > cor
                cor = rate;
                para = [c1(i);c2(j);gammar];
            end
            
            if r1 <= r2
                i = i + 1;
            else
                j = j + 1;
            end
            
        end
    end
    
    [u,v] = tsvm_train(m,n,para(1),para(2),para(3));
end
end

