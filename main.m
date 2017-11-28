function main(file,mat_f1,mat_f2,mat_f3,mat_f4)

path = 'C:\Users\pgt6\Desktop\Final2\Data';% need to be changed
% read file and crop the fames to standard matrix
r_file = ReadData (path,file);
% normlize Height
n_file = NormlizeHeight(r_file);
% process data to change dim to 3d matrix 
p_file = ProcessData(n_file);
%find the min distance from p_file
[index , min_dist]= pipeline(p_file,mat_f1,mat_f2,mat_f3,mat_f4);
%normlize min_dist
min_dist = min_dist/1.0e+03 ;
switch index
    case 1
        similar=mat_f1;
		movement ='The movement is similar to : One Hand Cycle. The distance between your movement and the original movement is : ';
    case 2
        similar=mat_f2;
		movement ='The movement is similar to : Continious Rotation. The distance between your movement and the original movement is : ';
    case 3
        similar=mat_f3;
		movement = 'The movement is similar to : Moving Hand up and down. The distance between your movement and the original movement is : ';
    case 4
        similar=mat_f4;
		movement = 'The movement is similar to : Half Rotation Cycle. The distance between your movement and the original movement is : ';
end

disp('The distant is ');
d = num2str(min_dist)
f =  strcat(movement,d)
plotData(similar,p_file,f);

end




function [index , min_dist] = pipeline(p_file,mat_f1,mat_f2,mat_f3,mat_f4);

[ip1,op1] = Normalize(p_file,mat_f1);
[ip2,op2] = Normalize(p_file,mat_f2);
[ip3,op3] = Normalize(p_file,mat_f3);
[ip4,op4] = Normalize(p_file,mat_f4); 

Dist1 = multiJointDTW(ip1,op1);
Dist2 = multiJointDTW(ip2,op2);
Dist3 = multiJointDTW(ip3,op3);
Dist4 = multiJointDTW(ip4,op4); 

A = [Dist1,Dist2,Dist3,Dist4];

[min_dist,index] = min(A);

end