function w = perceptron_learning(X, y, w_init)

w = w_init;

for i = 1:size(X, 1)
    alpha = 1 / sqrt((X(i, :)*X(i, :)'));
    y_hat =sign(X(i, :) * w);
    w = w + alpha .* (y(i) - y_hat) * X(i, :)';
end
