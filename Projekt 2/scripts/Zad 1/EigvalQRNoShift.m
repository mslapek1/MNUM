function [eigenvalues, it, goodit] = EigvalQRNoShift(A, up0, maxit)
%%up0-g�rna granica element�w zerowanych
%%maxit-maksymalna liczba iteracji

    it=1; %%inicjalizacja iteratora
    goodit = 1; %%sprawdzenie czy liczba iteracji nie przekroczy�a maxit
    n=size(A,1); %%pobranie rozmiaru macierzy
    eigenvalues=diag(zeros(n)); %%alokacja pami�ci dla macierzy diagonalnej przechowuj�cej warto�ci w�asne macierzy A
    Ak = A; %%alukuj� pami�� w celu nie zmienienia macierzy A
    
    while (it <= maxit && max(max(Ak-diag(diag(Ak)))) > up0) %%wykonuj a� do nast�puj�cych warunk�w - liczba it przekroczy itmax lub 
        [Q,R]=qrGS(Ak); %%rozk�ad QR metod� Grama-Schmidta
        Ak=R*Q; %%zgodnie z metod� A w nast�pnej iteracji b�dzie obliczone w ten spos�b
        it=it+1; %%zwi�kszamy warto�� iteratora
    end
    
    if it>maxit
       goodit = 0; %%je�li nie uda�o si� osi�gn�� wyniku w mniej ni� itmax iteracji wtedy oznacza, �e si� nie uda�o obliczy� warto�ci w�asnej z dan� dok�adno�ci�
    end
    eigenvalues=diag(Ak);
end

