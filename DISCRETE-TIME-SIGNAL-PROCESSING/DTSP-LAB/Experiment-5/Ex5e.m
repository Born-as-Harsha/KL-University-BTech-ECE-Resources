pkg load signal

numer = [1];
denom = [1 -0.9];

poles = roots(denom);
zeros = roots(numer);

zplane(numer, denom);
title("Pole-Zero Diagram");
grid on;
