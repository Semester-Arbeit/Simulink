close all
clc

run("getAileronsData.m")

figure('Name',"Force of two Ailerons",'NumberTitle','off');
hold on
plot(angles1,torque1,angles2,torque2,angles3,torque3,angles4,torque4,angles5,torque5,Marker="*")
legend('Engine:80% #1','Engine:80% #2','Engine:100% #3,','Engine:90% #4','Engine:95% #5')
grid on