function[fun] = rk4()
%f1,f2 - funkcje z zadania %
% h -krok %
% x1, x2 - warunki poczatkowe %

h = 0.0005; %krok
x1=0; %pierwszy pkt
x2=7; %drugi pkt
%% 10 9; 0 7; 7 0; 0.001 0.001 - dane warunki pocz¹tkowe
tic; 
t=0:h:20; %liczba kroków
 
fun(:,1) = [x1 x2]; %dane do wykresu
 
for i=1:(length(t)-1)
    k11=fx1(x1,x2);
    k12=fx2(x1,x2);
   
    k21=fx1(x1+0.5*h,x2+0.5*h*k11);
    k22=fx2(x1+0.5*h,x2+0.5*h*k12);
   
    k31=fx1(x1+0.5*h,x2+0.5*h*k21);
    k32=fx2(x1+0.5*h,x2+0.5*h*k22);
   
    k41=fx1(x1+h,x2+h*k31);
    k42=fx2(x1+h,x2+h*k31);
   
    x1=x1+(h/6)*(k11+k41+2*(k21+k31));
    x2=x2+(h/6)*(k12+k42+2*(k22+k32));
   
    fun(:,i+1)=[x1 x2]; %zapis danych   
end
plot(fun(1,:),fun(2,:));
toc;
end