%% load new Data
close all
clear 
clc

% data from file
[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude] = readvars("YawRotationPositive.csv");
% calc loopTime
loopTime = zeros(length(time)-1,1);
for i = 1:size(loopTime)
    loopTime(i)= time(i+1)-time(i);
end

% calc integrated XYZ Posotion from Accelerator

intX = size(loopTime);
intY = size(loopTime);
intZ = size(loopTime);

intX(1) = loopTime(1)*xAcc(1);

for i = 2:size(loopTime)
    intX(i) = intX(i-1)+loopTime(i)*xAcc(i);
    intY(i) = intY(i-1)+loopTime(i)*yAcc(i);
    intZ(i) = intZ(i-1)+loopTime(i)*zAcc(i);
end

%% Prozessortime
figure('Name','Prozessor Time','NumberTitle','off');
setupTime = time(1);
meanLoopTime = mean(loopTime);
varLoopTime = var(loopTime);

subplot (2,1,1)
histogram(loopTime,0:20);
subplot(2,1,2)
plot(time, [loopTime ; 0]);

%% Rotation
figure('Name','Rotation','NumberTitle','off');
subplot(2,1,1)
title('Position')
hold on
plot(time, sensYaw)
plot(time, sensPitch)
plot(time, sensRoll)
legend('Pitch','Roll','Yaw')
subplot(2,1,2)
title('Acceleration')
hold on
plot(time, ZGyro)
plot(time, yGyro)
plot(time, xGyro)
legend('Pitch','Roll','Yaw')

%% Position





figure('Name','Position','NumberTitle','off');
subplot(2,1,1)
title('Position Integrated From Acceleration')
hold on
plot(time, [intX, 0])
plot(time, [intY, 0])
plot(time, [intZ, 0])
legend('X','Y','Z')
subplot(2,1,2)
title('Acceleration')
hold on
plot(time, xAcc)
plot(time, yAcc)
plot(time, zAcc)
legend('X','Y','Z')
mean([xAcc , yAcc, zAcc])

