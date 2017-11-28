function [t,p]=Normalize(t1,p1)
% Normalization of time series t1 and p1
% Translates the skeleton of p1 to the initial points of t1
    t=[];
    p=[];
    for k=1:size(t1,3)
        for n=1:size(t1,2)
        t(1:3,n,k)=t1(1:3,n,k);
        end
    end
    if min(size(t1,2),size(p1,2))==size(t1,2)
        for k=1:size(t1,3)
        for n=1:size(p1,2)
        p(1:3,n,k)=p1(1:3,n,k)+(t1(1:3,1,k)-p1(1:3,1,k));
        end
    end
    else
        for k=1:size(p1,3)
        for n=1:size(p1,2)
        p(1:3,n,k)=p1(1:3,n,k)+(t1(1:3,1,k)-p1(1:3,1,k));
        end
        end
    end