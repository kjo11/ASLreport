close all
clear all
  
%% Initialization bag  
path1 = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/mapping/plane_b100/convergence';
path2 = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/mapping/plane_b1000/convergence';
path3 = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/mapping/plane_b1/convergence';


fid = fopen(strcat(path1), 'r');
[x1, ~] = fscanf(fid, '%e', [2, Inf]);
fid = fopen(strcat(path2), 'r');
[x2, ~] = fscanf(fid, '%e', [2, Inf]);
fid = fopen(strcat(path3), 'r');
[x3, ~] = fscanf(fid, '%e', [2, Inf]);

x1(1,:) = 1.3178 - x1(1,:);
x2(1,:) = 1.3178 - x2(1,:);
x3(1,:) = 1.3178 - x3(1,:);

fig = figure;
plot(x3(1,:), x3(2,:), 'o'); hold on;
plot(x1(1,:), x1(2,:), 'x') 
plot(x2(1,:), x2(2,:), '*') 
axis([-3, 9, 0, 35]);matlab2tikz('planetest.tex','width','\linewidth')
title('Convergence Study Plane Test');
ylims=get(gca,'ylim');
xlabel('Initialization z-offset from plane [m]'), ylabel('No. Iterations');
legend('\beta = 1','\beta = 100', '\beta = 1000','Camera frame location','Plane location','location','southeast')
matlab2tikz('planetest.tex','width','\textwidth')