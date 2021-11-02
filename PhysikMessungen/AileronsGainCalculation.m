close all
clc

run("getAileronsData.m")

figure('Name',"Force of two Ailerons",'NumberTitle','off');
hold on
plot(angles1,torque1,angles2,torque2,Marker="*")
legend('Engine:80% #1','Engine:80% #2')
grid on