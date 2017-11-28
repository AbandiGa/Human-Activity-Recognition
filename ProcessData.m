function t1 = ProcessData(t)
% process data for DTW input out from read data
temp = t';
nlay = 25;
[r,c] = size(temp);
out   = permute(reshape(temp',[c,r/nlay,nlay]),[2,1,3]);
t1 = out;