function y = perceptron_output(X, w)

y = 2* heaviside(X * w) - 1;