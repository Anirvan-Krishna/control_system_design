%system matrices
A = [-2, -13, 9;
     -5, -10, 9;
     -10, -11, 12];
B = [1;
    4;
    7];

K = [2.2225, -10.44, 5.5944];
 
% Initial condition
x_0 = [2;
       5;
       8];
  
% Data loss signal
k = [0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0];

% Initialize the trajectory matrix
x = zeros(3, 16);
x(:, 1) = x_0;

% Fill the trajectory based on data loss signal
for i = 1:15
    if k(i) == 0
        x(:, i+1) = A * x(:, i); % data lost no B and K
    else
        x(:, i+1) = A * x(:, i) + B * K * x(:,i); % Use the K matrix
    end
end

disp('Trajectory x(t):');
disp(x);


%Assign the individual State Variables
X_1 = x(1,:);
%disp(X_1);
X_2 = x(2,:);
%disp(X_2);
X_3 = x(3,:);
%disp(X_3);

 
t = 0:15;  % time steps
figure; 

subplot(3,1,1);
plot(t, X_1, 'DisplayName', 'X_1(t)');
xlabel('Time (t)');
ylabel('State Variable');
grid on;
title('X_1(t)');

subplot(3,1,2);
plot(t, X_2, 'DisplayName', 'X_2(t)');
xlabel('Time (t)');
ylabel('State Variable');
grid on;
title('X_2(t)');

subplot(3,1,3);
plot(t, X_3, 'DisplayName', 'X_3(t)'); 
grid on;
sgtitle('State Variables over Time');
title('X_3(t)');