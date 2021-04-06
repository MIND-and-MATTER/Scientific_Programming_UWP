A = 1 + ones(1, 10);
m = diag(A);
for i = 1:9
    m(i, i+1) = -1;
    m(i+1, i) = -1;
end

H = ((10+1)^2 / 2) .* m;

n_points = 10;
[eigenvectors, eigenvalues] = eig(H);
x_values = linspace(1/(n_points+1), n_points/(n_points+1), n_points);
y2 = sqrt(2) * (sin(pi * x_values));

plot(x_values, eigenvectors(:,1), "-", x_values, y2, "-." )

    
