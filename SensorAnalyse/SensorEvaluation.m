

clc
%close all 



D = readtable("../Data/25_nov/FlightLog2.csv");

D.Time=D.Time-D.Time(1);

% figure
% subplot(211)
% plot(P.x5V)
% subplot(212)
% plot(P.x12V)

%% Pich Roll Yaw
f0 = figure;
f0.Position = [2,84,1769,893];
f0.Name = "Sensor Analyse"; subplot(311) 
hold on
legend()                                                        
                                                      
plot(D.Time,D.Pitch,'DisplayName','Pitch')
plot(D.Time,D.yGyro,'DisplayName','yGyro')
plot(D.Time,cumtrapz(D.yGyro)./100,'DisplayName','yGyro Integrated')



subplot(312)
hold on
legend()
plot(D.Time,-D.Roll,'DisplayName','Roll')
plot(D.Time,D.xGyro,'DisplayName','xGyro')
plot(D.Time,cumtrapz(D.xGyro)./100,'DisplayName','xGyro Integrated')


subplot(313)
hold on
legend()
plot(D.Time,D.Yaw,'DisplayName','Yaw')
plot(D.Time,D.ZGyro,'DisplayName','ZGyro')
plot(D.Time,cumtrapz(D.ZGyro)./100,'DisplayName','ZGyroIntegrated')




% 
% plot(D.Time,D.latitude,'DisplayName','latitude')
% plot(D.Time,D.longitude,'DisplayName','longitude')
% plot(D.Time,D.alt,'DisplayName','DisplayName')



% plot(D.Time,D.xAcc,'DisplayName','xAcc')
% plot(D.Time,D.yAcc,'DisplayName','yAcc')
% plot(D.Time,D.zAcc,'DisplayName','zAcc')