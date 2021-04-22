
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


% Does the code run without error?
% If any error occurs, can you suggest a potential fix?
 % This code errors out in line 10 due to the use of an undefined variable
 % I would start by removing the % in front of the s_t declaration
 
% How understandable is the output of the code?
% Point out any parts you do not understand.
 % It would be nice to have the outputs be named without truncation.
 % Your in code comments do the job of clearing this up, but seeing words
 % in the workspace would clear up any confusion explicitly.
 % Along those lines, I wouldalso name the file something more descriptive.
 
% How readable is the code itself?
 % On a scale from 1 - 10, I give a solid 7.
 
% Say where formatting or commenting would make the code more readable
 % A comment block at the beginning of the file to describe the output of
 % the program would be a good addition.
 % Simply adding semi-colons to the end of the lines would help a lot.
 % I find my eyes being drawn to the syntax error flags. Extra spaces
 % around equal signs and operators would help smooth things out.
 
% How clearly do the code comments describe the problem it is trying to solve?
% Identify places that would benefit from a clearer comment.
 % The code coments are suitable, but most would not be needed if variables were
 % named explicitly.
 
% How clearly do the variable names relate to the concepts they concretize?
 % They could be more explicit.
 
% Point out any variables you don't recognize, and/or suggest better names.
 % s_t is the only unclear variable. I am not sure why those distances were
 % chosen.
 
% How well does the range of variables capture the problem described?
 % I am not sure where the data is coming from. For zero to 60 times, a
 % more valuable and interesting computation would come from horsepower
 % ratings.
 
% Identify extraneous regions that could be left out or important regions
% that should be included.
 % Time to travel 5 miles seems unimportant because it assumes acceleration
 % stops.
 
% How clearly do the visualizations show the solutions to the problem?
  % Visualizations were not porduced because of error in line 10.
 
% Say if there is extraneous whitespace or the co-domain or domain of the
% data should be changed or any other ways the visualizations could be more effective
 % More white space between function declarations could make code more
 % readable.
