pkg load symbolic

syms a n z

X = z/(z-a);

y = a^n * heaviside(n);

disp("Inverse Z-transform:")
disp(y)
