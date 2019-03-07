function result = secant_method(a, b, eps)
    
    x = a;
    y = b;
    war_z = 2 * eps;
    iter = 0; %zmienna, która powie nam ile zosta³o wykonanych iteracji
    
    while (abs(war_z) > eps) %algorytm zatrzyma siê, gdy zostanie uzyskana okreœlona dok³adnoœæ
        war_x = fun(x);  %obliczamy wartosc funkcji w punkcie x
        war_y = fun(y); %obliczmy wartoœc funkcji w punkcie y

        z = (x*war_y-y*war_x)/(war_y - war_x); %obliczamy wartoœæ z z danego wzoryu
        war_z = fun(z);  %obliczamy wartoœæ funkcji dla obliczonej wartoœæ z
        x = y; %przypisujemy wartoœæ y zmiennej x
        y = z; %przypisujemy wartoœæ zmiennej y zmiennej z
        iter = iter + 1; %inkrementujemy wartoœæ zmiennej iter
        fprintf(1, '%g\n', z);
    end
    result = z; %przypisujemy jako wynik wartoœæ zmiennej z
    fprintf(1, 'Liczba iteracji jest równa: %d\n', iter);

end