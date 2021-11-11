%[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude,cP,cR,cY_I] = readvars("1_FullFlight.csv");
close all

%% Get Data
run RaketeParameter.m;
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')
M = readtable("1_FullFlight.csv");
M = removevars(M,{'cY_I'});
M.Time = M.Time./1000000;
M.Time = M.Time - M.Time(1);
sampleTime = 0.01;



%% simulate
sim("EchtwertVergleich.slx");

plot( out.SD_cP)
hold on
%plot(out.MC_Pitch)
plot(M.Time,M.cP)
legend('flight', 'sim')