function [xgrid, fgrid] = discreteData(nGrid, a, b, f)
xgrid = zeros(1,nGrid);
fgrid = zeros(1,nGrid);
i = 1;
while i <= nGrid
    xgrid(i) = ((b+a)/2) + ((b-a)/2)*(cos(pi*((i-1)/(nGrid-1))));
    fgrid(i) = f(xgrid(i));
    i = i + 1;
end
end