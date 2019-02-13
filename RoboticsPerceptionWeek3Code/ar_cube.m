function [proj_points, t, R] = ar_cube(H,render_points,K)
%% ar_cube
% Estimate your position and orientation with respect to a set of 4 points on the ground
% Inputs:
%    H - the computed homography from the corners in the image
%    render_points - size (N x 3) matrix of world points to project
%    K - size (3 x 3) calibration matrix for the camera
% Outputs: 
%    proj_points - size (N x 2) matrix of the projected points in pixel
%      coordinates
%    t - size (3 x 1) vector of the translation of the transformation
%    R - size (3 x 3) matrix of the rotation of the transformation
% Written by Stephen Phillips for the Coursera Robotics:Perception course

% YOUR CODE HERE: Extract the pose from the homography
if H(3,3)<0
    H = -H;
end

R_(:, 1) = H(:, 1);
R_(:, 2) = H(:, 2);
R_(:, 3) = cross(R_(:, 1), R_(:, 2));
[U, S, V] = svd(R_);
%D = [[1 0 0]; [0 1 0]; [0 0 det(U, V)]];
D = [[1 0 0]; [0 1 0]; [0 0 det(U*V')]];
R = U(:, 1:3) * D * V';
t = H(:, 3) / norm(H(:, 1));

% YOUR CODE HERE: Project the points using the pose
[n, m] = size(render_points);
proj_points = zeros(n, 2);
for point_idx = 1 : n
    %proj_points(point_idx) = K * [R t] * render_points(point_idx);
    
    result_vector = K *(R * [render_points(point_idx,1);render_points(point_idx,2);render_points(point_idx,3)]+t);
    proj_points(point_idx,1) = result_vector(1)/result_vector(3);
    proj_points(point_idx,2) = result_vector(2)/result_vector(3);
end


end
