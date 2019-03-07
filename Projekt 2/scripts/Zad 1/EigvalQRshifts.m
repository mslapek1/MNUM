function [eigenvalues, it, goodit] = EigvalQRshifts(A,up0,maxit)
%%up0-g�rna granica element�w zerowanych
%%maxit-maksymalna liczba iteracji
    n=size(A,1);	%%pobieramy rozmiar macierzy
    eigenvalues=diag(zeros(n));	%%alokacja pami�ci dla macierzy diagonalnej przechowuj�cej warto�ci w�asne macierzy A
    Ak = A;		%%macierz pocz�tkowa (oryginalna) 
    it=1;			%%iterator
    goodit=1;			%%jesli zosta� przekroczony maxit w�wczas uznajemy �e algorytm nie da� rady
    for k=n:-1:2
        DK=Ak;	%%DK - macierz startowa dla jednej warto�ci w�asnej
        i=0;	
        while (i <= maxit && max(abs(DK(k,1:k-1))) > up0)
       %%wykonuj a� do nast�puj�cych warunk�w - liczba it przekroczy itmax lub 
            DD=DK(k-1:k,k-1:k);	%%podmacierz dolnego prawego rogu
            e=[1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(1,2)*DD(2,1)];
            r=roots(e);	%%obliczamy pierwiastki wielomianu e
            if abs(r(1,1)-DD(2,2)) < abs(r(2,1)-DD(2,2))	%%warto�� w�asna podmacierzy DD
                shift=r(1,1);
            else
                shift=r(2,1);
            end
            DK=DK-eye(k)*shift;		%%macierz przesuni�ta
            [Q,R]=qrGS(DK);		%%faktoryzacja QR
            DK=R*Q+eye(k)*shift;		%%dodajemy przesuni�cia
            it=it+1;				%%zwi�kszamy iterator
            i = i+1;
        end
        if it > maxit
            goodit = 0;		%%%%je�li nie uda�o si� osi�gn�� wyniku w mniej ni� itmax iteracji wtedy oznacza, �e si� nie uda�o obliczy� warto�ci w�asnej z dan� dok�adno�ci�
        end
        eigenvalues(k)=DK(k,k);		%%zapisujemy jako warto�� w�asna element z rogu macierzy
        if k>2
            Ak=DK(1:k-1,1:k-1);	%%macierz - deflacja
        else
            eigenvalues(1)=DK(1,1);			%%je�eli to ostatnia macierz w�asna
        end	
    end
end
