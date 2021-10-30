close all
clc

run("getAileronsData.m")

figure('Name',"Ailerons Gain",'NumberTitle','off');
hold on
plot(angles1,torque1,angles2,torque2,Marker="*")
legend('Nr1','Nr2')
