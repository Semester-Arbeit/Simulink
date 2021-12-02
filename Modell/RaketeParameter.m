
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


SimParam.Physics = table(Gravitation,ObjectMass,PitchTraegheit,RollTraegheit,YawTraegheit,PropGain,PropOffset,DriftGain,FlapGain,MaxFlapAngle);
clear("Gravitation","ObjectMass","PitchTraegheit","RollTraegheit","YawTraegheit","PropGain","PropOffset","DriftGain","FlapGain","MaxFlapAngle")



%% Regler Parameter
KpX = 1;
KiX = 1;
KpY = 1;
KiY = 1;
KpZ = 1;
KiZ = 1;
KpPitch = 1.4 ;
KiPitch = 1;
KpRoll = 1.4;
KiRoll = 1;
KpYaw = 5;
KiYaw = 12;

SimParam.Controler = table(KpX,KiX,KpY,KiY,KpZ,KiZ,KpPitch,KiPitch,KpRoll,KiRoll,KpYaw,KiYaw);

clear("KpX","KiX","KpY","KiY","KpZ","KiZ","KpPitch","KiPitch","KpRoll","KiRoll","KpYaw","KiYaw")

%% StepOn
         %X  Y  Z Roll Pitch Yaw    
SimParam.Step = array2table(zeros(1,6));
SimParam.Step.Properties.VariableNames={'X','Y','Z','Roll','Pitch','Yaw'};

%% Disturbance

SimParam.Disturbance= array2table(zeros(1,6));
SimParam.Disturbance.Properties.VariableNames={'X','Y','Z','Roll','Pitch','Yaw'};


%% Update SimParam




