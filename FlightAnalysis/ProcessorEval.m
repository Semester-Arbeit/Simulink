close all
%warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')
D = readtable('FlightLog.csv');
D.Time=D.Time- D.Time(1);
D.time=D.Time./1000;

loopTime = zeros(length(D.Time),1);
for i = 1:size(loopTime)-1
    loopTime(i)= D.Time(i+1)-D.Time(i);
end
loopTime(end)=0;
setupTime = D.Time(1)*1000000;
loopTime = loopTime./1000000;
meanLoopTime = mean(loopTime);
varLoopTime = var(loopTime);
B = loopTime > 40;
longerThan40 = loopTime(B);
longerThan80 = find(loopTime>80);
maxLooptime = max(loopTime);

%% Prozessortime
figure('Name',"ProzessorEval",'NumberTitle','off')

subplot(2,1,1)
plot(D.Time, loopTime);


subplot(2,1,2)

histogram(loopTime, [0.01:0.001:0.05]);

