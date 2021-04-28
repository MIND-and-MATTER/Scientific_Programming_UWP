%% Maxwell-Boltzmann Distrobution for Gasses
% This program is designed to take a user input of Kelvin temperature (initially set to 300K). Data relating to molecular gasses will be
% extracted from a file. Calculations will return probability functions for the velocities of gas particles at the
% given temperature. Computations to output a graphical representation of these functions will occur and the results
% will be displayed.
 

%% Initial conditions:
% Temperature of the container is set.
% Data is retrieved from a file

T = 300;
Data = readcell("Gas_mass.csv");
Names = Data(:,1);
Masses = Data(:,2);
Velocity  = zeros(length(Names), 3);
Legen = string(zeros(length(Names), 1));


%% Graphical Representation:
% The data from the file is iterated through and calculations are done
% for every unique gas.
hold on
for i = 1:length(Names)
    Mass = Masses{i} * 6.0221409e-26;
    [v_max, v_rms, v_ave] = velocities(T, Mass);
    Velocity(i, :) = [v_max, v_rms, v_ave];
    [x_vals, y_vals] = distribution_curve( T, Mass);
    plot(x_vals, y_vals)
    Legen(i) = sprintf("%s     v_r_m_s=%0.3e", Names{i}, v_rms); 
end

% Attributes of the graph are set.
legend(Legen);
xlabel("Velocity (m/s)")
ylabel("Probability")
hold off

%% Probability Distrobution:
% The following equation is used to calculate probabilities over 
% the range of velocitiy. 
%
% $$ P(v) = ((4*pi) * (m / (2*pi*k*T))^(3/2)) * v(i)^2 * exp(-(m * (v(i)^2)) / (2*k*T)) $$
%
function [velo, dist] = distribution_curve( T, m)
    k = 1.38064852e-23;
    v = (0: 5: 1000);
    A = zeros(2, length(v));
    fact =  (4*pi) * (m / (2*pi*k*T))^(3/2);
    for i = 1: length(v)
        A(1, i) = v(i);
        A(2, i) = fact * v(i)^2 * exp(-(m * (v(i)^2)) / (2*k*T));
    end
    velo = A(1,:);
    dist = A(2,:);
end

%% V_rms, V_ave, V_max
% The following equations are used to calculate root mean square, average, 
% and most probable velocities.
%
% $$ v_rms = sqrt(3) * sqrt(k*T / m) $$
% $$ v_ave = sqrt(8 / pi) * sqrt(k*T / m) $$
% $$ v_max = sqrt(2) * sqrt(k*T / m) $$

function [v_max, v_rms, v_ave] = velocities(T, m)
    k = 1.38064852e-23;
    fact = sqrt(k*T / m);
    v_rms = sqrt(3) * fact;
    v_ave = sqrt(8 / pi) * fact;
    v_max = sqrt(2) * fact;
end

%% Note on M-B Distrobution:
% A Maxwell-Boltzmann Distribution is a probability distribution used for describing
% the speeds of various particles within a stationary container at a specific temperature. 
% The distribution is often represented with a graph, with the y-axis defined as the probability
% a molecule is moving at the velocity coresponding to the x-axis.
