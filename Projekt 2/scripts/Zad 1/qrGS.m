function [Q,R] = qrGS(A)
    %%rozk³ad macierzy mxn, gdzie m >= n, rzeczywistej lub zespolonej
    [m n]=size(A);		%%pobranie wymiarów macierzy

    %%alokacja pamiêci macierzy Q i R
    Q=zeros(m,n);
    R=zeros(n,n);

    %%alokacja macierzy przechowuj¹ca dan¹ kolumnê
    kolumna = zeros(1,n);

    for (i = 1:n)
        Q(:,i)=A(:,i);	%%kolumna i-ta macierzy A staje siê i-t¹ kolumn¹ macierzy Q
        R(i,i)=1;	%%element na diagonali macierzy R = 1
        kolumna(i)=Q(:,i)'*Q(:,i);	
        for (j = (i+1):n) %% dla kolejnej kolumny 
            R(i,j)=(Q(:,i)'*A(:,j))/kolumna(i);	%%element R jest obliczany zgodnie z algorytmem
            A(:,j)=A(:,j)-R(i,j)*Q(:,i); %%ka¿da kolejna kolumna macierzy A jest zmniejszana o iloczyn danego elementu z macierzy R i odpowiedniej kolumn Q
        end
    end

    %%normalizujemy kolumny macierzy Q
    for (i = 1:n)
        norma = norm(Q(:,i));
        Q(:,i)= Q(:,i)/norma;
        R(i,i:n)= R(i,i:n)*norma;
    end	
end
