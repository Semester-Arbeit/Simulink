%% intro
%close all
clc
run ../Modell/RaketeParameter.m




%% calculate T & zet

% RegPar.KpPitch = 2;
% RegPar.KiPitch= 4;

T = sqrt(RakParam.PitchTraegheit/(2*RegPar.KiPitch*RakParam.FlapGain))
zet = RegPar.KpPitch/(2*RegPar.KiPitch*T)
%% calculate Ki & Kp
zet = .7;
T = 0.5;
RegPar.KiPitch = RakParam.PitchTraegheit/(T^2*2*RakParam.FlapGain);
disp('KiPitch = ')
disp(RegPar.KiPitch)
RegPar.KpPitch = (zet*RakParam.PitchTraegheit)/(RakParam.FlapGain*T);
disp('KpPitch = ')
disp(RegPar.KpPitch)


%% TF


G_stoer = tf([2*RegPar.KiPitch*RakParam.FlapGain],[T^2 2*zet*T 1])
G_pos = tf([1],[T^2 2*zet*T 1])
%% Plot

figure
subplot(211)
step(G_pos)


subplot(212)
impulse(G_pos)