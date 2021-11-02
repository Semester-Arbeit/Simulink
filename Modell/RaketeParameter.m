close all 
clc
%%  Physical Parameter
Gravitation = 9.8067;  % nach metas.ch... gravitationszonen schweiz
ObjectMass = 3.34; %gemessen 29.10
PitchTraegheit = 0.0362;%gemessen 29.10
RollTraegheit = 0.0430;%gemessen 29.10
YawTraegheit = 0.0335;%gemessen 29.10
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
KiPitch = 1;
KpRoll = 1;
KiRoll = 1.1;
KpYaw = 1;
KiYaw = 1;

