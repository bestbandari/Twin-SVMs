k = 'RBF';

train1 = csvread('mnist\set12345\train_label1.csv');
train2 = csvread('mnist\set12345\train_label2.csv');
train3 = csvread('mnist\set12345\train_label3.csv');
train4 = csvread('mnist\set12345\train_label4.csv');
train5 = csvread('mnist\set12345\train_label5.csv');

testdata = csvread('mnist\set12345\test_lables_novel.csv');

label = testdata(:,end);
testdata = testdata(:,1:end-1);



[u1,v1,para1,cor1,round1] = tsvm_novel2_para_train(train5,train1,k);

fprintf('round of novel parameter selection algorithm: %d\n', round1);
return;
[u2,v2,para2,cor2,round2] = tsvm_grid_para_train(train1,train2,k);

fprintf('round of grid parameter selection algorithm: %d\n', round2);