% Extended Euclidean Algorithm
function [g, x, y] = gcdExtended(a, b)
    if a == 0
        g = b;
        x = 0;
        y = 1;
    else
        [g, x1, y1] = gcdExtended(mod(b, a), a);
        x = y1 - floor(b / a) * x1;
        y = x1;
    end
end