function X = metoda_eleminacji_Gaussa (A, n)
tic;
X = zeros(n,1); %%alokacja pami�ci do wektora rozwi�za�
for i = 1:n
    pom = abs(A(i, i)); %%zmienna pomocnicza przechowuj�ca aktualnie najwi�ksz� warto�� w kolumnie
    poz = i; %%zmienna pomocnicza przechwouj�ca aktualnie miejsce najwi�kszej warto�ci w kolumnie
    %%szukam wiersza, ktory b�dzie mia� najwi�kszy modu� w kolumnie 
    for j = (i+1):n
        if(abs(A(j, i)) > pom)
            pom = abs(A(j, i));
            poz = j;
        end
    end %%je�li ca�y wiersz ma warto�ci tylko 0, wowczas detA = 0 i rownanie jest zalezne od parametr�w
    if(pom == 0)
        fprintf(1, "R�wnanie zale�ne od paramentr�w, detA = 0", n);
        return;
    end
    %%zamiana miejscami i-tego wiersza o najwi�ksz� aktualnie warto�ci� z w i-tej
    %%kolumnie z j-tym wierszem.
    zamiana = A(i,:); 
    A(i, :) = A(poz, :);
    A(poz, :) = zamiana;
    
    %obliczanie wsp�czynnik�w 
   for j=(i+1):n       
   l = A(j,i)/A(i,i);  
   A(j,:) = A(j,:) - l*A(i,:); %%macierz tr�jk�tna
   end
end
%%jesli macierz trojkatna gorna ma w elemencie (n, n) warto�� 0, oraz
%%element (n, n+1) oznacza to, �e det(A) = 0, elementy s� zale�ne
    if A(n,n) == 0
        if A(n,(n+1)) == 0   
            fprintf(1, 'Det(A) = 0!', n);
            return
        else %%w innym wypadku oznacza to, �e macierz jest sprzeczna
            fprintf(1, 'Macierz sprzeczna!\n', n);
            return
        end    
    end
   %%rozwi�zywania uk�adu r�wna� zgodnie ze wzorem z ksi��ki prof.
   %%Tatjewskiego
   for i = n:-1:1
        licznik = 0;
        for s=n:-1:i  
            licznik = licznik+(A(i,s)*X(s));
        end
        X(i,1) = (A(i,(n+1))-licznik)/A(i,i) ;  %%rozwi�zujemy uk�adu
   end
   residuum = 0; 
   residuum = A(:,1:n)*X-A(:,n+1);%% zmienna okre�laj�ca b��d mojego rozwi�zania
   norma = norm(residuum);
toc;
end