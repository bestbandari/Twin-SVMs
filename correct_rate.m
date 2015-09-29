function [precision, recall] = correct_rate( cor,pre )

num = numel(cor);
count = 0;
precision = 0;
recall = 0;

for i = 1:num
    if  pre(i) == 0
        precision = precision + 1;
    end
    
    if  cor(i) == 0
        recall = recall + 1;
    end
    
    if  cor(i) == 0 && pre(i) == 0
        count = count + 1;
    end
end

precision = count / precision;

recall = count / recall;

end
