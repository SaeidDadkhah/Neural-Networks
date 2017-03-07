function moon_visualization(X, y)

plot(X(y == 1, 2), X(y == 1, 3), 'r.')
hold on
plot(X(y == -1, 2), X(y == -1, 3), 'b.')
