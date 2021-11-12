
%%  Physical Parameter
Gravitation = 9.8067;  % nach metas.ch... gravitationszonen schweiz
ObjectMass = 3.34; %gemessen 29.10
PitchTraegheit = 0.0362;%gemessen 29.10
RollTraegheit = 0.0430;%gemessen 29.10
YawTraegheit = 0.0335;%gemessen 29.10

PropGain = (ObjectMass*Gravitation)/0.8; % prop signal * Propgain = auftriebKraft .. Annahme bei 0.8 schwebend
PropOffset = 0.08; %Abstand von Propeller zu Massepunkt
DriftGain = 1; %  wieviel Kraft generiert eine Schieflage in rad
FlapGain = 1.3178; % (abweichung von 0 pos in rad) * FlapGain = Drehmoment auf Objekt Approximiert von Messungen
%TODO recalculate flapgain in deg not rad

RakParam = table(Gravitation,ObjectMass,PitchTraegheit,RollTraegheit,YawTraegheit,PropGain,PropOffset,DriftGain,FlapGain);
clear("Gravitation","ObjectMass","PitchTraegheit","RollTraegheit","YawTraegheit","PropGain","PropOffset","DriftGain","FlapGain")



%% Regler Parameter
KpX = 5;
KiX = 0.5;
KpY = 5;
KiY = 0.5;
KpZ = 100;
KiZ = 100;
KpPitch = 2;
KiPitch = 2;
KpRoll = 1;
KiRoll = 1;
KpYaw = 1;
KiYaw = 1;

RegPar = table(KpX,KiX,KpY,KiY,KpZ,KiZ,KpPitch,KiPitch,KpRoll,KiRoll,KpYaw,KiYaw);

clear("KpX","KiX","KpY","KiY","KpZ","KiZ","KpPitch","KiPitch","KpRoll","KiRoll","KpYaw","KiYaw")







