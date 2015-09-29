[~,km] = libsvmread('F:\1000\train_scale_1.svmdata');
km = full(km);
ran = randperm(size(km));
km = km(ran(1:500),:);
dlmwrite('train_1',km, ' ');
%[IDX,m] = kmeans(km,1000);
