L = 30;
A = 0.3;
N = 256000;
h = L/N;
x = -L:h:(L-h);
% x = 0:h:(L-h);
hold off;
u0 = A*H(1/2 - abs(x)); %IC
% u0=6*A*sech((x-L/3)).^2;
tau = h^3/20; %time step

plot(x,u0);
axis([-L L    -0.5  0.6])
pause(2)
kk3=(2*pi/L)^3*[0:(N-1) -N:-1].^3;
kk1=(2*pi/L)*[0:(N-1) -N:-1];


u1 = u0 + 2i*ifft(sin(tau*kk3).*fft(u0))...
    -2i*tau*ifft(kk1.*fft((u0.^3)/3));

Tmax = 2000000;

for ti=2:Tmax
    u = real(u0 + 2i*ifft(sin(tau*kk3).*fft(u1))...
    -2i*tau*ifft(kk1.*fft((u0.^3)/3)));
    u0=u1;
    u1=u;
    if rem(ti,50)==0
        plot(x,real(u)),drawnow
    end
end


function H = H(x)
     H=size(x);
     count = 0;
     for X = x
         count = count + 1;
         if X > 0
            H(count) = 1;
         elseif X <= 0
            H(count) = 0;
         end
     end
end
