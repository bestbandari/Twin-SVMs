function display_model(h,g,u,v)
[rh ~] = size(h);
[rg ~] = size(g);
p = [0,10;0,-10];
hyper_h = hyper_point(p,u);
hyper_g = hyper_point(p,v);
[rhyper_h ~] = size(hyper_h);
[rhyper_g ~] = size(hyper_g);

set(0,'DefaultAxesXLim',[-10 10])
set(0,'DefaultAxesYLim',[-10 10])

%plot(h(1:rh,1),h(1:rh,2),'or',g(1:rg,1),g(1:rg,2),'ob',hyper_h(1:rhyper_h,1),hyper_h(1:rhyper_h,2),'-r',hyper_g(1:rhyper_g,1),hyper_g(1:rhyper_g,2),'-b');

plot(h(1:rh,1),h(1:rh,2),'or',g(1:rg,1),g(1:rg,2),'ob');
grid off;

function t = hyper_point(h,u)
[rh ch]=size(h);

t = zeros(rh,ch);
for i = 1:rh
    k=u(ch+1);
    for j = 2:ch
        t(i,j)=h(i,j);
        k = k+h(i,j)*u(j);
    end
%    t(i,2) = -10+i*5;
%    k = k+t(i,2)*u(2);
    t(i,1)=-1*k/u(1);
    
end

