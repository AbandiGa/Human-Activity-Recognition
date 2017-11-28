function Dist = multiJointDTW(t,p)
% SINGLEJOINTDTW calculates DTW disntance for multiple joints
% INPUT:
% t is the vector you are testing against (K x N x J matrix)
% r is the vector you are testing (K x M x J matrix), where K is the number 
% of dimensions per joint, N, M are the length of the sequences
% respectively, and J is the number of joints.
% OUTPUT:
% Dist is total distance between t and r, over all joints, calculated as the
% weighted sum of DTW distances of each joint.

numJoints = size(t,3);

% Joint weights. Weights of joints that should not be
% considered can be set to 0.
jointWeights = zeros(1,numJoints);

% Set weights
jointWeights(9) = 1; % ElbowRight
jointWeights(10) = 1; % hand Right
jointWeights(6) = 1; % Elbowleft
jointWeights(7) = 1; % handleft

Dist = 0;
for i=1:numJoints
    if jointWeights(i) ~= 0
        Dist = Dist + mDTW(t(:,:,i),p(:,:,i))*jointWeights(i);
    end
end