close all
clear all

plotsettings

%% Initialization Middlebury
path = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/mapping/middlebury/middlebury_';

%names = {'d1_g0_b10', 'd1_g1_b10', 'h_d1_b1', 'h_j_d1_b1', 'h_j_d1_g0_b10', 'j_d01_b1', 'j_d1_b1', 'h_j_d1_g0_b10_armijo'};
names = {'h_j_d1_g0_b1', 'h_j_d1_g0_b10', 'h_j_d1_g0_b100'};
labels = {'\beta = 1', '\beta = 10', '\beta = 100'};
%labels = {'d1 g0 b10', 'd1 g1 b10', 'h d1 b1', 'h j d1 b1', 'h j d1 g0 b10', 'j d01 b1', 'j d1 b1'};
fname = 'middlebury';
  
%% Initialization bag  
% path = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/mapping/bag_';
% names = {'close_g0', 'close_g100000', 'far_g0', 'far_g10000'};
% labels = {'Close','Close with \gamma','Far','Far with \gamma'};
% fname = 'bag';


%% Plotting
index_photometric = 2;
index_disparity = 4;
index_jacobian = 5;

figure(1); hold on; grid on;
figure(2); hold on; grid on;
figure(3); hold on; grid on;


for i = 1:length(names)
  fid = fopen(strcat(path, names{i}), 'r');
  [x, count] = fscanf(fid, '%e', [5, Inf]);
  figure(1)
  plot(x(1,:), x(index_photometric,:), '-','Color',colors{i}) 
  
  figure(3) 
  plot(x(1,:), x(index_jacobian,:), '-')
end

for i=1:length(names)
  fid = fopen(strcat(path, names{i}), 'r');
  [x, count] = fscanf(fid, '%e', [5, Inf]);
  figure(1) 
  plot(x(1,:), x(index_disparity,:), '--','Color',colors{i})
end

figure(1); hold on;
title('Photometric And Disparity Errors');
xlabel('Iteration'), ylabel('Error');
legend(labels);
% ch = get(gca,'children');
% labels2 = [{'Photometric Error','Disparity Error'},labels];
% legend([ch(end);ch(length(names));ch(end-length(names)+1:end)],labels2);
matlab2tikz([fname,'_photometric.tex'],'width','\linewidth');

figure(3); hold on;
title('Jacobian Norm');
xlabel('Iteration'), ylabel('Jacobian Norm');
legend(labels);
matlab2tikz([fname,'_jacobian.tex'],'width','\linewidth');
