function [ u,v,para,cor,round ] = tsvm_grid_para_train( m,n,k )
%NCD_TSVM Summary of this function goes here
%   Detailed explanation goes here
iter = 10;
g = logspace(1,-8,iter);
c1 = logspace(1,-8,iter);
c2 = logspace(1,-8,iter);
cor = 0;
round = 0;

if  strcmp(k, 'RBF') == 1   %RBF
    rate=0;
    for gammar = g
        for i = 1:iter
            for j = 1:iter
                round = round + 1;
                fprintf('%d: g:%f, i:%d, j:%d, rate:%f\n', round, gammar, i, j, rate);
                
                rate = ten_cross_valid(m,n,c1(i),c2(j),gammar,'tsvm');
                if  rate > cor
                    cor = rate;
                    para = [c1(i);c2(j);gammar];
                end
            end
        end
    end
    
    [u,v] = tsvm_train(m,n,para(1),para(2),para(3));
  
    
end

if  strcmp(k, 'linear') == 1  %linear

    c = 0.0001;
    c1 = 1e-4;
    c2 = c1 * sn / sm;
    cor = 0;
    C = [m;n]';
    
    for i = 1:5
        rate = ten_cross_valid(m,n,c,c,para);
        if rate > cor
            cor = rate;
            para = [c1;c2];
        end
        c = c*5;
    end

    [u,v] = tsvm_train(m,n,cc,cc,para);
    
    [average_p,deviation_p,average_n,deviation_n,dif] = distribution(m,n,C,u,v,para);
    
    st = [average_p;deviation_p;average_n;deviation_n;dif];
    
end

