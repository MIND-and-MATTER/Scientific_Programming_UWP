x = 0:0.01:10;
mu = 5;

sig_1 = 0.5;
ex_1 = -(x - mu).^2 / (2 * sig_1^2);
graph_1 = exp(ex_1) / (sig_1 * sqrt(2 * pi));


sig_2 = 1.0;
ex_2 = -(x - mu).^2 / (2 * sig_2^2);
graph_2 = exp(ex_2) / (sig_2 * sqrt(2 * pi));

sig_3 = 1.5;
ex_3 = -(x - mu).^2 / (2 * sig_3^2);
graph_3 = exp(ex_3) / (sig_3 * sqrt(2 * pi));


plot(x, graph_1,"--", x, graph_2,"-.", x, graph_3,":k");
hold on
axis([0 10 0 1]);
title("Normal Gaussian Functions");
xlabel("x");
ylabel("ϕ(x−5,σ)");
legend("ϕ = 0.5", "ϕ = 1.0", "ϕ = 1.5");
hold off






