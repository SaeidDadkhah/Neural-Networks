import numpy as np

from learning.activation_function import ActivationFunction


class MLP:
    init_random = 1
    init_half_and_half = 2

    act_func_bin_sig = ActivationFunction.binary_sigmoid
    act_func_bip_sig = ActivationFunction.bipolar_sigmoid

    def __init__(self, layers, init_method, activation_function):
        self.__w = list()
        # Initialize weights
        for i in range(1, len(layers)):
            if init_method == MLP.init_random:
                self.__w.append(np.random.random((layers[i-1], layers[i])))
            elif init_method == MLP.init_half_and_half:
                if i == len(layers) - 1:
                    self.__w.append(-0.5 * np.ones((layers[i-1], layers[i])))
                else:
                    self.__w.append(0.5 * np.ones((layers[i-1], layers[i])))
        # Get activation functions
        self.__act_func, self.__act_func_der = ActivationFunction.get_functions(activation_function)

    def forward_propagation(self, x):
        return self.__forward_propagation(x, False)

    def __forward_propagation(self, x, ret_net_input=False):
        x = np.matrix(x)
        if ret_net_input:
            i = list()
        for layer in self.__w:
            a = np.dot(x, layer)
            if ret_net_input:
                i.append(a)
            x = self.__act_func(a)
        if ret_net_input:
            return x, i
        else:
            return x

    def back_propagation(self, x: np.matrix, y: np.matrix, learning_rate):
        m = y.shape[0]
        y_hat, i = self.__forward_propagation(x, True)
        delta = np.sum(np.multiply((y - y_hat), self.__act_func_der(i[-1])), axis=0) / m
        y_i = np.sum(self.__act_func(i[-2]), axis=0) / m
        self.__w[-1] += learning_rate * np.dot(y_i.T, delta)
        for index, _ in enumerate(self.__w):
            sigma = np.dot(delta, self.__w[-index-1].T)
            delta = np.sum(np.multiply(self.__act_func_der(i[-index-2]), sigma), axis=0) / m
            try:
                y_i = np.sum(self.__act_func(i[-index-3]), axis=0) / m
            except IndexError:
                y_i = np.sum(x, axis=0) / m
                self.__w[-index-2] += learning_rate * np.dot(y_i.T, delta)
                break
            self.__w[-index-2] += learning_rate * np.dot(y_i.T, delta)
