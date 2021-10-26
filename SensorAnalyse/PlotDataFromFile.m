function [] = PlotDataFromFile(filenameOhneEndung)

%% load new Data

% data from file
[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude] = readvars(filenameOhneEndung + ".csv");
% calc loopTime
loopTime = zeros(length(time)-1,1);
for i = 1:size(loopTime)
    loopTime(i)= time(i+1)-time(i);
end

setupTime = time(1);
meanLoopTime = mean(loopTime);
varLoopTime = var(loopTime);

% calc integrated XYZ Speed from Accelerator

intX = size(loopTime);
intY = size(loopTime);
intZ = size(loopTime);

intX(1) = loopTime(1)*xAcc(1);

for i = 2:size(loopTime)
    intX(i) = intX(i-1)+loopTime(i)*xAcc(i);
    intY(i) = intY(i-1)+loopTime(i)*yAcc(i);
    intZ(i) = intZ(i-1)+loopTime(i)*zAcc(i);
end


%% Rotation
figure('Name',"Flight: "+filenameOhneEndung,'NumberTitle','off');
subplot(4,1,1);
title('Axis Position')
hold on
plot(time, sensYaw)
plot(time, sensPitch)
plot(time, sensRoll)
legend('Pitch','Roll','Yaw')
subplot(4,1,2);
title('Axis Acceleration')
hold on
plot(time, ZGyro)
plot(time, yGyro)
plot(time, xGyro)
legend('Pitch','Roll','Yaw')

%% Position


subplot(4,1,3);
title('Axis Acceleration Integrated')
hold on
plot(time, [intX, 0])
plot(time, [intY, 0])
plot(time, [intZ, 0])
legend('X','Y','Z')
subplot(5,1,4);
title('XYZ Acceleration')
hold on
plot(time, xAcc)
plot(time, yAcc)
plot(time, zAcc)
legend('X','Y','Z')
mean([xAcc , yAcc, zAcc])




end



