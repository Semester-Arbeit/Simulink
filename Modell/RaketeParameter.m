close all 
clc
%%  Physical Parameter
Gravitation = 9.81; 
ObjectMass = 1; %totale masse
PitchTraegheit = 1;
RollTraegheit = 1;
YawTraegheit = 1;
PropGain = 15; % prop signal * Propgain = auftriebKraft
DriftGain = 1; %  wieviel Kraft generiert eine Schieflage in rad
FlapGain = 1; % (abweichung von 0 pos in rad) * fla

%% Regler Parameter
KpX = 1;
KiX = 1;
KpY = 1;
KiY = 1;
KpZ = 1;
KiZ = 1;
KpPitch = 1;
KiPitch = 0.01;
KpRoll = 1;
KiRoll = 1;
KpYaw = 1;
KiYaw = 1;