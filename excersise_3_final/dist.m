function y = dist(x, drive)
    a = sin(pi/2*((drive+1)/101));
    k = 2*a/(1-a);
    y = ((1+k)*x)./(1+k*abs(x));
end