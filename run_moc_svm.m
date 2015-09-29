addpath('..\libsvm-3.20\matlab\');
%{
train = csvread('document\newsgroups-train500.csv');
train1 = train(1:100,:);
train2 = train(101:200,:);
train3 = train(201:300,:);
train4 = train(301:400,:);
train5 = train(401:500,:);
testdata = csvread('document\newsgroups-test500.csv');
%}

%{
train1 = csvread('steal_faults\train1.csv');
train2 = csvread('steal_faults\train2.csv');
train3 = csvread('steal_faults\train3.csv');
train4 = csvread('steal_faults\train6.csv');
train5 = csvread('steal_faults\train7.csv');
testdata = csvread('steal_faults\test.csv');
%}

%%{
train1 = csvread('mnist\set12345\train_label1.csv');
train2 = csvread('mnist\set12345\train_label2.csv');
train3 = csvread('mnist\set12345\train_label3.csv');
train4 = csvread('mnist\set12345\train_label4.csv');
train5 = csvread('mnist\set12345\train_label5.csv');
testdata = csvread('mnist\set12345\test_lables_novel.csv');
%%}

label = testdata(:,end);
testdata = testdata(:,1:end-1);

[model1,para1,rate1] = one_svm_train(train1,[train2;train3;train4;train5],k);
fprintf('1');
[model2,para2,rate2] = one_svm_train(train2,[train1;train3;train4;train5],k);
fprintf('2');
[model3,para3,rate3] = one_svm_train(train3,[train2;train1;train4;train5],k);
fprintf('3');
[model4,para4,rate4] = one_svm_train(train4,[train2;train3;train1;train5],k);
fprintf('4');
[model5,para5,rate5] = one_svm_train(train5,[train2;train3;train4;train1],k);
fprintf('5');

C(:,:,1) = [train1;train2;train3;train4;train5];
C(:,:,2) = [train2;train1;train3;train4;train5];
C(:,:,3) = [train3;train2;train1;train4;train5];
C(:,:,4) = [train4;train2;train3;train1;train5];
C(:,:,5) = [train5;train2;train3;train4;train1];

model = [model1;model2;model3;model4;model5];

para = [para1,para2,para3,para4,para5];


