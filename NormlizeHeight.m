function t1 = NormlizeHeight(t)
%figure;
%plot(t,'color','r','marker','+');
height = (1.5);
head = t(1,11);
foot = t(1,47);
dif = head - foot;
dist = sqrt(power(dif,2));
factor = 1.5 - dist;
t1= t-factor;
