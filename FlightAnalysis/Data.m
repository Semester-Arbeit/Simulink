close all

D = readtable("../Data/26_nov/FlightLog 9.csv");
D = readtable("FlightLog.csv");
D.Time=D.Time-D.Time(1);


f0 = figure;
f0.Position = [2,84,1769,893];
f0.Name = "Sensor Analyse"; 
%subplot(311) 
hold on
legend() 
grid on


plot(D.Time,D.Pitch,'DisplayName','Pitch')
%plot(D.Time,D.yGyro,'DisplayName','yGyro')
plot(D.Time,D.cP,'DisplayName','flapValue')



