function X = metoda_eleminacji_Gaussa (A, n)
tic;
X = zeros(n,1); %%alokacja pamiêci do wektora rozwi¹zañ
for i = 1:n
    pom = abs(A(i, i)); %%zmienna pomocnicza przechowuj¹ca aktualnie najwiêksz¹ wartoœæ w kolumnie
    poz = i; %%zmienna pomocnicza przechwouj¹ca aktualnie miejsce najwiêkszej wartoœci w kolumnie
    %%szukam wiersza, ktory bêdzie mia³ najwiêkszy modu³ w kolumnie 
    for j = (i+1):n
        if(abs(A(j, i)) > pom)
            pom = abs(A(j, i));
            poz = j;
        end
    end %%jeœli ca³y wiersz ma wartoœci tylko 0, wowczas detA = 0 i rownanie jest zalezne od parametrów
    if(pom == 0)
        fprintf(1, "Równanie zale¿ne od paramentrów, detA = 0", n);
        return;
    end
    %%zamiana miejscami i-tego wiersza o najwiêksz¹ aktualnie wartoœci¹ z w i-tej
    %%kolumnie z j-tym wierszem.
    zamiana = A(i,:); 
    A(i, :) = A(poz, :);
    A(poz, :) = zamiana;
    
    %obliczanie wspó³czynników 
   for j=(i+1):n       
   l = A(j,i)/A(i,i);  
   A(j,:) = A(j,:) - l*A(i,:); %%macierz trójk¹tna
   end
end
%%jesli macierz trojkatna gorna ma w elemencie (n, n) wartoœæ 0, oraz
%%element (n, n+1) oznacza to, ¿e det(A) = 0, elementy s¹ zale¿ne
    if A(n,n) == 0
        if A(n,(n+1)) == 0   
            fprintf(1, 'Det(A) = 0!', n);
            return
        else %%w innym wypadku oznacza to, ¿e macierz jest sprzeczna
            fprintf(1, 'Macierz sprzeczna!\n', n);
            return
        end    
    end
   %%rozwi¹zywania uk³adu równañ zgodnie ze wzorem z ksi¹¿ki prof.
   %%Tatjewskiego
   for i = n:-1:1
        licznik = 0;
        for s=n:-1:i  
            licznik = licznik+(A(i,s)*X(s));
        end
        X(i,1) = (A(i,(n+1))-licznik)/A(i,i) ;  %%rozwi¹zujemy uk³adu
   end
   residuum = 0; 
   residuum = A(:,1:n)*X-A(:,n+1);%% zmienna okreœlaj¹ca b³¹d mojego rozwi¹zania
   norma = norm(residuum);
toc;
end