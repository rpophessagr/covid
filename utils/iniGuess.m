function [b0] = iniGuess(C)
%INIGUESS Initial guess for logistic regression
% calculate initial K, r, A using data from three equidistant points 
%
% Input:
%   C -- data
%
% Output:
%   b0 -- initial guess = [K r A]' or [] if calculation fails

    % old guess
     
   % return

    b0 = [];
    n = length(C);
    
     % calculate time interval for equidistant points: k-2*m, k-m, k    
    if mod(n,2) == 0
        k1 = 1;
        k3  = n-1;    
    else
        k1 = 1;
        k3 = n;
    end
    k2 = (k1 + k3)/2;
    m = k2 - k1 -1;

    % calculate time interval for equidistant points: k-2*m, k-m, k
%     m = floor(n/2);
%     if n <= 2*m
%         m = m -1;
%     end
%     k = n;
%     m = fix((k-1)/2)
%     
%     k-2*m
%     k-m
%     k
%     C(k1)
%     C(k2)
%     C(k)

    % calculate K, r, A ...
    
    %.. calculate K
    q = C(k2)^2 - C(k3)*C(k1);
    if q <= 0
        return
    end
    p = C(k1)*C(k2) - 2*C(k1)*C(k3) + C(k2)*C(k3);
    if p <= 0
        return
    end
    K = C(k2)*p/q;
    
    % ... calculate r
    r = log(C(k3)*(C(k2) - C(k1))/C(k1)/(C(k3) - C(k2)));
    if r < 0
        return
    end
    
    %... calculate A
    A = (C(k3) - C(k2))*(C(k2) - C(k1))/q*...
        (C(k3)*(C(k2) - C(k1))/C(k1)/(C(k3) - C(k2)))^((k3-m)/m);
   % A = (K/C(k3) - 1)*exp(r*k3);
    if A <= 0
        return
    end

    % this is initial guess
    b0 = [K r A]';

end
