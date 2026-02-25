P = phantom(256);

% FAN BEAM / RADIAL 
D = 600; 
dsensor = .25;
[F1,sensor_pos,fan_rot_angles] = fanbeam(P, D, 'FanSensorSpacing', dsensor);

% PROJECTION DATA FAN BEAM / RADIAL
imagesc(fan_rot_angles, sensor_pos, F1);
colormap(hot);
colorbar;
xlabel('Fan Rotation Angle (degrees)');
ylabel('Fan Sensor Position (degrees)');

% FAN BEAN / RADIAL RECONSTRUCTION IMAGE
output_size = max(size(P));
Ifan = ifanbeam(F1, D, 'FanSensorSpacing', dsensor, 'OutputSize',output_size);
figure;
imshow(Ifan);