function result = newton_method(a,b, eps)
    x = a;
    y = b;
    iter = 0; %zmienna, która powie nam ile zosta³o wykonanych iteracji
    war_z = 1;
    
    while(abs(war_z) > eps) %algorytm zatrzyma siê, gdy zostanie uzyskana okreœlona dok³adnoœæ
        z = x - fun(x)/derivative(x); %oblcizamy zmienn¹ z z gotowego wzoru
        war_z = fun(z); %oblcizamy wartoœæ funkcji w punkcie z
        x = z; %przypisujemy pod zmienn¹ x wartoœæ zmiennej z
        iter = iter + 1; %inkrementujemy iter
        fprintf(1, '%g\n', z);
    end
    
    result = z;  %przypisujemy jako wynik wartoœæ zmiennej z
    fprintf(1, 'Liczba iteracji jest równa: %d\n', iter);
end