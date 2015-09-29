function [ x ] = data_preprocess( x, y, deviation )

mu = [x, y];

sigma = [deviation,0; 0,deviation];

x = mvnrnd(mu,sigma,100);

end

