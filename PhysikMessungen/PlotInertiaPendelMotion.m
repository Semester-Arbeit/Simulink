T = readtable("../Data/Pendel/YawInertiaPendel01.csv");
close
hold on


figure('Name',"Force of two Ailerons",'NumberTitle','off');
hold on
plot(T.Time./1000,T.sensYaw,"-",'DisplayName','#1 Engine:80% ')
%plot(T.Time,T.ZGyro,"--",'DisplayName','#2 Engine:80% ')

ylabel('Yaw position [ ° ]')
xlabel('Time [sec]')
title('Yaw inertia measurement')