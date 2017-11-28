function data = ReadData(Path,Filename)
   
   filename2 = fullfile(Path,Filename);
   T = readtable(filename2,'FileType','text','Delimiter',',','ReadVariableNames',true);
   t = T(:,3:end);
   i = zeros(1,74);
   
   inx = 1;
   len = size(t,2);
   
   for k = 4:6:len
       i(inx)=k;
	   i(inx+1)=k+1;
	   i(inx+2)=k+2;
	   inx=inx+3;
   end
   i = i(:,1:end-1);
   t(:,i)=[];
   t= t(1:173,:);
   data = table2array(t);