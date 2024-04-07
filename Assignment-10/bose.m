clear all;
clc;
A = [1.5,0;1,-1.5];
B = [1;0];

Control = ctrb(A, B);

rank_Control = rank(Control);
T = 11;
t = 1;

x = zeros(2,T);
x_initial = zeros(2,1);
input = zeros(1,10);
%x_0 = -10 + 20*rand(2, 1);

for k = 1:1000000
    u = -5 + 10*rand(T-1, 1);
    x_0 = -10 + 20*rand(2, 1);
    for i = 0:(T-1)    
        if (i==0)
            x(:,1) = x_0;
        else    
            x(:,i+1) = A*x(:,i) + B*u(i);
        end
    end
    if sum(sum(abs(x)>10, 2)) == 0
        fprintf('The Choice number is: %d\n', t);
        fprintf('Matrix u is:\n');
        disp(u);
        fprintf('Matrix x is:\n');
        disp(x);
        x_initial = horzcat(x_initial, x_0);
        x_initial_1 = x_initial(:, 2:end);
        input = [input; (u')];
        input_1 = input(2:end, :);
        t = t+1;
    end
end

mid = 0;
E1 = [1;1];
p = 0.5;
count = 0;
left = 0;
right = p;
max_iters = 0;

while (left<right)
    count = 0;
    mid = (left + right)/2;
    for k = 1:size(x_initial_1, 2) % 1 to no. of column of x_initial_1 (i.e. no. of valid choices)
        w = -mid + 2*mid*rand();
        for i = 0:(T-1)
            if (i==0)
                x_d(:,1) = x_initial_1(:,k);
            else    
                x_d(:,i+1) = A*x_d(:,i) + B*input_1(k,i) + E1*w;
            end
        end
        if sum(sum(abs(x_d)>10, 2)) == 0
            count = count + 1;
        end
    end
    if (count == size(x_initial_1, 2))
        left = mid + 0.001;
    else
        right = mid - 0.001;
    end
end

fprintf("The valid p for external disturbance %d \n",mid);

mid1 = 0;
p1 = 0.5;
count1 = 0;
left1 = 0;
right1 = p;

while (left1 < right1)
    count1 = 0;
    mid1 = (left1 + right1)/2;
    for k = 1:size(x_initial_1, 2) % 1 to no. of column of x_initial_1 (i.e. no. of valid choices)
        wp = -mid1 + 2*mid1*rand();
        for i = 0:(T-1)
            if (i==0)
                x_d1(:,1) = x_initial_1(:,k);
            else    
                x_d1(:,i+1) = [1.5+wp,0;1,-1.5]*x_d1(:,i) + B*input_1(k,i);
            end
        end
        if sum(sum(abs(x_d1)>10, 2)) == 0
            count1 = count1 + 1;
        end
    end
    if (count1 == size(x_initial_1, 2))
        left1 = mid1 + 0.0001;
    else
        right1 = mid1 - 0.0001;
    end
end
fprintf("The valid p for parametric disturbance is %d \n",mid1);

mid2 = 0;
p2 = 0.5;
count2 = 0;
left2 = 0;
right2 = p;

while (left2 < right2)
    count1 = 0;
    mid1 = (left2 + right2)/2;
    for k = 1:size(x_initial_1, 2) % 1 to no. of column of x_initial_1 (i.e. no. of valid choices)
        wp = -mid2 + 2*mid2*rand();
        for i = 0:(T-1)
            if (i==0)
                x_d2(:,1) = x_initial_1(:,k);
            else    
                x_d2(:,i+1) = [1.5+wp,0;1,-1.5]*x_d2(:,i) + B*input_1(k,i);
            end
        end
        if sum(sum(abs(x_d2)>10, 2)) == 0
            count2 = count2 + 1;
        end
    end
    if (count2 == size(x_initial_1, 2))
        left2 = mid1 + 0.0001;
    else
        right2 = mid1 - 0.0001;
    end
end
fprintf("The valid p for combined disturbance %d \n",mid2);