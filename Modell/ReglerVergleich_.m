%[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude,cP,cR,cY_I] = readvars("1_FullFlight.csv");
close all
clc
%% Get Data Real Data
run RaketeParameter.m;
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')
M = readtable("1_FullFlight.csv");
M = removevars(M,{'cY_I'});
M.Time = M.Time./1000000;
M.Time = M.Time - M.Time(1);
sampleTime = 0.01;








out=sim("ReglerVergleich.slx");

%% Display
f = figure;
f.Position = [500 100 1000 1000];
f.Name = "Pitch Regelwert";
hold on

plot( out.SD_cP)
plot(lowpass(out.MC_Pitch,20000))
legend('flight', 'sim')

