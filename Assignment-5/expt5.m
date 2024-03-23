%state space vector for X(0) to X(15)
% Without communication Loss
A = [-2, -13, 9;
     -5, -10, 9;
     -10, -11, 12];
 
B = [1; 
     4; 
     7];
 
X_0 = [2; 
       5;
       8];
 
K = [2.2225, -10.44, 5.5944];

%Empty state matrix
X = zeros(3,16);
 
% Initialise the Zero state
X(:,1) = X_0;
 
 
for t = 1:15
    u_t = K * X(:,t); %control input
    X(:,t+1) = A * X(:,t) + B * u_t; % X(t+1)
end

disp('X(t):')
disp(X);

%Assign the individual State Variables
X_1 = X(1,:);
%disp(X_1);
X_2 = X(2,:);
%disp(X_2);
X_3 = X(3,:);
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


% With Communication Loss

 

