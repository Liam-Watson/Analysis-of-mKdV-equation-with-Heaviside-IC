clc
clear all;

% L = sym(30)
% % x = -L:L
% % xP = -L:L
% x = 1
% t = 1
% syms xP Ai(xP) theta(xP) x t L 
% % x = sym(-L:L);
% % t = sym(1)
% Ai(xP) = (1/(3*nthroot(t,3)))*(airy((x-xP)/(3*(nthroot(t,3)))))
% theta(xP) = heaviside(1/2 - abs(xP))
% u = theta(xP)
% inte = int(u,-inf,inf)
% % plot(xP, inte)

syms x xP t n u(x,t) theta(x,t) Air(x,t) inte(x,t)
% Ai(x) = (1/3*(t)^(1/3))*airy((x-x)/(3*(t)^(1/3)));
% Ai(x) = (1/3)*airy((x-xP)/(3))
% theta(x) = heaviside(1/2 - abs(x))
% u(x) = theta(x)*Ai(x)
% assume(t >= 0)
% n = 2
% inte(x,t) = int((u(xP)), xP, -inf, inf)


Air(x,t, xP) = (1/(3*(t)^(1/3)))*airy((x-xP)/(3*(t)^(1/3)));
% Air(x,t) = (1/3)*(airy((x-xP)/(3)))
% theta(x,t, xP) = heaviside(1/2 - abs(x));
% theta(x,t,xP) = A
A = 10;
u = A*(Air(x,t, xP));
inte(x,t, xP) = int(u, xP);
x = -30:0.1:30;    
XP = -30:0.1:30;
time = 0.001:0.001:0.002;
% plot(x, A*heaviside(1/2 - abs(x))), drawnow
Y = [A*heaviside(1/2-abs(x))];
for t = time(2:length(time))
    hold on
     U = [];
     count = 0;
     disp(t)
    for X = x
        
       
%         for xP = XP
               %     disp(inte(x,t));
%             disp(t)
%               disp(inte(X,t,xP));
%               disp(X)
%               disp(xP)
%               disp(t)
              count = count +1;
%               if(heaviside(1/2-abs(xP)))
                 U(count) = inte(X,t,1/2) - inte(X,t,-1/2); 
%               else
%                   U(count)= 0;
%               end
        %     fplot(inte(x,t), [-3, 3, -3, 3])
%             plot(inte(x,t, xP))
    %         fplot(inte(x,t, xP),[-30,30]), drawnow
%             pause(0.01) 
%         end

%         disp(U)
%         disp(t)
    end
    Y = [Y;U];
%             plot(x,U)
%         pause(1), drawnow
%     hold off

end

[B, C] = meshgrid(x, time)
% figure
h = surf(B,C,Y)
set(h,'LineStyle','none')
% shg
