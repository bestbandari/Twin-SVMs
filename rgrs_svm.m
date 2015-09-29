%X = [randn(100,2)+ones(100,2);
%     randn(100,2)-ones(100,2)];
opts = statset('Display','final');

[idx,ctrs,sumd] = kmeans(X,3,...
                    'Distance','city',...
                    'Replicates',5,...
                    'Options',opts);


plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12)
%plot(X(idx==4,1),X(idx==4,2),'y.','MarkerSize',12)

res = sum(sumd);

plot(ctrs(:,1),ctrs(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(ctrs(:,1),ctrs(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')