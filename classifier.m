function [ u,v,average,deviation ] = classifier( m,n,gammar,cost1,cost2 )
%CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

[u,v] = tsvm_train(m,n,cost1,cost2,0.01,gammar);

C = [m;n]';

[average,deviation] = distribution(m,C,u,gammar);


end

