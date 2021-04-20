
T = 300;
m = 5.31e-26;
Data = readcell("Gas_masses.csv");
Names = Data(:,1);
Masses = Data(:,2);
%.* 6.0221409e2-26;
%elements = containers.Map(Names, Masses);
%h = (keys(elements));
%j = values(elements);

for i = 1:length(Names)
     Mass = Masses(i);
    [v_max, v_rms, v_ave] = velocities(T, Mass);
    [x_vals, y_vals] = distribution_curve( T, Mass);
    plot(x_vals, y_vals)
end



%function[] = Maxwell_Distribution(T, m)


%function [Data] = extract(file_name)
 %   E = importdata(file_name);
  %  Names = [E.textdata];
   % Masses = [E.data]./ 6.0221409e26;
    %Data = containers.Map(Names, Masses);      
%end


function [velo, dist] = distribution_curve( T, m)
    k = 1.38064852e-23;
    v = (0: 15: 3000);
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
    k = 1.38064852e-23;
    fact = sqrt(k*T / m);
    v_max = sqrt(2) * fact;
    v_rms = sqrt(3) * fact;
    v_ave = sqrt(8 / pi) * fact;
end

%end
