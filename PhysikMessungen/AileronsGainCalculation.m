close
clc

run("getAileronsData.m")

figure('Name',"Force of two Ailerons",'NumberTitle','off');
hold on
plot(angles1,torque1,angles2,torque2,angles3,torque3,angles4,torque4,angles5,torque5,Marker="*")

grid on

x=1:60;


ang=[angles4 angles3].';
Nm= [torque4 torque3].';

flapgain  = ang.'*ang\ang.'*Nm
flapgain90= (angles4*angles4.')\(angles4*torque4.')
%AgLS = inv(angles4*angles4.')*angles4*torque4.'
yLS= x.*AgLS;
plot(x,yLS)
legend('Engine:80% #1','Engine:80% #2','Engine:100% #3,','Engine:90% #4','Engine:95% #5','Linearisation')