function result = bisection_method(a, b, eps)
    x = a;
    y = b;
    iter = 0; %zmienna, kt�ra powie nam ile zosta�o wykonanych iteracji
    war_z = 1;
    war_x = 0;
    war_y = 0;
    
    while (abs(war_z) > eps) %algorytm zatrzyma si�, gdy zostanie uzyskana okre�lona dok�adno��
        war_x = fun(x); %obliczamy wartosc funkcji w punkcie x
        war_y = fun(y); %obliczmy warto�c funkcji w punkcie y
        z = (x+y)/2; %obliczamy �rodek przedzia�u
        war_z = fun(z); %obliczamy warto�� funkcji dla �rodka przedzia�u
        if (war_y * war_z < 0) %j�sli iloczyn warto�ci funkcji dla �rodka przedzia�u i warto�ci w punkcie x jest ujemna w�wczas...
            x = z; %przypisujemy x warto�� zmiennej z
        end
        if (war_x *war_z < 0)%j�sli iloczyn warto�ci funkcji dla �rodka przedzia�u i warto�ci w punkcie y jest ujemna w�wczas...
            y = z; %przypisujemy y warto�c zmiennej z
        end
        
        iter = iter +1; %inkrementujemy liczb� iteracji
        
        fprintf(1, '%g \n', z);
    end
    result = z; %przypisujemy jako wynik warto�� zmiennej z
    fprintf(1, 'Liczba iteracji: %d \n', iter);
end
    