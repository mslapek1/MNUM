n = 100;

%zainicjowanie macierzy
A1 = zeros(n, n);
A2 = zeros(n, n);
A3 = zeros(n, n);
b1 = zeros(n, 1);
b2 = zeros(n, 1);
b3 = zeros(n, 1);

%tworzenie macierzy z pierwszego przyk³adu
for i = 1:n
    for j = 1:n
        if i == j
            A1(i, j) = 9;
        elseif i == j-1 || i == j+1
            A1(i, j) = 3;
        else 
            A1(i, j) = 0;
        end
    end
end

for i = 1:n
    b1(i) = 1.5 + 0.5 * i;
end
%tworzenie macierzy z drugiego przyk³adu
for i = 1:n
    for j = 1:n
        if i == j
            A2(i, j) = 1/7;
        else 
            A2(i, j) = 11*(i-j) +2;
        end
    end
end

 for i = 1:n
     b2(i) =1 + 0.4*i;
 end
 
 %tworzenie macierzy z drugiego przyk³adu
for i = 1:n
    for j = 1:n
       A3(i,j) = 2/(5*(i+j+1));
    end
end

 for i = 1:n
     if mod(i, 2) == 0
         b3(i, 1) = 8/(7*i);
     else 
         b3(i, 1) = 0;
     end 
 end
 
 %%rozszerzone macierze dla przyk³adu A, B, C z zadania 2.
 pA = [A1, b1];
 pB = [A2, b2];
 pC = [A3, b3];
 