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
train1 = csvread('Chars\setAE\train_label1.csv');
train2 = csvread('Chars\setAE\train_label2.csv');
train3 = csvread('Chars\setAE\train_label3.csv');
train4 = csvread('Chars\setAE\train_label4.csv');
train5 = csvread('Chars\setAE\train_label5.csv');
testdata = csvread('Chars\setAE\test_lables_novel.csv');
%%}

label = testdata(:,end);
testdata = testdata(:,1:end-1);

[u1,v1,st1,para1,rate1] = ncd_tsvm_train(train1,[train2;train3;train4;train5],k);
fprintf('1');
[u2,v2,st2,para2,rate2] = ncd_tsvm_train(train2,[train1;train3;train4;train5],k);
fprintf('2');
[u3,v3,st3,para3,rate3] = ncd_tsvm_train(train3,[train2;train1;train4;train5],k);
fprintf('3');
[u4,v4,st4,para4,rate4] = ncd_tsvm_train(train4,[train2;train3;train1;train5],k);
fprintf('4');
[u5,v5,st5,para5,rate5] = ncd_tsvm_train(train5,[train2;train3;train4;train1],k);
fprintf('5');

C(:,:,1) = [train1;train2;train3;train4;train5];
C(:,:,2) = [train2;train1;train3;train4;train5];
C(:,:,3) = [train3;train2;train1;train4;train5];
C(:,:,4) = [train4;train2;train3;train1;train5];
C(:,:,5) = [train5;train2;train3;train4;train1];

u = [u1,u2,u3,u4,u5];

v = [v1,v2,v3,v4,v5];

para = [para1,para2,para3,para4,para5];

st = [st1,st2,st3,st4,st5];

