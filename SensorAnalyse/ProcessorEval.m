
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')
D = readtable('../Data/SensorTest/1_FullFlight.csv');


loopTime = zeros(length(D.Time)-1,1);
for i = 1:size(loopTime)
    loopTime(i)= D.Time(i+1)-D.Time(i);
end

setupTime = D.Time(1)*1000;
loopTime = loopTime./1000;
meanLoopTime = mean(loopTime);
varLoopTime = var(loopTime);
B = loopTime > 40;
longerThan40 = loopTime(B);
longerThan80 = find(loopTime>80);
maxLooptime = max(loopTime);

%% Prozessortime
figure('Name',"ProzessorEval",'NumberTitle','off')

subplot(2,1,1)
plot(D.Time, [loopTime ; 0]);


subplot(2,1,2)

histogram(loopTime);

