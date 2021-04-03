A = 1 + ones(1, 10);
m = diag(A);
for i = 1:9
    m(i, i+1) = -1
end

for j = 1:9
    m(j+1, j) = -1
end


    
