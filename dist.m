function dist_mat  = dist(file1, file2, file3, file4,mat_f1,mat_f2,mat_f3,mat_f4)

% Note: Normlize hiegt and process data before calling this function 

%to save the dist matrix
dist_mat = zeros(4,4)

%cell array for files
f = cell(4,1)
f{1}=file1;
f{2}=file2;
f{3}=file3;
f{4}=file4;

for i = 1:4

 A = pipeline(f{i},mat_f1,mat_f2,mat_f3,mat_f4);   
 dist_mat(:,i)=A;

end

dist_mat

end

function A = pipeline(p_file,mat_f1,mat_f2,mat_f3,mat_f4);

[ip1,op1] = Normalize(p_file,mat_f1);
[ip2,op2] = Normalize(p_file,mat_f2);
[ip3,op3] = Normalize(p_file,mat_f3);
[ip4,op4] = Normalize(p_file,mat_f4); 

Dist1 = multiJointDTW(ip1,op1);
Dist2 = multiJointDTW(ip2,op2);
Dist3 = multiJointDTW(ip3,op3);
Dist4 = multiJointDTW(ip4,op4); 

A = [Dist1,Dist2,Dist3,Dist4];

end

