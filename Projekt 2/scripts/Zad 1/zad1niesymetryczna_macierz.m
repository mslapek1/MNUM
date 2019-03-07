function fun = zad1niesymetryczna_macierz()
    
    n = 5; %%inicjalizajca macierzy
    rozmiar = 30;        
    up0 = 0.00001; %%ustawienie warto�� up0 - ustawienie g�rnej granicy element�w zerowych, maxit - maksymalnej ilo�ci iteracji
    maxit = 1000;
    
    while n<=20    
        A = zeros(n, n); %%alokacja pami�ci dla macierzy A
        
        goodit = 0;
        
        gooditzp = 0; %%z przesuni�ciami
        itzp = 0; %%z przesuni�ciami
        iterzp = 0;
        
        
        wek = zeros(n, 1);
        wekzp = zeros(n, 1); %%macierz przechowuj�ca wektory w�asne metod� z przeuni�ciami
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
        

        fprintf(1, "Wielko�� macierzy: %d \n", n);
        fprintf(1, "(�rednia ilo�� itracji dla metody z przeuni�ciami, ilo�� udanych) = (%g, %d) \n", sredniazp, gooditzp);
        n = 2 * n; %%wyst�pi generacja macierzy 5, 10, 20 - tak jak w poleceniu 
    end
end