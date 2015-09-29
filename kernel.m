function k = kernel(x1,x2,g)
[r1, ~] = size(x1);
[~, c2] = size(x2);

k = zeros(r1,c2);

% linear kernel
if  numel(g) == 0
    for i=1:r1
        for j=1:c2
            k(i,j) = x1(i,:)*x2(:,j);
        end
    end
end

% RBF kernel
if  numel(g) == 1
    x2 = x2';
    for i=1:r1
        for j=1:c2
            k(i,j) = exp(-g*norm(x1(i,:)-x2(j,:))^2);
        end
    end
end

