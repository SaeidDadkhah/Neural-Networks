[X, y] = moon_dataset(10, 6, 2, 1000);

w = rand(3, 1) - 0.5;
for i = 1:100
    w = adaline_learning(X, y, w);
end

y_hat = sign([ones(2000, 1), X] * w);
