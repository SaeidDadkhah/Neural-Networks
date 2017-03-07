function [w, error_train, error_test, epoch] = train_by_error(...
    learning, ...
    error, ...
    X, ...
    y, ...
    X_test, ...
    y_test, ...
    w)

error_train = sum((sign(X * w) - y) .^ 2) / size(X, 1);
error_test = sum((sign(X_test * w) - y_test ) .^ 2) / size(X, 1);
epoch = 0;

while(error_train(length(error_train)) > error)
    w = learning(X, y, w);
    
    error_train = [error_train, ...
        sum((sign(X * w) - y) .^ 2) / size(X, 1)];
    error_test = [error_test, ...
        sum((sign(X_test * w) - y_test) .^ 2) / size(X, 1)];
    
    epoch = epoch + 1;
end
