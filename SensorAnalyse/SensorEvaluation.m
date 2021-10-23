%% load new Data
close all
clear 
clc


[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude] = readvars("YawRotationPositive.csv");

loopTime = zeros(length(time)-1,1);

for i = 1:size(loopTime)
    loopTime(i)= time(i+1)-time(i);
end

%% Prozessortime
setupTime = time(1);
meanLoopTime = mean(loopTime);
varLoopTime = var(loopTime);

%histogram(loopTime,0:20);
%plot(time, [loopTime ; 0]);

plot(time, sensYaw)
