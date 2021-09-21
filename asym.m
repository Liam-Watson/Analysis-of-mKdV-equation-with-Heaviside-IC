L = 30;
X = -L:0.1:L;
x = (X);
A = 2;
Y = [A*heaviside(1/2-abs(x))];
Tau = 0:001:10;

for t = Tau(2:length(Tau))
%       I = sqrt(((2.*pi)./(abs(sqrt(x/3))*tau))).*...
%         ((A)./(2.*pi)).*(sin((tau.*sqrt(x/3)))./(tau.*(sqrt(x/3)))).*...
%         exp(1i.*tau.*((sqrt(x/3).^3)-sqrt(x/3).*x)+ 1i.*(pi/4).*sign(6.*(sqrt(x/3))-1)); 
        count = 0;
        for x = X
            count = count + 1;
%          I(count) = sqrt(((2.*pi)./((6*abs(sqrt(x/3))-1)*((t^(1/2)))))).*...
%         ((A)./(2.*pi)).*(sin(((t^(1/2)).*sqrt(x/3)))./((t^(1/2)).*(sqrt(x/3)))).*...
%         exp(1i.*(t^(1/2)).*((sqrt(x/3).^3)-sqrt(x/3).*x) - 1i.*(pi/4).*sign(6.*(sqrt(x/3))+1)) + ...
%           sqrt(((2.*pi)./(6*abs(-sqrt(x/3)-1)*((t^(1/2)))))).*...
%           ((A)./(2.*pi)).*(sin(((t^(1/2)).*-sqrt(x/3)))./((t^(1/2)).*(-sqrt(x/3)))).*...
%           exp(1i.*(t^(1/2)).*(((-sqrt(x/3)).^3)+sqrt(x/3).*x) - 1i.*(pi/4).*sign(6.*(-sqrt(x/3))-1));  
            z = sqrt(-x/3);
            z2 = -sqrt(-x/3);
            tau = t^(-1/2);
            I(count) = sqrt((2.*pi)/(abs(6.*z-1))*tau).*...
                (A/(2.*pi)).* (sin((tau.*z)./(2)))./(z).*...
                exp(1i.*tau.*((z.^3)-z.*-x) - 1i.*(pi/4).*sign(6.*z-1));%+...
               sqrt((2.*pi)/(abs(6.*z2-1)).*tau).*...
               (A/(2.*pi)).* (sin((tau*z2)./(2)))./(tau.*z2).*...
               exp(1i*tau*((z2.^3)-z2.*-x) - 1i.*(pi/4).*sign(6.*z2-1));
    
        end
   Y = [Y; I./A];
end

[B,C] = meshgrid(X,Tau);

h = surf(B,C,real(Y))
set(h,'LineStyle','none')
shg

