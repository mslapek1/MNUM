function result = secant_method(a, b, eps)
    
    x = a;
    y = b;
    war_z = 2 * eps;
    iter = 0; %zmienna, kt�ra powie nam ile zosta�o wykonanych iteracji
    
    while (abs(war_z) > eps) %algorytm zatrzyma si�, gdy zostanie uzyskana okre�lona dok�adno��
        war_x = fun(x);  %obliczamy wartosc funkcji w punkcie x
        war_y = fun(y); %obliczmy warto�c funkcji w punkcie y

        z = (x*war_y-y*war_x)/(war_y - war_x); %obliczamy warto�� z z danego wzoryu
        war_z = fun(z);  %obliczamy warto�� funkcji dla obliczonej warto�� z
        x = y; %przypisujemy warto�� y zmiennej x
        y = z; %przypisujemy warto�� zmiennej y zmiennej z
        iter = iter + 1; %inkrementujemy warto�� zmiennej iter
        fprintf(1, '%g\n', z);
    end
    result = z; %przypisujemy jako wynik warto�� zmiennej z
    fprintf(1, 'Liczba iteracji jest r�wna: %d\n', iter);

end