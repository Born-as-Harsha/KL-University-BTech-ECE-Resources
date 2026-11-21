pkg load symbolic

syms a n z

X = z/(z+0.6);

y = (-0.6)^n * heaviside(n);

disp("Inverse Z-transform:")
disp(y)
