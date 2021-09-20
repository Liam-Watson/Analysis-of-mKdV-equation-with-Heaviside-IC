L = 100; %Overall simulation interval
N = 2000; %Number of space subdivisions
h = L/N; %Size of mesh spacing
x = [0:h:(L-h)]; %Space mesh
tau = h^2/3; %Time step

u0 = A*H(1/2 - abs(x),L)
u = u0;
time = 10000

for ti=1:time
    u(3:N-2)= -2*tau*(u(2:N).^2)./(h^2).*(u(1:N-1) -2*u(2:N) + u(3:N+1))...
        -(tau/(h^3))*(u(4:N+2)-2*u(1:N) -2*u(1:N) - u(0:N-2)) + u(1:N)
    u(1) = -2*tau*(u(2:N).^2)./(h^2).*(u(1:N-1) -2*u(2:N) + u(3:N+1))...
        -(tau/(h^3))*(u(4:N+2)-2*u(1:N) -2*u(1:N) - u(0:N-2)) + u(1:N)
    u(2) = 
    u(N) =
    u(N-1) =  
    
end



function H = H(x,L)
    H=size(x);
    
    count = 0;
    for X = x
        disp(X)
        count = count + 1;
        if X < -10 && X > -11   
            H(count) = 1;
        elseif X < -15
                H(count) = 0;
        else
            H(count) = 0;
        end
    end
    

end