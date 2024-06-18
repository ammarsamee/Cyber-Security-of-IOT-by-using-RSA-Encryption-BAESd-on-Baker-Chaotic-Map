N = 5000; % number of points
q = 2; % number of subdivisions

% initial condition
x = rand(1,N);
y = rand(1,N);

% baker's map
X = zeros(2,N);
for i = 1:N
    if y(i) < 0.5
        X(1,i) = 2*x(i);
        X(2,i) = y(i)/2;
    else
        X(1,i) = 2*x(i)-1;
        X(2,i) = (y(i)+1)/2;
    end
end

% plot the result
figure;
plot(X(1,:), X(2,:), ".");
axis equal;
xlabel('X Axis');
ylabel('Y Axis');