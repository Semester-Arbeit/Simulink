

clc
close all 



D = readtable("../Data/SensorTest_18.11/FlightLog01.csv");
D.Time=D.Time-D.Time(1);


%% Pich Roll Yaw
f0 = figure;
f0.Position = [2,84,1769,893];
f0.Name = "Pitch"; subplot(311) 
hold on
legend()                                                        
                                                      
plot(D.Time,D.sensPitch,'DisplayName','sensPitch')
plot(D.Time,D.yGyro,'DisplayName','yGyro')
plot(D.Time,cumtrapz(D.yGyro)./100,'DisplayName','yGyro Integrated')



subplot(312)
hold on
plot(D.Time,-D.sensRoll,'DisplayName','sensRoll')
plot(D.Time,D.xGyro,'DisplayName','xGyro')
plot(D.Time,cumtrapz(D.xGyro)./100,'DisplayName','xGyro Integrated')


subplot(313)
hold on
plot(D.Time,D.sensYaw,'DisplayName','sensYaw')
plot(D.Time,D.ZGyro,'DisplayName','ZGyro')
plot(D.Time,cumtrapz(D.ZGyro)./100,'DisplayName','ZGyroIntegrated')





% 
% plot(D.Time,D.latitude,'DisplayName','latitude')
% plot(D.Time,D.longitude,'DisplayName','longitude')
% plot(D.Time,D.alt,'DisplayName','DisplayName')

legend()

% plot(D.Time,D.xAcc,'DisplayName','xAcc')
% plot(D.Time,D.yAcc,'DisplayName','yAcc')
% plot(D.Time,D.zAcc,'DisplayName','zAcc')