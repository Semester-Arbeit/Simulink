

%close all

PlotDataFromFile('RollInertiaPendel03')
PlotDataFromFile('PitchInertiaPendel02')
PlotDataFromFile('YawInertiaPendel02')

g=9.8067; %Erdbeschleunigung
m=3.34; %Masse

d=0.16; %Abstand der Schnüre
h=0.74;   %lange der Schnüre



%[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude] = readvars(filename);



%% eval

timeA = 44794;
timeB = 67244;

td = (timeB-timeA)/1000; %Toale zeit
Periods=10;
T=td/Periods

inertia = (m*g*d^2*T^2)/(16*pi^2*h)