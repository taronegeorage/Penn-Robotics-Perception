function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE

A = zeros(8, 9);
for i = 1:4
    A(2*i-1,1) = -1 * video_pts(i,1);
    A(2*i-1,2) = -1 * video_pts(i,2);
    A(2*i-1,3) = -1;
    A(2*i-1,7) = video_pts(i,1) * logo_pts(i, 1);
    A(2*i-1,8) = video_pts(i,2) * logo_pts(i, 1);
    A(2*i-1,9) = logo_pts(i, 1);
    A(2*i,4) = -1 * video_pts(i,1);
    A(2*i,5) = -1 * video_pts(i,2);
    A(2*i,6) = -1;
    A(2*i,7) = video_pts(i,1) * logo_pts(i, 2);
    A(2*i,8) = video_pts(i,2) * logo_pts(i, 2);
    A(2*i,9) = logo_pts(i, 2);
end
[U, S, V] = svd(A);

%H = V(:,end);
%H = reshape(H, [3,3]);

h = V(:,9);
H = [h(1) h(2) h(3);h(4) h(5) h(6);h(7) h(8) h(9)];

end

