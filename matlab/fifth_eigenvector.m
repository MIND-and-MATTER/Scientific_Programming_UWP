A = 1+ ones(1,5);
m = diag(A);

for i = 1:4
    m(i, i+1) = -1
end

for j = 1:4
    m(j+1, j)= -1
end

H = ((5+1)^2 / 2) .* m

y_values = eig(H);
x_values = linspace(1/(5+1), 5/(5+1), 5);
y2 = sqrt(sin(pi * x_values))

plot(x_values, y_values, "-", x_values, y2, "-." )