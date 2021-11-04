
%%  Physical Parameter
Gravitation = 9.8067;  % nach metas.ch... gravitationszonen schweiz
ObjectMass = 3.34; %gemessen 29.10
PitchTraegheit = 0.0362;%gemessen 29.10
RollTraegheit = 0.0430;%gemessen 29.10
YawTraegheit = 0.0335;%gemessen 29.10

PropGain = (ObjectMass*Gravitation)/0.8; % prop signal * Propgain = auftriebKraft .. Annahme bei 0.8 schwebend
PropOffset = 0.08; %Abstand von Propeller zu Massepunkt
DriftGain = 1; %  wieviel Kraft generiert eine Schieflage in rad
FlapGain = 1; % (abweichung von 0 pos in rad) * fla



%% Regler Parameter
KpX = 1;
KiX = .5;
KpY = 5;
KiY = .5;
KpZ = 10;
KiZ = 1;
KpPitch = 1;
KiPitch = 1;
KpRoll = 1;
KiRoll = 1.1;
KpYaw = 1;
KiYaw = 1;



