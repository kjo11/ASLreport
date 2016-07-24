close all
clear all

%% Initialization
path = "/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/localization_plane/";
name = "camera_x_weights_blur.csv";
name_resolution = "max_resolution.csv";
%name = "camera_x_blur.csv";

dimension = 1; %1 for x, 2 for y, 3 for z.
num_deltas = 8;
iterations_to_consider=11;

%% Plotting
fid = fopen(strcat(path, name), 'r');
[x, count] = fscanf(fid, '%e', [7, Inf]);
fid = fopen(strcat(path, name_resolution), 'r');
[y, count] = fscanf(fid, '%e');
max_resolution = [y(1), y(1), -y(2)];

zero_indices = find(x(1,:)==0);

CM = jet(num_deltas);

 
figure; hold on;
title('Plane localization convergence')
xlabel('iteration i'), ylabel('error in mm')
for i = 1:num_deltas-1
  von = zero_indices(i);
  bis = von + iterations_to_consider - 1;
%  von = (i- 1) * iterations_total + 1;
%  bis = von + iterations_to_consider - 1;
  plot([0,1+x(1,von:bis)],[-x(1+dimension,von),x(4 + dimension,von:bis)], 'color',CM(i,:));
end
plot([0,1+x(1, von:bis)], max_resolution(dimension), 'linestyle', '--');



   