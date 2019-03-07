function [eigenvalues, it, goodit] = EigvalQRNoShift(A, up0, maxit)
%%up0-górna granica elementów zerowanych
%%maxit-maksymalna liczba iteracji

    it=1; %%inicjalizacja iteratora
    goodit = 1; %%sprawdzenie czy liczba iteracji nie przekroczy³a maxit
    n=size(A,1); %%pobranie rozmiaru macierzy
    eigenvalues=diag(zeros(n)); %%alokacja pamiêci dla macierzy diagonalnej przechowuj¹cej wartoœci w³asne macierzy A
    Ak = A; %%alukujê pamiêæ w celu nie zmienienia macierzy A
    
    while (it <= maxit && max(max(Ak-diag(diag(Ak)))) > up0) %%wykonuj a¿ do nastêpuj¹cych warunków - liczba it przekroczy itmax lub 
        [Q,R]=qrGS(Ak); %%rozk³ad QR metod¹ Grama-Schmidta
        Ak=R*Q; %%zgodnie z metod¹ A w nastêpnej iteracji bêdzie obliczone w ten sposób
        it=it+1; %%zwiêkszamy wartoœæ iteratora
    end
    
    if it>maxit
       goodit = 0; %%jeœli nie uda³o siê osi¹gn¹æ wyniku w mniej ni¿ itmax iteracji wtedy oznacza, ¿e siê nie uda³o obliczyæ wartoœci w³asnej z dan¹ dok³adnoœci¹
    end
    eigenvalues=diag(Ak);
end

