function [fx1] = fx1(x1, x2)
    fx1 = x2 + x1*(0.9-(x1)^2-(x2)^2);
end