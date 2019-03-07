function [eps] = machine_eps()
    g = 1; %%inicjalizuje pewna zmienna
 
    while 1+g ~= 1  %%warunek pêtli: wykonuj siê, a¿ nie bêdziesz widzia³a ró¿nicy pomiêdzy 1 + eps a 1, wtedy poznamy nasz¹ dok³adnoœæ maszynow¹
        eps = g;
        g = g/2; %%zmiejszamy liczbê g do takiego momentu, a¿ komputer nie rozró¿ni g a liczby 1 (dzielimy przez dwa gdy¿ komputer pracuje w systemie binarnym
    end

    disp(eps); %%wyœwietlenie dok³adnoœci maszynowej
end