data = dlmread('

m = full(m);
n = full(n);
test1 = full(test1);
test2 = full(test2);

option = '';
m = feature_select(m,option);
n = feature_select(n,option);
test1 = feature_select(test1,option);
test2 = feature_select(test2,option);   

%m = m(1:250,:);
class = [1,1;4,-1];

