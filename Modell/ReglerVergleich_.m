%[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude,cP,cR,cY_I] = readvars("1_FullFlight.csv");
close all
clc
%% Get Data Real Data
run RaketeParameter.m;
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')
M = readtable("1_FullFlight.csv");
M = removevars(M,{'cY_I'});
M.Time = M.Time./1000000; % in sekunden umwandeln
M.Time = M.Time - M.Time(1);% setuptime bis zum Flugstart abziehen
sampleTime = max(M.Time)/length(M.Time);% approx zeit zwischen samples
%% change Regler Data
RegPar.KpPitch= -0;
RegPar.KiPitch= -2;



%% Simulate  Data

out=sim("ReglerVergleich.slx");
T = timeseries2timetable(out.SimRegler);
SimRegler = table(T.Time,T.Data(:,1),   T.Data(:,2), T.Data(:,3),  T.Data(:,4),       T.Data(:,5),    T.Data(:,6),...
 'VariableNames',{'Time','XCorrection','YCorrection','ZCorrection','PitchCorrection','RollCorrection','YawCorrection'});

T = timeseries2timetable(out.FlightData);
FlightData = table(T.Time  ,T.Data(:,1),T.Data(:,2),T.Data(:,3),T.Data(:,4),T.Data(:,5),T.Data(:,6),T.Data(:,7),T.Data(:,8),T.Data(:,9),T.Data(:,10),T.Data(:,11),T.Data(:,12),T.Data(:,13),T.Data(:,14),T.Data(:,15),T.Data(:,16),T.Data(:,17),T.Data(:,18),T.Data(:,19),T.Data(:,20),...
    'VariableNames',{'Time','Xpos'     ,'Xspeed'   ,'Xacc'     ,'Ypos'     ,'Yspeed'   ,'Yacc'     ,'Zpos'     ,'Zspeed'   ,'Zacc'     ,'Pitchpos'  ,'Pitchspeed','Pitchacc'  ,'Rollpos'   ,'Rollspeed' ,'Rollacc'   ,'Yawpos'    ,'Yawspeed'  ,'Yawacc'    ,'cP'        ,'cR'});

clear("T","M","out")

%% Visualize

f = figure;
f.Position = [312,383,622,455];
f.Name = "Pitch Regelwert";
hold on

SimCP = SimRegler.PitchCorrection;
%SimCP = detreend(SimRegler.PitchCorrection);
%SimCP = SimCP*2;
%SimCP = SimCP -mean(SimCP) + mean(FlightData.cP);
%SimCP = movmean(SimCP,100);


plot(SimRegler.Time,SimCP)
plot(FlightData.Time,FlightData.cP)

legend('Simulated', 'Flight')

%% Integrated
I = figure;
I.Position = [1097,359,592,480];
I.Name = "Pitch Regelwert";
hold on

plot(FlightData.Time,FlightData.Pitchpos)
plot(FlightData.Time,FlightData.Pitchspeed)
%plot(FlightData.Time,cumtrapz(FlightData.Pitchspeed))
legend('pos', 'speed')

