k = 'RBF';

%run_tsvm_2_k;
run_moc_svm;

%%{
method = 'one';
[pre,~] = ncd_tsvm_predict( testdata,C, u, v, para(1,:),st,method);


[precision, recall] = correct_rate(label,pre);

F = 2*precision*recall/(precision + recall);

%%}