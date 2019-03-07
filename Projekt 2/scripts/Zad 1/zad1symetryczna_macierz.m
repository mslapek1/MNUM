function fun = zad1symetryczna_macierz()
    
    n = 5; %%inicjalizajca macierzy
    rozmiar = 30;        
    up0 = 0.000000001; %%ustawienie wartoœæ up0 - ustawienie górnej granicy elementów zerowych, maxit - maksymalnej iloœci iteracji
    maxit = 2000;
    
    while n<=20    
        A = zeros(n, n); %%alokacja pamiêci dla macierzy A
        M = zeros (n,n);
        
        goodit = 0;
        
        gooditbp = 0; %%bez przesuniêc
        gooditzp = 0; %%z przesuniêciami
        itbp = 0; %%bez przesuniêc
        itzp = 0; %%z przesuniêciami
        iterbp = 0;
        iterzp = 0;
        
        %dla macierzy Hessenberga
        gooditbph = 0; %%bez przesuniêc
        gooditzph = 0; %%z przesuniêciami
        itbph = 0; %%bez przesuniêc
        itzph = 0; %%z przesuniêciami
        iterbph = 0;
        iterzph = 0;
        
        wek = zeros(n, 1);
        wekbp = zeros(n, 1); %%macierz przechowuj¹ca wektory w³asne metod¹ bez przesuniêæ
        wekzp = zeros(n, 1); %%macierz przechowuj¹ca wektory w³asne metod¹ z przeuniêciami
        EIG = zeros(n, 1);
        
        
        for i = 1:rozmiar
           while(det(A) == 0)
               A = rand(n, n); %%wygenerowanie macierzy losowej
               A = A + A'; %%macierz symetryczna
               M = hess(A);
           end
           [wekbp, itbp, goodit] = EigvalQRNoShift(A,up0,maxit);
           if goodit == 1
               gooditbp = gooditbp + 1 ;
               iterbp = iterbp + itbp;
           end
           [wekbp, itbph, goodit] = EigvalQRNoShift(M,up0,maxit);
           if goodit == 1
               gooditbph = gooditbph + 1 ;
               iterbph = iterbph + itbph;
           end
           [wekzp, itzp , goodit] = EigvalQRshifts(A,up0,maxit);
           if goodit == 1
               gooditzp = gooditzp +1 ;
               iterzp = iterzp + itzp;
           end
          [wekbp, itzph, goodit] = EigvalQRshifts(M,up0,maxit);
           if goodit == 1
               gooditzph = gooditzph + 1 ;
               iterzph = iterzph + itzph;
           end
           wek = eig(A);
           EIT = eig(A);
           A = 0;
           
        end

        sredniabp = 0;
        sredniazp = 0;
        if gooditbp > 0
            sredniabp = iterbp/gooditbp;
        end
        if gooditzp > 0
            sredniazp = iterzp/gooditzp;
        end
        
        sredniabph = 0;
        sredniazph = 0;
        if gooditbph > 0
            sredniabph = iterbph/gooditbph;
        end
        if gooditzph > 0
            sredniazph = iterzph/gooditzph;
        end
        
        fprintf(1, "Wielkoœæ macierzy: %d \n", n);
        fprintf(1, "(Œrednia iloœæ iteracji dla metody bez przesuniêæ, iloœæ udanych) = (%g, %d) \n", sredniabp, gooditbp);
        fprintf(1, "(Œrednia iloœæ itracji dla metody z przeuniêciami, iloœæ udanych) = (%g, %d) \n", sredniazp, gooditzp);
        %%fprintf(1, "Macierz Hessenberga:(Œrednia iloœæ iteracji dla metody bez przesuniêæ, iloœæ udanych) = (%g, %d) \n", sredniabph, gooditbph);
        %%fprintf(1, "Macierz Hessenberga:(Œrednia iloœæ itracji dla metody z przeuniêciami, iloœæ udanych) = (%g, %d) \n", sredniazph, gooditzph);
        n = 2 * n; %%wyst¹pi generacja macierzy 5, 10, 20 - tak jak w poleceniu 
    end
end