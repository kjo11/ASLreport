close all
clear all

plotsettings

%% Initialization Middlebury
%path = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/mapping/middlebury_';
%
%%names = {'d1_g0_b10', 'd1_g1_b10', 'h_d1_b1', 'h_j_d1_b1', 'h_j_d1_g0_b10', 'j_d01_b1', 'j_d1_b1', 'h_j_d1_g0_b10_armijo'};
%names = {'h_j_d1_g0_b1', 'h_j_d1_g0_b10', 'h_j_d1_g0_b100', 'h_j_d1_g0_b10_armijo'};
%labels = {'h_j_d1_g0_b1', 'h_j_d1_g0_b10', 'h_j_d1_g0_b100', 'h_j_d1_g0_b10_armijo'};
%%labels = {'d1 g0 b10', 'd1 g1 b10', 'h d1 b1', 'h j d1 b1', 'h j d1 g0 b10', 'j d01 b1', 'j d1 b1'};
index_photometric = 2;
index_disparity = 4;
index_jacobian = 5;
  
%% Initialization bag  
path = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/mapping/bag_';
names = {'close_g0', 'close_g100000', 'medium_g0', 'medium_g100000', 'far_g0', 'far_g10000', 'far_g100000'};
labels = names;

figure(1); hold on;
figure(2); hold on;
figure(3); hold on;

CM = jet(length(names));

%% Plotting
for i = 1:length(names)
  fid = fopen(strcat(path, names{i}), 'r');
  [x, count] = fscanf(fid, '%e', [5, Inf]);
  figure(1)
  plot(x(1,:), x(index_photometric,:), 'color', CM(i,:), 'linestyle', '-') 
  figure(2) 
  plot(x(1,:), x(index_disparity,:), 'color', CM(i,:), 'linestyle', '-')
  figure(3) 
  plot(x(1,:), x(index_jacobian,:), 'color', CM(i,:), 'linestyle', '-')
end

figure(1); hold on;
title('Photometric error');
xlabel('iteration #'), ylabel('error');
legend(labels);
figure(2); hold on;
title('Disparity error');
xlabel('iteration #'), ylabel('error');
legend(labels);
figure(3); hold on;
title('Jacobian norm');
xlabel('iteration #'), ylabel('Jacobian norm');
legend(labels);