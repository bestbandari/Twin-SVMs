function [ u,v,para,cor,round ] = tsvm_novel_para_train( m,n,k)
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
        inc = true;
        last = 0;
        fail = 0;
        while i<=iter || j<=iter
            round = round + 1;
            fprintf('%d: g:%f, i:%d, j:%d, rate:%f\n', round, gammar, i, j, last);
            rate = ten_cross_valid(m,n,c1(i),c2(j),gammar,'tsvm');
            if  rate > cor
                cor = rate;
                para = [c1(i);c2(j);gammar];
            end
            
            if rate > last
                if  inc
                    if i == iter
                        j = j+1;
                        inc = false;
                    else
                        i = i+1;
                    end
                else
                    if j == iter
                        i = i+1;
                        inc = true;
                    else
                        j = j+1;
                    end
                end
                last = rate;
                fail = 0;
            elseif fail == 0
                if  inc
                    i = i-1;
                    j = j+1;
                else
                    j = j-1;
                    i = i+1;
                end
                inc = ~inc;
                fail = fail + 1;
            else
                break;
            end
            
        end
    end
    
    [u,v] = tsvm_train(m,n,para(1),para(2),para(3));
end
end

