m = [1587.12,1319.95, 1381.19] %(legacy, corolla, sentra) (mass in kg)
t = [8.1; 8.2; 8.0] %0-26.82 time in seconds(m/s)
v= 26.82
a=v.*t.^-1 %v divided by t
F=diag(m)*a %diagonal matirx of m times a
d_1=calculate_displacement(0,a,t) %distance to get from 0-26.82 m/s

%s_t=8046.72 % 8046.72 meters... 5 miles
%s_t=200 %200 meters
d_2=s_t*ones(3,1)-d_1 % distance to get to 8046 m after reaching 26.82 m/s
t_2=d_2.*v.^-1 %time to get from 26.82 m to 8046 m
W=F*s

times_1=[linspace(0,t(1));linspace(0,t(2));linspace(0,t(3))]
times_2=[linspace(t(1),t_2(1));linspace(t(2),t_2(2));linspace(t(3),t_2(3))]

positions_1=[calculate_displacement(0,a,times_1)]
positions_2=[calculate_two_displacement(times_2-t,v)+positions_1(end)]
%plot (times_1(1,:), positions_1(1,:),times_1(2,:),positions_1(2,:), times_1(3,:), positions_1(3,:))
colors=['r','g','b'];
for i=1:3
    plot(times_1(i,:), positions_1(1,:),'color', colors(i))
    hold on
    plot(times_2(i,:),positions_2(i,:),'color',colors(i))
end

function displacement = calculate_displacement(v,a,t)
    displacement=v.*t+0.5*a.*t.^2;
end
function velocity = calculate_velocity(v,a,displacement)
    velocity = v.^2+2*a.*displacement;
end
function two_displacement = calculate_two_displacement(t,v)
    two_displacement = v.*t;
end
