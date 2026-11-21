pkg load signal

numer = [2 -1];
denom = [1 -0.1 -0.02];

poles = roots(denom);
zeros = roots(numer);

zplane(numer, denom);
title("Pole-Zero Diagram");
grid on;
