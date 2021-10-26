function [] = PlotTableFromFile(filenameOhneEndung)


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
B = loopTime > 40;
longerThan40 = loopTime(B);


%Display
figure('Name',"Data: "+filenameOhneEndung,'NumberTitle','off')



T = table(setupTime,meanLoopTime,varLoopTime,length(longerThan40));

uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
    'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);


end