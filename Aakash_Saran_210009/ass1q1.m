% Define the parameters
density = 8050;    % Density of the sphere material
r = 0.00001;       % Radius of the sphere
m = (4/3) * pi * r^3 * density; % Mass of the sphere
g = 9.8;           % Acceleration due to gravity
mu = 0.001;        % Viscosity of the fluid

% Define the time interval
dt = 0.0001;
t = 0:dt:0.001;

% Initialize arrays for storing velocity values
u_analytical = zeros(size(t));
u_numerical = zeros(size(t));

% Analytical solution
u_analytical = (m * g) / (6 * pi * r * mu) * (1 - exp(-(6 * pi * r * mu * t) / m));

% Numerical solution using Euler's method
u_numerical(1) = 0;
for i = 2:length(t)
    u_numerical(i) = u_numerical(i - 1) + (((m * g) - (6 * pi * r * mu * u_numerical(i - 1))) / m) * dt;
end

% Plotting the results
plot(t, u_analytical, 'b-', t, u_numerical, 'r--');
xlabel('t');
ylabel('u');
legend('Analytical', 'Numerical');
