L = 30;
X = -L:0.1:L;
x = (X);
Y = [];
Tau = 0:0.1:1;
A = 10;
for t = Tau
%    for x = X
%       I = sqrt(((2.*pi)./(abs(sqrt(x/3))*tau))).*...
%         ((A)./(2.*pi)).*(sin((tau.*sqrt(x/3)))./(tau.*(sqrt(x/3)))).*...
%         exp(1i.*tau.*((sqrt(x/3).^3)-sqrt(x/3).*x)+ 1i.*(pi/4).*sign(6.*(sqrt(x/3))-1)); 
        count = 0
        for x = X
            count = count + 1;
%                     if()
                   I(count) = sqrt(((2.*pi)./((6*abs(sqrt(x/3))-1)*((t^(1/2)))))).*...
        ((A)./(2.*pi)).*(sin(((t^(1/2)).*sqrt(x/3)))./((t^(1/2)).*(sqrt(x/3)))).*...
        exp(1i.*(t^(1/2)).*((sqrt(x/3).^3)-sqrt(x/3).*x)+ 1i.*(pi/4).*sign(6.*(sqrt(x/3))-1));
          sqrt(((2.*pi)./(6*abs(-sqrt(x/3)-1)*((t^(1/2)))))).*...
          ((A)./(2.*pi)).*(sin(((t^(1/2)).*-sqrt(x/3)))./((t^(1/2)).*(-sqrt(x/3)))).*...
          exp(1i.*(t^(1/2)).*((-sqrt(x/3).^3)+sqrt(x/3).*x)+ 1i.*(pi/4).*sign(6.*(-sqrt(x/3))-1));  
            
            
%         else
%            I(count) = 0;
%         end
            
        end

%    end
   Y = [Y; I];
end

[B,C] = meshgrid(X,Tau);

h = surf(B,C,real(Y))
set(h,'LineStyle','none')
shg

