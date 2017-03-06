function w = adaline_learning(X, y, w_init)

alpha = 0.001;

w = w_init;

for i = 1:(size(X, 1))
    w = w + alpha * (y(i) - X(i, :)*w) * X(i, :)';
end