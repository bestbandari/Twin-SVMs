gammar = []; 
cost1 = 3; cost2 = 0.000008;
[u,v] = tsvm_train(m,n,cost1,cost2,0.01,gammar);

C = [m;n]';

part1 = 5000;
part2 = 5993;

test1 = test1(1:part1,:);
test2 = test2(1:part2,:);
correct1 = correct1(1:part1,:);
correct2 = correct2(1:part2,:);

pre1 = tsvm_predict(test1,C,u,v,gammar);
pre2 = tsvm_predict(test2,C,u,v,gammar);
ratio1 = correct_ratio(correct1,pre1,class);
ratio2 = correct_ratio(correct2,pre2,class);

%mess=sprintf('r1:%4f,r2:%4f',ratio1,ratio2);
%disp(mess);

%load chirp;
%sound(y,Fs);