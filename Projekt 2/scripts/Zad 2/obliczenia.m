
function [a1,norma1,a2,norma2]=obliczenia(X,Y,stopien)
    [rozmiar, ~]  = size(X); %macierz A
    A = zeros(rozmiar, stopien+1);
    %Wypelniamy macierz A potegami elementow x %
    for i=1:rozmiar
        for j=0:stopien
            A(i,stopien + 1 - j) = X(i)^(j);
        end
    end
    %uk�ad r�wna� normalnych
    a1 = (A'*A)\(A'*Y); 
    %uk�ad r�wna� liniowych z macierz� R wynikaj�c� z rozk�adu QR 
    [Q, R] = qrGS(A); 
    a2 = R\(Q'*Y);
    % Wyliczanie normy euklidesowej
    norma1 = norm(A*a1-Y);
    norma2 = norm(A*a2-Y);
end