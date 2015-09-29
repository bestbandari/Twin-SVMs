function [ out ] = feature_select( data,opt )

switch opt
    case 'pro'
        out = data(:,[1:8,10:14,22:41]);
    case 'dos'
        out = data(:,[1:8,10:14,17:19,22:41]);
    case 'u2r'
        out = data(:,[3 6 10 16 17 33 1 2 4 5 7 8 9 22 23 24 27 28 35 36 39 40 41 6 8 10 12 13 17 18 20 21 24 33]);
    case 'r2l'
        out = data(:,[1:8,10:19,22:41]);
    otherwise
        out = data;
end

end

%r2l : 2 3 5 7 11 15 16 22 23 25 26 27 28 29 31 32 34 36 37 39 41 6 8 10 12 13 17 18 20 21 24 33
%r2l : 1 3 5 6 8 14 23 25 26 27 28 33 35 38 41