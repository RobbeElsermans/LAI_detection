function [x_accel, y_accel, z_accel] = CalcAccel(all_accel_data)

maxXAccelerations = 0;
meanXAccelerations = 0;
maxYAccelerations = 0;
meanYAccelerations = 0;
maxZAccelerations = 0;
meanZAccelerations = 0;

% Extract accelerations in X, Y, and Z directions
xAccelerations = zeros(length(all_accel_data), 1);
yAccelerations = zeros(length(all_accel_data), 1);
zAccelerations = zeros(length(all_accel_data), 1);

for i = 1:length(all_accel_data)
    xAccelerations(i) = abs(all_accel_data{i}.LinearAcceleration.X);
    yAccelerations(i) = abs(all_accel_data{i}.LinearAcceleration.Y);
    zAccelerations(i) = abs(all_accel_data{i}.LinearAcceleration.Z);
end

% Calculate max and mean of accelerations in X, Y, and Z directions
if ~isempty(xAccelerations)
    maxXAccelerations = max(xAccelerations);
    meanXAccelerations = mean(xAccelerations, 'omitnan');
end

if ~isempty(yAccelerations)
    maxYAccelerations = max(yAccelerations);
    meanYAccelerations = mean(yAccelerations, 'omitnan');
end

if ~isempty(zAccelerations)
    maxZAccelerations = max(zAccelerations);
    meanZAccelerations = mean(zAccelerations, 'omitnan');
end

x_accel = [maxZAccelerations, meanZAccelerations];
y_accel = [maxYAccelerations, meanYAccelerations];
z_accel = [maxXAccelerations, meanXAccelerations];

end