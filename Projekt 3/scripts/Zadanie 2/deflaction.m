function new_parameters = deflaction(solution, degree)
    %deflacja liniowa czynnikiem liniowym - prosty schemat Hornera
    new_parameters = zeros(1, degree-1);
    q = 0;
    for (i = 0:degree-1)
       new_parameters(1,degree-1-i) = parameters(1, degree - 1 -i) + q*solution;
       q = new_parameters(1, degree-1-i);
    end
    
end