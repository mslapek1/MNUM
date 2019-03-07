function result = bisection_method(a, b, eps)
    x = a;
    y = b;
    iter = 0; %zmienna, która powie nam ile zosta³o wykonanych iteracji
    war_z = 1;
    war_x = 0;
    war_y = 0;
    
    while (abs(war_z) > eps) %algorytm zatrzyma siê, gdy zostanie uzyskana okreœlona dok³adnoœæ
        war_x = fun(x); %obliczamy wartosc funkcji w punkcie x
        war_y = fun(y); %obliczmy wartoœc funkcji w punkcie y
        z = (x+y)/2; %obliczamy œrodek przedzia³u
        war_z = fun(z); %obliczamy wartoœæ funkcji dla œrodka przedzia³u
        if (war_y * war_z < 0) %jêsli iloczyn wartoœci funkcji dla œrodka przedzia³u i wartoœci w punkcie x jest ujemna wówczas...
            x = z; %przypisujemy x wartoœæ zmiennej z
        end
        if (war_x *war_z < 0)%jêsli iloczyn wartoœci funkcji dla œrodka przedzia³u i wartoœci w punkcie y jest ujemna wówczas...
            y = z; %przypisujemy y wartoœc zmiennej z
        end
        
        iter = iter +1; %inkrementujemy liczbê iteracji
        
        fprintf(1, '%g \n', z);
    end
    result = z; %przypisujemy jako wynik wartoœæ zmiennej z
    fprintf(1, 'Liczba iteracji: %d \n', iter);
end
    