function [ model, para,r ] = one_svm_train( m,n,k )
%NCD_TSVM Summary of this function goes here
%   Detailed explanation goes here
sm = size(m,1);
sn = size(n,1);

if  strcmp(k, 'RBF') == 1   %RBF
    gammar = 1e-4;
    nu = 1e-4;
    c2 = 0;
    para = [];
    r = 0;
    
    for i = 1:5
        for j = 1:5
            rate = ten_cross_valid(m,n,nu,c2,gammar,'one_svm');
            if  rate > r;
                r = rate;
                para = [gammar;nu;c2];
            end
            nu = nu * 5;
        end
        nu = 1e-4;
        gammar = gammar*5;
    end
    
    label = [ones(sm,1);zeros(sn,1)];
    model = svmtrain(label, [m;n], sprintf('-s 2 -t 2 -n %f -g %f',para(2),para(1)));
    
    
end

end


