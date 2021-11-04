function [] = ProcessorEval(filenameOhneEndung)

% data from file
[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude,correctionPitch,CorrectionRoll,correctionYaw] = readvars(filenameOhneEndung + ".csv");
% calc loopTime
loopTime = zeros(length(time)-1,1);
for i = 1:size(loopTime)
    loopTime(i)= time(i+1)-time(i);
end

setupTime = time(1)*1000;
loopTime = loopTime./1000;
meanLoopTime = mean(loopTime);
varLoopTime = var(loopTime);
B = loopTime > 40;
longerThan40 = loopTime(B);
longerThan80 = find(loopTime>80);
maxLooptime = max(loopTime);

%% Prozessortime
figure('Name',"Data: "+filenameOhneEndung,'NumberTitle','off')

subplot(2,1,1)
plot(time, [loopTime ; 0]);


subplot(2,1,2)

histogram(loopTime);






end