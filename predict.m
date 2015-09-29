%test = dlmread('F:\Ñ§Ï°\Êý¾Ý\kdd cup99\svmdata\separate by label\predict_label_1.svmdata');
[correct,test] = libsvmread('F:\1000\predict_1.svmdata');
%{
[row,col]=size(test);
correct = test(:,1);
test = test(:,2:col);
%}
%part = 60593;
part = 1000;
test = full(test(1:part,:));
test = feature_select(test,'r2l');
correct = correct(1:part,:);

pre = tsvm_predict(test,C,u,v,gammar);

ratio = correct_ratio(correct,pre,class);