% System matrices
A = [-2 -13 9; -5 -10 9; -10 -11 12];
B = [1; 4; 7];
C = [2.2225 -10.44 5.5944];

% Initial X
x_0 = [2; 5; 8];

% Time 
t = 0:100;

% probabilities 
probabs = 0.1:0.1:0.9;

figure;

% Iteratioin with different probabilities
for i = 1:length(probabs)
    p = probabs(i);

    % Generate random data loss signals for each probability
    k = rand(size(t)) > p;

    % Trajectory array 
    x = zeros(length(x_0), length(t));

    % Fill the values of trajectories
    % Initial Value
    x(:, 1) = x_0;
    for j = 2:length(t)
        if k(j - 1) == 0
            u = zeros(size(C, 1), 1); % Control input lost
        else
            u = C * x(:, j-1);
        end
        x(:, j) = A * x(:, j-1) + B * u;
    end

    % Plot the state trajectory in a subplot
    subplot(3, 3, i);
    plot(t, x(1, :), 'b', 'LineWidth', 2);
    xlabel('Time (t)');
    ylabel('x(t)');
    title(['p = ', num2str(p)]);
    grid on;
end

sgtitle('State Trajectories with Varying Data Loss Probability');
