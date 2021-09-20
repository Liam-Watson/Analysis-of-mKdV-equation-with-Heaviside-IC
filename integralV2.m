time = 0:0.1:10
L = 30
x = -L:L
xP = -L:L


U = []

for t = time
    count = 1
    for X = x
        Air = (1/3*t^(1/3))*airy((x-xP)/(3*t^(1/3)));
        theta = heaviside(1/2 - abs(xP));
        u = theta.*Air;
        U(count) = trapz(xP, u);
        count = count + 1;
    end
    plot(x, U),drawnow;
    pause(0.1);
    U = [];
end