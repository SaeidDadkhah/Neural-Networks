import numpy as np


def learn(x, y, w, learning_rate):
    if learning_rate < 0:
        for sample, target in zip(x, y):
            learning_rate = float(1 / np.sqrt(np.dot(sample, sample.T)))
            y_hat = np.sign(np.dot(sample, w))
            w += learning_rate * float(target - y_hat) * sample.T
    else:
        for sample, target in zip(x, y):
            y_hat = np.sign(np.dot(sample, w))
            w += learning_rate * float(target - y_hat) * sample.T
    return w


def predict(x, w):
    return np.sign(np.dot(x, w))
