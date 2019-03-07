function Y_nas = metoda_jakobiego (A,B,n)
    A1 = A; %%przypisuje t¹ macierz do innej macierzy aby funkcja nie zmienia³a wartoœci elementów macierzy A
    D = zeros(n, n);
    tic;
    
    %%sprawdzenie czy macierz jest silnie diagonalna
    for i = 1:n
        wiersze = 0;
        kolumny = 0;
        for j = 1:n
            wiersze = wiersze + abs(A1(i, j));
            kolumny = kolumny + abs(A1(j, i));
        end
        wiersze = wiersze - abs(A1(i, i));
        kolumny = kolumny - abs(A1(i, i));
        

    end
    if wiersze > abs(A1(i, i)) && kolumny > abs(A1(i, i))
        disp("Nie jest spe³niony warunek silnej diagonalizacji"); %%sprawdzam czy jest spe³niony warunek silnej diagonalizacji
        return;
    end
    %inicjalizacja danych macierzy danych w zadaniu
    for i = 1:n
        D(i, i) = A1(i, i); %%macierz D bêdzie macierz¹ diagonali D
        A1(i, i) = 0; %%macierz A bêdzie sum¹ macierzy L + U
    end
    LU = A1; %%tworzenie macierzy LU = L + U
    Y_pop = zeros(n,1);
    Y_nas = zeros(n,1);
    for i = 1:n
        Y_pop(i, 1) = 0; %%tworzymy macierz do przechwywania wyników poprzedniego
        Y_nas(i, 1) = 0; %%wynik nastêpny
    end
    
    norma_euklidesowa = 1;
    Y_pop = B;
    %implementacja algorytmu
    while(norma_euklidesowa > 10^(-10))
       
        Y_nas = (-1) * D^(-1)* LU * Y_pop + D^(-1)*B; %%wzór wprost z ksi¹¿ki prof. Tatjewskiego
        norma_euklidesowa = norm(A*Y_nas-B);  %%obliczanie normy euklidesowej - warunek stopu
        Y_pop = Y_nas; %%przypisanie wartoœci¹ poprzednim wartoœci obliczonej w danej interacji
    %implementacja b³êdu - norma euklidesa 
    end
    blad = A*Y_nas-B; %%macierz, która bêdzie zawiera³a b³¹d od poprawnego wyniku
    toc;
end