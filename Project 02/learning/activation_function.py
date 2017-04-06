import numpy as np


class ActivationFunction:
    binary_sigmoid = 1
    bipolar_sigmoid = 2

    # Interface
    @staticmethod
    def get_functions(function):
        if function == ActivationFunction.binary_sigmoid:
            return ActivationFunction.__bin_sig, ActivationFunction.__bin_sig_der
        elif function == ActivationFunction.bipolar_sigmoid:
            return ActivationFunction.__bip_sig, ActivationFunction.__bip_sig_der

    # 1: Binary sigmoid
    @staticmethod
    def __bin_sig(x):
        return 1 / (1 + np.exp(-x))

    @staticmethod
    def __bin_sig_der(x):
        sig = ActivationFunction.__bin_sig(x)
        return np.multiply(sig, 1 - sig)

    # 2: Bipolar sigmoid
    @staticmethod
    def __bip_sig(x):
        return 2 / (1 + np.exp(-x)) - 1

    @staticmethod
    def __bip_sig_der(x):
        sig = ActivationFunction.__bip_sig(x)
        return np.multiply(1 + sig, 1 - sig) / 2
