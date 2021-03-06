function[y,err,it]=JACOBIANO(A,b,epsilon)
% y es vector soluci�n
% err es el error final
% it es el numero de iteraciones final
% A matriz del sistema
% b vector del sistema
% epsilon es la cota del error
n=length(b);
it=0;
err=2*epsilon;
x=zeros(1,n);
y=zeros(1,n);
while err>epsilon
    for i=1:n
        S=0;
       for j=1:n;
       if i~=j;
        S=S+A(i,j)*x(j);
       end
       end
       y(i)=(b(i)-S)/A(i,i);
    end
    it=it+1;
    err=norm(x-y,1);
    x=y;
end
y
it
err

prompt = 'Desea calcularlo con Gauss Seidel? Y/N [Y]: ';
x = input(prompt,'s');
switch x
    case 'y'
        GaussSeidel(A,b,epsilon);
end