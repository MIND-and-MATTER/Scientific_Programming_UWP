A = 1 + ones(1, 10);
m = diag(A);
for i = 1:9
    m(i, i+1) = -1;
end

for j = 1:9
    m(j+1, j) = -1;
end

H = ((5+1)^2 / 2) .* m;

n_points = 10;
y_values = eig(H);
x_values = linspace(1/(n_points+1), n_points/(n_points+1), n_points);
y2 = sqrt(2) * (sin(pi * x_values));

plot(x_values, y_values, "-", x_values, y2, "-." )
hold on
axis([0 1])
hold off

    
