time = 0:0.01:1
L = 30
x = -L:0.1:L
xP = -L:0.1:L
A= 10

U = []
Y = []

for t = time
    count = 1;
    for X = x
        Air = (1/(3*t^(1/3)))*airy((x-xP)/(3*t^(1/3)));
        theta = heaviside(1/2 - abs(xP));
        u = A*Air;
        U(count) = trapz(u);
        count = count + 1;
    end
%     plot(x, U),drawnow;
    pause(0.1);
    Y = [Y; U];
end

[B,C] = meshgrid(x,time);
h = surf(B,C,Y)
set(h,'LineStyle','none')