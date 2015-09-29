function display_point(data,pre)

num = numel(pre);
for i = 1:num
    if  pre(i) == 1
        plot(data(i,1),data(i,2),'+r');
    else
        plot(data(i,1),data(i,2),'+b');
    end
    hold on;
end

hold off;
