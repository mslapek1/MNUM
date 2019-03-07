function result = newton_method(a,b, eps)
    x = a;
    y = b;
    iter = 0; %zmienna, kt�ra powie nam ile zosta�o wykonanych iteracji
    war_z = 1;
    
    while(abs(war_z) > eps) %algorytm zatrzyma si�, gdy zostanie uzyskana okre�lona dok�adno��
        z = x - fun(x)/derivative(x); %oblcizamy zmienn� z z gotowego wzoru
        war_z = fun(z); %oblcizamy warto�� funkcji w punkcie z
        x = z; %przypisujemy pod zmienn� x warto�� zmiennej z
        iter = iter + 1; %inkrementujemy iter
        fprintf(1, '%g\n', z);
    end
    
    result = z;  %przypisujemy jako wynik warto�� zmiennej z
    fprintf(1, 'Liczba iteracji jest r�wna: %d\n', iter);
end