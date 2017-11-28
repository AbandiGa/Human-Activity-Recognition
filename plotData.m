function plotData(t1,t2,movement)

X = permute(t1,[1 3 2]);
X = reshape(X,[],size(t1,2),1);
X=X';
Y = permute(t2,[1 3 2]);
Y = reshape(Y,[],size(t2,2),1);

Y = Y';

figure(1);
%mTextBox = uicontrol('style','text');
%set(mTextBox,'String',movement);
%hold on 

subplot(2,2,[1 2]);
plot(X,'color','r','marker','+');
title('The Origninal Movement');
subplot(2,2,[3 4]);
plot(Y,'color','b','marker','+');
title('Your Movement');
suptitle(movement);
