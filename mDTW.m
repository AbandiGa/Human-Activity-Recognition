function [Dist,D,w]=mDTW(t,p)
% mDTW calculates Multidimensional DTW disntance between two
% sequences t and p.
% INPUT:
% t is the vector you are testing against (K x N matrix)
% p is the vector you are testing (K x M matrix), where K is the number of 
% dimensions, and N, M are the length of the sequences respectively
% OUTPUT:
% Dist is unnormalized distance between t and r
% D is the accumulated distance matrix
% w is the optimal path

K=size(t,1);
N=size(t,2);
M=size(p,2);

for k=1:K
    % Normalize each dimension of t and p separately to a zero mean and 
    % unit variance.
    tt = t(k,:);
    pp = p(k,:);
    t(k,:) = (tt-mean(tt))/std(tt);
    p(k,:) = (pp-mean(pp))/std(pp);
end

% Calculate euclidian distance between every 
% combination of points in t and p. 
d=zeros(N,M);
for n=1:N
    for m=1:M
        for k=1:K
            d(n,m) = d(n,m) + sqrt((t(k,n)-p(k,m)).^2);
        end
    end
end


D=zeros(size(d));
D(1,1)=d(1,1);

% Calculate optimal DTW distance
for n=2:N
    D(n,1)=d(n,1)+D(n-1,1);
end
for m=2:M
    D(1,m)=d(1,m)+D(1,m-1);
end
for n=2:N
    for m=2:M
        D(n,m)=d(n,m)+ ...
            min([D(n-1,m),D(n-1,m-1),D(n,m-1)]);
    end
end

% Calcualte optimal DTW warp path
Dist=D(N,M);
n=N;
m=M;
w=[];
w(1,:)=[N,M];
while ((n+m)~=2)
    if (n-1)==0
        m=m-1;
    elseif (m-1)==0
        n=n-1;
    else
        [values,number]=min([D(n-1,m), ...
            D(n,m-1),D(n-1,m-1)]);
        switch number
            case 1
                n=n-1;
            case 2
                m=m-1;
            case 3
                n=n-1;
                m=m-1;
        end
    end
    w=cat(1,w,[n,m]);
end