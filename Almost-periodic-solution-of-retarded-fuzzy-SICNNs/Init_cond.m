function init = Init_cond(NUM)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
init = {};
init{end+1} = [ 0.05, 0.02,   0.1, 0.05, 0.09,  0.02,   0.1,  0.01, 0.09];
init{end+1} = [    0, 0.01,  0.30, 0.06, 0.04, 0.01,  0.04,  0.05, -0.03];
init{end+1} = [-0.02,-0.01, -0.02,    0,-0.02, 0.012, -0.05,     0, 0.11];
init{end+1} = [-0.06,-0.02, -0.05,-0.02, 0.05,  0.008, -0.06, -0.02, 0.07];
init{end+1} = [ -0.1,-0.018,  -0.1,-0.05,-0.09, -0.05, -0.1, -0.08, 0.02];

% if NUM ~= len(init)
%     fprintf("\n Check # of initial conditions \n")
% end
end

