%% Get filtered data out of all classes dataset
% classes - specified classes to be filtered out
% count   - the sample size

function dataset = getClassData(classes,count)

images = loadMNISTImages('train-images-idx3-ubyte');
labels = loadMNISTLabels('train-labels-idx1-ubyte');

clnum = size(classes,2);
fnum = size(images,1)

%display_network(images(:,1:100)); % Show the first 100 images
%disp(labels(1:10));

dindexes = [];
dataset = [];

%get the index for the classes from the labels data
for i = 1:clnum
    num = 0;
    for j = 1:size(labels,1)
        if classes(i) == labels(j)
            dindexes = [dindexes,j]
            num = num + 1;
            
            if (num > count)
                break;
            end
        end
    end
end

%randomize the indexes
rinxes = randperm(size(dindexes,2));

for i = 1:size(rinxes,2)
    ti = dindexes(rinxes(i));
    inst = images(1:fnum,ti:ti);
    inst = [(inst)',labels(ti)];
    dataset = [dataset;inst];
    inst = [];
end

end