%data_process;

%{
class = [m(1,1),1;n(1,1),-1];

[~,col]=size(m);
m = m(:,2:col);
[~,col]=size(n);
n = n(:,2:col);
%}
display('twsvm');
gammar = 0.1;
cost1 = 0.05;cost2 = 0.01;
tic;
[u,v] = tsvm_train(m,n,cost1,cost2,0.01,gammar);
toc;

display('svm');
tic;
svm_train(m,n,20,cost2,0.01,gammar);
toc;
