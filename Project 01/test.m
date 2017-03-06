[X, y] = moon_dataset(10, 6, 6, 1000);

X = [ones(2000, 1), X];
w = rand(3, 1) - 0.5;
w = train_by_epoch(@perceptron_learning, 100, X, y, w);

y_hat = sign(X * w);

moon_visualization(X, y)
hold on
plot(x1, line_weights(w, x1))
