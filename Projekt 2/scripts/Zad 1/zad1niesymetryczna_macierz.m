function fun = zad1niesymetryczna_macierz()
    
    n = 5; %%inicjalizajca macierzy
    rozmiar = 30;        
    up0 = 0.00001; %%ustawienie wartoœæ up0 - ustawienie górnej granicy elementów zerowych, maxit - maksymalnej iloœci iteracji
    maxit = 1000;
    
    while n<=20    
        A = zeros(n, n); %%alokacja pamiêci dla macierzy A
        
        goodit = 0;
        
        gooditzp = 0; %%z przesuniêciami
        itzp = 0; %%z przesuniêciami
        iterzp = 0;
        
        
        wek = zeros(n, 1);
        wekzp = zeros(n, 1); %%macierz przechowuj¹ca wektory w³asne metod¹ z przeuniêciami
        EIG = zeros(n, 1);
        
        
        for i = 1:rozmiar
           while(det(A) == 0)
               A = rand(n, n); %%wygenerowanie macierzy losowej
               M = hess(A);
           end

           [wekzp, itzp , goodit] = EigvalQRshifts(A,up0,maxit);
           if goodit == 1
               gooditzp = gooditzp +1 ;
               iterzp = iterzp + itzp;
           end
           wek = eig(A);
           EIT = eig(A);
           A = 0;
           
        end

        sredniazp = 0;

        if gooditzp > 0
            sredniazp = iterzp/gooditzp;
        end
        

        fprintf(1, "Wielkoœæ macierzy: %d \n", n);
        fprintf(1, "(Œrednia iloœæ itracji dla metody z przeuniêciami, iloœæ udanych) = (%g, %d) \n", sredniazp, gooditzp);
        n = 2 * n; %%wyst¹pi generacja macierzy 5, 10, 20 - tak jak w poleceniu 
    end
end