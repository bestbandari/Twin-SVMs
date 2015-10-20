function [ rate, r1, r2 ] = ten_cross_valid( m,n,c1,c2,gammar,algorithm)
    fold = 5;

    row_m = size(m,1)/fold;
    row_n = size(n,1)/fold;
    
    rate = 0;
    r1 = 0;
    r2 = 0;

    for i = 1:fold
        [train_m,test_m] = get(m,row_m,i,fold);
        [train_n,test_n] = get(n,row_n,i,fold);
        if  strcmp(algorithm,'tsvm')==1
            [u,v] = tsvm_train(train_m,train_n,c1,c2,gammar);
            C = [train_m;train_n]';
            pre = tsvm_predict([test_m;test_n],C,u,v,gammar);
        end
        
        if  strcmp(algorithm,'one_svm')==1
            label = [ones(size(train_m,1),1);zeros(size(train_n,1),1)];
            test_label = [ones(size(test_m,1),1);zeros(size(test_n,1),1)];
            model = svmtrain(label, [train_m;train_n], sprintf('-s 2 -t 2 -n %f -g %f',c1,gammar));
            pre = svmpredict(test_label, [test_m;test_n], model);
        end
        
        if  strcmp(algorithm,'svm')==1
            label = [ones(size(train_m,1),1);zeros(size(train_n,1),1)];
            test_label = [ones(size(test_m,1),1);zeros(size(test_n,1),1)];
            model = svmtrain(label, [train_m;test_n], sprintf('-s 0 -t 2 -c %f -g %f',c1,gammar));
            pre = svmpredict(test_label, [test_m;train_n], model);
        end
        
        [cor, cor1, cor2] = correct_rate(pre,size(test_m,1));
        rate = rate + cor;
        r1 = r1 + cor1;
        r2 = r2 + cor2;
    end
    
    rate = rate / fold;
    r1 = r1 / fold;
    r2 = r2 / fold;
end

function [correct, c1, c2] = correct_rate(pre,num)
    row = size(pre,1);
    correct = 0;
    c1 = 0;
    c2 = 0;
    for i = 1:row
        if  i <= num
            if  pre(i) == 1
                correct = correct + 1;
                c1 = c1 + 1;
            end
        else
            if  pre(i) == -1
                correct = correct + 1;
                c2 = c2 + 1;
            end
        end
    end
    correct = correct / row;
    c1 = c1 / num;
    c2 = c2 / (row - num);
    
end

function [trx,tex] = get(x,sample,n,fold)
    trx = [];
    tex = [];
    
    for j = 1:fold
        if  j == n
            tex = [tex;x((j-1)*sample+1:j*sample,:)];
        else
            trx = [trx;x((j-1)*sample+1:j*sample,:)];
        end
    end
        
end
