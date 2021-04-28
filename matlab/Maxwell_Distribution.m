%{
This program is designed to take a user input of Kelvin temperature. Data relating to molecular gasses will be
extracted from a file. Calculations will return probability functions for the velocities of gas particles at the
given temperature. Computations to output a graphical representation of these functions will occur and the results
 will be displayed.
 %}



T = 300;
k = 1.38064852e-23;
Data = readcell("Gas_mass.csv");
Names = Data(:,1);
Masses = Data(:,2);
Velocity  = zeros(length(Names), 3);
Legen = string(zeros(length(Names), 1));




function [velo, dist] = distribution_curve( T, m)
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


function [v_max, v_rms, v_ave] = velocities(T, m)
    fact = sqrt(k*T / m);
    v_max = sqrt(2) * fact;
    v_rms = sqrt(3) * fact;
    v_ave = sqrt(8 / pi) * fact;
end

hold on
for i = 1:length(Names)
   
     Mass = Masses{i} * 6.0221409e-26;
    [v_max, v_rms, v_ave] = velocities(T, Mass);
    Velocity(i, :) = [v_max, v_rms, v_ave];
    [x_vals, y_vals] = distribution_curve( T, Mass);
    plot(x_vals, y_vals)
    Legen(i) = sprintf("%s     v_r_m_s=%0.3e", Names{i}, v_rms);
   
end

legend(Legen);
xlabel("Velocity (m/s)")
ylabel("Probability")
hold off

end
