function [eps] = machine_eps()
    g = 1; %%inicjalizuje pewna zmienna
 
    while 1+g ~= 1  %%warunek p�tli: wykonuj si�, a� nie b�dziesz widzia�a r�nicy pomi�dzy 1 + eps a 1, wtedy poznamy nasz� dok�adno�� maszynow�
        eps = g;
        g = g/2; %%zmiejszamy liczb� g do takiego momentu, a� komputer nie rozr�ni g a liczby 1 (dzielimy przez dwa gdy� komputer pracuje w systemie binarnym
    end

    disp(eps); %%wy�wietlenie dok�adno�ci maszynowej
end