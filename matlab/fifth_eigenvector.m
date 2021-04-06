A = 1+ ones(1,5);
m = diag(A);

for i = 1:4
    m(i, i+1) = -1;
    m(i+1, i)= -1;
end

H = ((5+1)^2 / 2) * m;

[eigenvectors, eigenvalues] = eig(H);
x_values = linspace(1/(5+1), 5/(5+1), 5);
y2 = sqrt(2) * (sin(pi * x_values));

plot(x_values, eigenvectors(:,1), "-", x_values, y2, "-." )







