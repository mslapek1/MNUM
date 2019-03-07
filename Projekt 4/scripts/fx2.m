function [fx2] = fx2(x1,x2)
    fx2 = -x1 + x2*(0.9-(x1)^2-(x2)^2);
end