A = 1+ ones(1,5);
m = diag(A);
m(1,2) = -1; m(2,1)=-1; m(2,3)=-1;  m(3,2)=-1;  m(3,4)=-1;
m(4,3)=-1;  m(4,5)=-1;  m(5,4)=-1;

H = ((5+1)^2 / 2) .* m

y_values = eig(H);
x_values = linspace(1/(5+1), 5/(5+1), 5);

plot(x_values, y_values)