from math import pi, sqrt


def rc_freq(R, C):
    """ Returns frequency of RC circuit in Hz """
    return 1 / (sqrt(2) * R * C)

def lc_freq(L, C):
    """ Returns frequency of LC circuit in Hz """
    return 1 / (2 * pi * sqrt(L * C))


def exp(n, pow):
    return n * 10 ** pow
