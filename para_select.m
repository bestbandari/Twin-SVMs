tolerance = 0.1;


gammar = 100; 
r_old = 0;
for i = 1:100
    
    cost1 = 1; cost2 = 1;

    r_c = 0;
    c_1 = cost1; c_2 = cost2;

    for j=1:1000
        main;
        mess = sprintf(' g:%f,c1:%f,c2:%f,r1:%f,r2:%f,r_all:%f',gammar,cost1,cost2,ratio1,ratio2,ratio1+ratio2);
        disp(mess);


%        if  abs(ratio1-ratio2) < tolerance && ~(ratio1 == 1 || ratio2 == 1)
%            break;
%        else
            if  r_c > ratio1 + ratio2;
                cost1 = c_1; cost2 = c_2;
                break;
            else
                c_1 = cost1; c_2 = cost2;
                r_c = ratio1 + ratio2;
            end

            if  abs(ratio1-ratio2)>0.5 
                convergence = 0.1;
            else
                convergence = 0.5;
            end

            if  ratio1 >ratio2
                cost2 = cost2*convergence;
            else
                cost1 = cost1*convergence;
            end
%        end
    end
    
    if  r_c < r_old
        break;
    end;
    
    opt_solu = [gammar,cost1,cost2];
    r_old = r_c;
    gammar = gammar/10;
    
end


