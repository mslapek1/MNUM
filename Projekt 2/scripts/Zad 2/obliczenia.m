
function [a1,norma1,a2,norma2]=obliczenia(X,Y,stopien)
    [rozmiar, ~]  = size(X); %macierz A
    A = zeros(rozmiar, stopien+1);
    %Wypelniamy macierz A potegami elementow x %
    for i=1:rozmiar
        for j=0:stopien
            A(i,stopien + 1 - j) = X(i)^(j);
        end
    end
    %uk³ad równañ normalnych
    a1 = (A'*A)\(A'*Y); 
    %uk³ad równañ liniowych z macierz¹ R wynikaj¹c¹ z rozk³adu QR 
    [Q, R] = qrGS(A); 
    a2 = R\(Q'*Y);
    % Wyliczanie normy euklidesowej
    norma1 = norm(A*a1-Y);
    norma2 = norm(A*a2-Y);
end