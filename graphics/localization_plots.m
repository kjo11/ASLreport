close all
clear all

plotsettings

%% Initialization
path = '/home/kiki/ASL_ROS/new_code/stereo_camera_reconstruction/results/localization_plane/';

dimensions = ['x','y','z'];
for i = 1:3
    
name_stereo = ['stereo_',dimensions(i),'_weights_blur.csv'];
name = ['camera_',dimensions(i),'_weights_blur.csv'];


iterations_to_consider=11;

%% Plotting
fid = fopen(strcat(path, name), 'r');
[x, ~] = fscanf(fid, '%e', [7, Inf]);
fclose(fid);
fid = fopen(strcat(path, name_stereo), 'r');
[y, ~] = fscanf(fid, '%e', [7, Inf]);
y = y(:, 2:end);
fclose(fid);

zero_indices = find(x(1,:)==0);
num_deltas = 8;

zero_indices_st = find(y(1,:)==0);
num_deltas_st = length(zero_indices_st);

%CM = jet(num_deltas);

figure(i); hold on; grid on;
title('Plane Localization Convergence')
xlabel('Iteration'), ylabel(['Error in ',dimensions(i),' [mm]'])
for j = 2:2:num_deltas
  von = zero_indices(j);
  bis = von + iterations_to_consider - 1;
%  von = (i- 1) * iterations_total + 1;
%  bis = von + iterations_to_consider - 1;
  plot([0,1+x(1,von:bis)],[-x(1+i,von),x(4 +i,von:bis)],'Color',colors{1}); %'color',CM(j,:));
end

for j = 1:num_deltas_st
  von = zero_indices_st(j);
  bis = von + iterations_to_consider - 1;
%  von = (i- 1) * iterations_total + 1;
%  bis = von + iterations_to_consider - 1;
  plot([0,1+y(1,von:bis)],[-y(1+i,von),y(4 +i,von:bis)],'--','Color',colors{2}); %'color',CM(j,:));
end
xlim([0 iterations_to_consider])
ch = get(gca,'Children');
set(gca,'Children',[ch(1:num_deltas_st-1); ch(num_deltas_st+1:end-1); ch(num_deltas_st); ch(end)])
if (i==1)
    legend('Camera frame','Stereo frame')
end
matlab2tikz(['localization_,',dimensions(i),'.tex'],'width','\linewidth');
end
