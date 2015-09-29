[~,n] = libsvmread('F:\1000\train_1.svmdata');

[~,a1] = libsvmread('F:\1000\train_2.svmdata');
[~,a2] = libsvmread('F:\1000\train_3.svmdata');
[~,a3] = libsvmread('F:\1000\train_4.svmdata');
[~,a4] = libsvmread('F:\1000\train_5.svmdata');

a = [a1(randperm(50),:);a2(randperm(50),:);a3(randperm(50),:);a4(randperm(50),:)];

label = [ones(size(n,1),1); ones(size(a,1),1)*-1];
sample = [n;a];


libsvmwrite('one_svm_train.svmdata',label,sample);

%predict

[~,n] = libsvmread('F:\1000\predict_selected_1.svmdata');

[~,a1] = libsvmread('F:\1000\predict_selected_2.svmdata');
[~,a2] = libsvmread('F:\1000\predict_selected_3.svmdata');
[~,a3] = libsvmread('F:\1000\predict_selected_4.svmdata');
[~,a4] = libsvmread('F:\1000\predict_selected_5.svmdata');

n = n(1:5000,:);
a1 = a1(1:40000,:);
a4 = a4(1:1000,:);
a = [a1;a2;a3;a4];
sample = [n;a];

label = [ones(size(n,1),1); ones(size(a,1),1)*-1];

libsvmwrite('one_svm_predict.svmdata',label,sample);