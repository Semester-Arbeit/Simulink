function [] = ProcessorEval(filenameOhneEndung)

% data from file
[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude] = readvars(filenameOhneEndung + ".csv");
% calc loopTime
loopTime = zeros(length(time)-1,1);
for i = 1:size(loopTime)
    loopTime(i)= time(i+1)-time(i);
end
filenameOhneEndung
setupTime = time(1);
meanLoopTime = mean(loopTime);
varLoopTime = var(loopTime);
B = loopTime > 40;
longerThan40 = loopTime(B);
longerThan80 = find(loopTime>80)

%% Prozessortime
figure('Name',"Data: "+filenameOhneEndung,'NumberTitle','off')
subplot(2,2,1)


histogram(loopTime,0:40);
subplot(2,2,2)
plot(time, [loopTime ; 0]);
subplot(2,2,3)






end