function f = f(y1,y2,y3)
    f(1) = -0.013*y1-1000*y1*y2;
    f(2) = -2500*y2*y3;
    f(3) = -0.013*y1-1000*y1*y2-2500*y2*y3;
end