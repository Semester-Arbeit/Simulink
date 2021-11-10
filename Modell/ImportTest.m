clc
close all

T = readtable("YawInertiaPendel01.csv");

T.Time = T.Time./10000;
T.Time = T.Time - T.Time(1);
% Ta = table2array(T);
plot(T.Time, T.sensYaw)

simout = sim("EchtwertVergleich.slx");