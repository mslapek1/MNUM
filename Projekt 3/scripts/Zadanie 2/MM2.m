function [solutions] = MM2(x, n, degree)
    solutions = zeros(degree, 1);
    for k = 1:degree
 
        for i = 1:n
            z1 = -2*fun(x(k))/(der1_fun(x(k))+sqrt(der1_fun(x(k))^2-2*fun(x(k))*der2_fun(x(k))));
            z2 = -2*fun(x(k))/(der1_fun(x(k))-sqrt(der1_fun(x(k))^2-2*fun(x(k))*der2_fun(x(k))));

            if abs(z1) > abs(z2)
                z_min = z2;
            else
                z_min = z1;
            end
            x(k) = x(k)+z_min;
        end
        solutions(k) = x(k);
        degree = degree - 1;
    end
end