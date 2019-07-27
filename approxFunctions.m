function output = approxFunction(xEval,xGrid,fGrid)

n = length(xGrid);
a = xGrid(1);
b = xGrid(n);
%matrix will store the data points by affine translations of chebyshev
%nodes
matrix = zeros(n,n);
cnt = 0;
while cnt<=n
    cnt = cnt + 1;
    if cnt == 1 || cnt == n
        pk = 2;
    end
    if cnt > 1 && cnt <n
        pk = 1;
    end
    matrix(1, cnt) = (2 * cos(pi * (0 * ((cnt-1)/(n-1))))/(2 * pk * (n-1)));
    matrix(n, cnt) = (2 * cos(pi * (n-1) * ((cnt-1)/(n-1))))/(2 * pk * (n-1));
end
for i = 2:n-1
    cnt = 0;
    while cnt<=n
        cnt = cnt + 1;
        if cnt == 1 || cnt == n
            pk = 2;
        end
        if cnt > 1 && cnt <n
            pk = 1;
        end
        matrix(i, cnt) = (2 * cos(pi * (i-1) * ((cnt-1)/(n-1))))/(pk * (n-1));
    end
end
i = 1;
j = 0;
%p_n is final interpolation matrix
p_n = zeros(n,1);
while i<=n
    sum = 0;
    j = 1;
    while j<=n
        sum = sum + matrix(i,j) * fGrid(j);
        j = j + 1;
    end
    p_n(i) = sum;
    i = i + 1;
end

%output is approximated function
m = length(xEval);
output = zeros(m,1);
i = 1;
while i<=m
    sum = 0;
    j = 1;
    while j<=n
        sum = sum + (p_n(j) * cos((j-1) * acos((2*xEval(i) - (b+a))/(b-a))));
        j = j + 1;
    end
    output(i) = sum;
    i = i + 1;
    
end
output = transpose(output);
end

