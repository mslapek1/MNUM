function Y_nas = metoda_jakobiego (A,B,n)
    A1 = A; %%przypisuje t� macierz do innej macierzy aby funkcja nie zmienia�a warto�ci element�w macierzy A
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
        disp("Nie jest spe�niony warunek silnej diagonalizacji"); %%sprawdzam czy jest spe�niony warunek silnej diagonalizacji
        return;
    end
    %inicjalizacja danych macierzy danych w zadaniu
    for i = 1:n
        D(i, i) = A1(i, i); %%macierz D b�dzie macierz� diagonali D
        A1(i, i) = 0; %%macierz A b�dzie sum� macierzy L + U
    end
    LU = A1; %%tworzenie macierzy LU = L + U
    Y_pop = zeros(n,1);
    Y_nas = zeros(n,1);
    for i = 1:n
        Y_pop(i, 1) = 0; %%tworzymy macierz do przechwywania wynik�w poprzedniego
        Y_nas(i, 1) = 0; %%wynik nast�pny
    end
    
    norma_euklidesowa = 1;
    Y_pop = B;
    %implementacja algorytmu
    while(norma_euklidesowa > 10^(-10))
       
        Y_nas = (-1) * D^(-1)* LU * Y_pop + D^(-1)*B; %%wz�r wprost z ksi��ki prof. Tatjewskiego
        norma_euklidesowa = norm(A*Y_nas-B);  %%obliczanie normy euklidesowej - warunek stopu
        Y_pop = Y_nas; %%przypisanie warto�ci� poprzednim warto�ci obliczonej w danej interacji
    %implementacja b��du - norma euklidesa 
    end
    blad = A*Y_nas-B; %%macierz, kt�ra b�dzie zawiera�a b��d od poprawnego wyniku
    toc;
end