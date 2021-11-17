
%close all
clc
close 

%PlotDataFromFile("YawRotationPositive")
%ProcessorEval("NeuStdandart2_Nov")

D = readtable("YawRotationPositive.csv");
D.Time=D.Time-D.Time(1);
plot(D.Time,D.sensYaw)
hold on
plot(D.Time,D.ZGyro)
legend('pos','speed')
%plot(cumtrapz(detrend(D.xGyro)))
