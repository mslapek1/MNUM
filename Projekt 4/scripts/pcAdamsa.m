function [fun] = pcAdamsa()
tic;

%f1,f2 - funkcje z zadania %
% h -krok %
% x1, x2 - warunki poczatkowe %

h = 0.3; %krok
x1=0.001; %pierwszy pkt
x2=0.001; %drugi pkt
%% 10 9; 0 7; 7 0; 0.001 0.001 - dane warunki pocz¹tkowe

t=0:h:20; %iloœæ kroków

fun(:,1) = [x1 x2]; %zapis pierwszych danych do wykresu

for i=1:3
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
    
    fun(:,i+1)=[x1 x2]; %zapisanie danych
end
for i = 4:(length(t))
    %predykcja z ewaluacj?
    tmp1 = x1 + (h/24)*55*fx1(x1,x2) - 59*(h/24)*fx1(fun(1,i-1),fun(2,i-1)) + 37*(h/24)*fx1(fun(1,i-2),fun(2,i-2)) - 9*(h/24)*fx1(fun(1,i-3),fun(2,i-3));
    tmp2 = x2 + (h/24)*55*fx2(x1,x2) - 59*(h/24)*fx2(fun(1,i-1),fun(2,i-1)) + 37*(h/24)*fx2(fun(1,i-2),fun(2,i-2)) - 9*(h/24)*fx2(fun(1,i-3),fun(2,i-3));
    %korekcja z ewaluacj?
    x1 = x1 + (h/720)*646*fx1(x1,x2) - 264*(h/720)*fx1(fun(1,i-1),fun(2,i-1)) + 106*(h/720)*fx1(fun(1,i-2),fun(2,i-2)) - 19*(h/720)*fx1(fun(1,i-3),fun(2,i-3)) + h*(251/720)*fx1(tmp1, tmp2);
    x2 = x2 + (h/720)*646*fx2(x1,x2) - 264*(h/720)*fx2(fun(1,i-1),fun(2,i-1)) + 106*(h/720)*fx2(fun(1,i-2),fun(2,i-2)) - 19*(h/720)*fx2(fun(1,i-3),fun(2,i-3)) + h*(251/720)*fx2(tmp1, tmp2);
    
    fun(:,i)=[x1 x2];
end
plot(fun(1,:),fun(2,:));

toc;
end