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

fig = figure;
plot(x3(1,:), x3(2,:), 'o'); hold on;
plot(x2(1,:), x2(2,:), 'x') 
plot(x1(1,:), x1(2,:), '*') 
axis([-9, 5, 0, 35]);
title('Convergence Study Plane Test');
ylims=get(gca,'ylim');
plot([3.0,3.0],ylims)
plot([1.3178,1.3178],ylims)
xlabel('Initialization [m]'), ylabel('No. Iterations');
legend('b=1','b = 100', 'b = 1000','Camera location','Plane location','location','southwest')%,'orientation','horizontal');
saveas(fig, '../presentation/src/figures/plane_convergence.png');

matlab2tikz('planetest.tex','width','\linewidth')