
%%  Physical Parameter
Gravitation = 9.8067;  % nach metas.ch... gravitationszonen schweiz
ObjectMass = 3.34; %gemessen 29.10
PitchTraegheit = 0.0362*(360/2*pi);%gemessen 29.10 umgewandelt in pro deg anstatt rad
RollTraegheit = 0.0430*(360/2*pi);%gemessen 29.10
YawTraegheit = 0.0335*(360/2*pi);%gemessen 29.10

PropGain = (ObjectMass*Gravitation)/0.8; % prop signal * Propgain = auftriebKraft .. Annahme bei 0.8 schwebend
PropOffset = 0.08; %Abstand von Propeller zu Massepunkt
DriftGain = 1; %  wieviel Kraft generiert eine Schieflage in rad
FlapGain = 0.0235; % (abweichung von 0 pos in deg) * FlapGain = Drehmoment auf Objekt mit Least^2 von Messungen 90% und 100% Schub
MaxFlapAngle = 30;


RakParam = table(Gravitation,ObjectMass,PitchTraegheit,RollTraegheit,YawTraegheit,PropGain,PropOffset,DriftGain,FlapGain,MaxFlapAngle);
clear("Gravitation","ObjectMass","PitchTraegheit","RollTraegheit","YawTraegheit","PropGain","PropOffset","DriftGain","FlapGain","MaxFlapAngle")



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







