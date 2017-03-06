function moon_visualization(X, y)

plot(X(y == 1, 1), X(y == 1, 2), 'r.')
hold on
plot(X(y == -1, 1), X(y == -1, 2), 'b.')
