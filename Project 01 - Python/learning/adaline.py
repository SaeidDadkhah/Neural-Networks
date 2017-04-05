import numpy as np


def learn(x, y, w, learning_rate):
    for sample, target in zip(x, y):
        y_hat = np.dot(sample, w)
        w += learning_rate * float(target - y_hat) * sample.T
    return w


def predict(x, w):
    return np.dot(x, w)
