%[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude,cP,cR,cY_I] = readvars("1_FullFlight.csv");
close all
clc
%% Get Data Real Data
run RaketeParameter.m;
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')
M = readtable("../Data/SensorTest_18.11/FlightLog02.csv");
%M = removevars(M,{'cY_I'});
M.Time = M.Time./1000000; % in sekunden umwandeln
M.Time = M.Time - M.Time(1);% setuptime bis zum Flugstart abziehen
sampleTime = max(M.Time)/length(M.Time);% approx zeit zwischen samples wird im SIMULINK benötigt
%% change Regler Data
RakParam = table();
RakParam.KpX = 0;
RakParam.KiX = 0;
RakParam.KpY = 0;
RakParam.KiY = 0;
RakParam.KpZ = 0;
RakParam.KiZ = 0;
RakParam.KpPitch = 0;
RakParam.KiPitch = 0;
RakParam.KpRoll = 0;
RakParam.KiRoll = 0;
RakParam.KpYaw = 0;
RakParam.KiYaw = 0;



%% Simulate  Data



out=sim("ReglerVergleich.slx");
T = timeseries2timetable(out.SimRegler);
SimRegler = table(T.Time,T.Data(:,1),   T.Data(:,2), T.Data(:,3),  T.Data(:,4),       T.Data(:,5),    T.Data(:,6),...
 'VariableNames',{'Time','XCorrection','YCorrection','ZCorrection','PitchCorrection','RollCorrection','YawCorrection'});

T = timeseries2timetable(out.FlightData);
FlightData = table(T.Time  ,T.Data(:,1),T.Data(:,2),T.Data(:,3),T.Data(:,4),T.Data(:,5),T.Data(:,6),T.Data(:,7),T.Data(:,8),T.Data(:,9),T.Data(:,10),T.Data(:,11),T.Data(:,12),T.Data(:,13),T.Data(:,14),T.Data(:,15),T.Data(:,16),T.Data(:,17),T.Data(:,18),T.Data(:,19),T.Data(:,20),...
    'VariableNames',{'Time','Xpos'     ,'Xspeed'   ,'Xacc'     ,'Ypos'     ,'Yspeed'   ,'Yacc'     ,'Zpos'     ,'Zspeed'   ,'Zacc'     ,'Pitchpos'  ,'Pitchspeed','Pitchacc'  ,'Rollpos'   ,'Rollspeed' ,'Rollacc'   ,'Yawpos'    ,'Yawspeed'  ,'Yawacc'    ,'cP'        ,'cR'});

clear("T","out")

SimRegler = SimRegler(1:length(FlightData.Time),:);


%% Visualize





f = figure;
f.Position = [223,200,1251,734];
f.Name = "Pitch Regelwert";
hold on




plot(M.Time,M.cP,'DisplayName','Flight')
plot(M.Time,-M.yGyro+0.1,'DisplayName','Calculated')

plot(M.Time,M.cP-M.yGyro,'DisplayName','diff')
maxDiff=max(M.cP+M.yGyro)

legend()

%% Integrated
I = figure;
I.Position = [1097,359,592,480];
I.Name = "Korrections";
hold on
plot(M.Time,M.cP,'DisplayName','Pitch')
plot(M.Time,M.cR,'DisplayName','Roll')
plot(M.Time,M.cYI,'DisplayName','Yaw')
legend()

