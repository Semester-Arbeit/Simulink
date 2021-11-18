



D = readtable("YawInertiaPendel02.csv");
D = D(1300:end,["Time","sensYaw","ZGyro"]);
D.Time=D.Time-D.Time(1);
plot(D.Time,D.sensYaw)
hold on
plot(D.Time,D.ZGyro)
legend('pos','speed')
plot(D.Time,cumtrapz(D.sensYaw))

plot(D.Time,cumtrapz(D.sensYaw./D.ZGyro))