A1 = [ 0.47 0.12; -3.9 0.19];
A2 = [-0.03 0.78; 0.6 0.47];
% First Sigma
sig1 = [1 1 2 2 2 2 1 1 2 2 2 2 1 1 2];

x1 = zeros(2,16);

%Initialise the value
x1(1,1) = -1;
x1(2,1) = 1;

for i = 2:16
    if(sig1(i-1)==1)
        x1(:,i) = A1*x1(:,i-1);
    else
        x1(:,i) = A2*x1(:,i-1);
    end
end

t = 1:16;
figure
plot(t,x1(1,t))
grid on;
hold on
plot(t,x1(2,t))

% for the second set of values of sigma
sig2 = [1 1 1 2 2 1 1 1 2 2 1 1 1 2 2];
x2 = zeros(2,16);
x2(1,1) = -1;
x2(2,1) = 1;
for i = 2:16
    if(sig2(i-1)==1)
        x2(:,i) = A1*x2(:,i-1);
    else
        x2(:,i) = A2*x2(:,i-1);
    end
end

t = 1:16;
figure
plot(t,x2(1,t))
grid on;
hold on
plot(t,x2(2,t))
grid on;