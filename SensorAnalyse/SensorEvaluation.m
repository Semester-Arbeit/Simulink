

clc
close 



D = readtable("../Data/Pendel/YawInertiaPendel02.csv");
D.Time=D.Time-D.Time(1);
plot(D.Time,D.sensYaw)
hold on
plot(D.Time,D.ZGyro)
legend('pos','speed')
%plot(cumtrapz(detrend(D.xGyro)))
