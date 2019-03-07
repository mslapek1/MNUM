function [eigenvalues, it, goodit] = EigvalQRshifts(A,up0,maxit)
%%up0-górna granica elementów zerowanych
%%maxit-maksymalna liczba iteracji
    n=size(A,1);	%%pobieramy rozmiar macierzy
    eigenvalues=diag(zeros(n));	%%alokacja pamiêci dla macierzy diagonalnej przechowuj¹cej wartoœci w³asne macierzy A
    Ak = A;		%%macierz pocz¹tkowa (oryginalna) 
    it=1;			%%iterator
    goodit=1;			%%jesli zosta³ przekroczony maxit wówczas uznajemy ¿e algorytm nie da³ rady
    for k=n:-1:2
        DK=Ak;	%%DK - macierz startowa dla jednej wartoœci w³asnej
        i=0;	
        while (i <= maxit && max(abs(DK(k,1:k-1))) > up0)
       %%wykonuj a¿ do nastêpuj¹cych warunków - liczba it przekroczy itmax lub 
            DD=DK(k-1:k,k-1:k);	%%podmacierz dolnego prawego rogu
            e=[1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(1,2)*DD(2,1)];
            r=roots(e);	%%obliczamy pierwiastki wielomianu e
            if abs(r(1,1)-DD(2,2)) < abs(r(2,1)-DD(2,2))	%%wartoœæ w³asna podmacierzy DD
                shift=r(1,1);
            else
                shift=r(2,1);
            end
            DK=DK-eye(k)*shift;		%%macierz przesuniêta
            [Q,R]=qrGS(DK);		%%faktoryzacja QR
            DK=R*Q+eye(k)*shift;		%%dodajemy przesuniêcia
            it=it+1;				%%zwiêkszamy iterator
            i = i+1;
        end
        if it > maxit
            goodit = 0;		%%%%jeœli nie uda³o siê osi¹gn¹æ wyniku w mniej ni¿ itmax iteracji wtedy oznacza, ¿e siê nie uda³o obliczyæ wartoœci w³asnej z dan¹ dok³adnoœci¹
        end
        eigenvalues(k)=DK(k,k);		%%zapisujemy jako wartoœæ w³asna element z rogu macierzy
        if k>2
            Ak=DK(1:k-1,1:k-1);	%%macierz - deflacja
        else
            eigenvalues(1)=DK(1,1);			%%je¿eli to ostatnia macierz w³asna
        end	
    end
end
