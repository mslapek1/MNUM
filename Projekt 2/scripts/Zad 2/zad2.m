function [norma1, norma2, a1, a2] = zad2(stopien)

X = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5]';
Y = [-18.7370, -8.1583, -1.9146, -0.3887, 1.8030, 1.1890, 0.4738, 0.4726, 0.0941,  -2.3716, -6.6512]';
%obliczenie macierzy 
[a1,norma1,a2,norma2] = obliczenia(X,Y,stopien);
disp(norma1); %wyswietlenie wartoœci normy
disp(norma2); %wyœwietlenie wartoœci normy
% Dane probkowane 10 razy czesciej
t=-5:0.1:5;
wsp1 = polyval(a1,t);
wsp2 = polyval(a2,t);


%Rysowanie wykresu
polyfit(X,Y,stopien);

%plot(t, wsp1);
title('Wielomian stopnia 1 i 2');
xlabel('X')
ylabel('Y')
hold on
scatter(X,Y)
plot(t, wsp1)
hold off