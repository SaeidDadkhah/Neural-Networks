function w = adaline_learning(X, y, w_init, learning_rate)

w = w_init;

for i = 1:(size(X, 1))
    w = w + learning_rate* (y(i) - X(i, :)*w) * X(i, :)';
end