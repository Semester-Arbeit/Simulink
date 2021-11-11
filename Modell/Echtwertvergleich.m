%[time,sensPitch,sensRoll,sensYaw,xGyro,yGyro,ZGyro,xAcc,yAcc,zAcc,latitude,longitude,altitude,cP,cR,cY_I] = readvars("1_FullFlight.csv");

%% Get Data
M = readtable("1_FullFlight.csv");
M = removevars(M,{'cY_I'});
M.Time = M.Time./1000000;
M.Time = M.Time - M.Time(1);
Ma = table2array(M);
plot(M.Time, M.sensPitch)
helo=0

%% simulate
sim("EchtwertVergleich.slx");
helo=1
