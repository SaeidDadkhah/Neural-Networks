function w = perceptron_learning(X, y, w_init, learning_rate)

w = w_init;

if learning_rate < 0
    for i = 1:size(X, 1)
        alpha = 1 / sqrt((X(i, :)*X(i, :)'));
        y_hat =sign(X(i, :) * w);
        w = w + alpha .* (y(i) - y_hat) * X(i, :)';
    end
else
    for i = 1:size(X, 1)
        %alpha = 1 / sqrt((X(i, :)*X(i, :)'));
        y_hat =sign(X(i, :) * w);
        w = w + learning_rate .* (y(i) - y_hat) * X(i, :)';
    end
end