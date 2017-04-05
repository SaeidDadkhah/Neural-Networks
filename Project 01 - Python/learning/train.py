import numpy as np


def by_epoch(learn, predict, epoch, x, y, x_test, y_test, w):
    train_error = np.zeros((epoch, 1))
    test_error = np.zeros((epoch, 1))

    for i in range(0, epoch):
        w = learn(x, y, w)
        train_error[i] = np.sum(np.power(predict(x, w) - y, 2)) / x.shape[0]
        test_error[i] = np.sum(np.power(predict(x_test, w) - y_test, 2)) / x_test.shape[0]

    return w, train_error, test_error


def by_error(learn, predict, error, x, y, x_test, y_test, w):
    train_error = list()
    test_error = list()
    epoch = 0

    train_error.append(np.sum(np.power(predict(x, w) - y, 2)) / x.shape[0])
    test_error.append(np.sum(np.power(predict(x_test, w) - y_test, 2)) / x_test.shape[0])

    while train_error[-1] > error:
        w = learn(x, y, w)

        train_error.append(np.sum(np.power(predict(x, w) - y, 2)) / x.shape[0])
        test_error.append(np.sum(np.power(predict(x_test, w) - y_test, 2)) / x_test.shape[0])

        epoch += 1

    return w, train_error, test_error, epoch
