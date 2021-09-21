L = 400;
A = 0.3;
N = 2560;
h = L/N;
x = 0:h:(L-h);
% x = 0:h:(L-h);
hold off;
freq = 6;
u0 = A*heaviside(1/2 - abs(x-L/2)); %IC

c = 10000;
b = 11;
u0 = A*sech(c.*(x-L/2).^b);
% u0 = H((4/pi)*(sin(freq*abs(x)) + (1/3)*sin(3*freq*abs(x)) +(1/5)*sin(5*freq*abs(x)) + (1/7)*sin(7*freq*abs(x)) + (1/9)*sin(9*freq*abs(x))),x);
% u0 = H(square(abs(x),8), x);
tau = h^3/50; %time step

plot(x,u0);
axis([-L L    -0.5  0.6])
pause(2)
kk3=(2*pi/L)^3*[0:(N/2-1) -N/2:-1].^3;
kk1=(2*pi/L)*[0:(N/2-1) -N/2:-1];


u1 = u0 + 2i*ifft(sin(tau*kk3).*fft(u0))...
    -2i*tau*ifft(kk1.*fft((u0.^3)/3));

Tmax = 6000;
Y = [u0];
for ti=2:Tmax
     disp(ti)
    u = real(u0 + 2i*ifft(sin(tau*kk3).*fft(u1))...
    -2i*tau*ifft(kk1.*fft((u0.^3)/3)));
    u0=u1;
    u1=u;
    Y = [Y; u0];
    if rem(ti,5)==0
         plot(x,real(u)),drawnow
    end
end


[B,C] = meshgrid(x,1:Tmax);

h = surf(B,C,real(Y))
set(h,'LineStyle','none')
shg

function H = H(x, t)
     H=size(x);
     count = 0;
     disp(size(x))
%      for X = x
%          count = count + 1;
%          if t(count) < 1/2 && t(count) > -1/2
%             H(count) = X;
%          elseif X <= -1/2
%             H(count) = 0;
%          end
%      end
     for X = x
         count = count + 1;
         if X > 1/2
            H(count) = X;
         elseif X <= -1/2
            H(count) = 0;
         end
     end
end
