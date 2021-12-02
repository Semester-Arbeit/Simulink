clc
close all
run RaketeParameter.m


%%


StepVec=[0;0;-10;0;0;0];




SF=Simulate;

close all 

%% Behavioral
f1=figure;
f1.Position = [24,104,990,858];
hold on
legend()

plot(SF.Time,SF.state.Rollpos,'DisplayName','Rollpos')
plot(SF.Time,SF.state.Rollspeed,'DisplayName','Rollspeed')

plot(SF.Time,SF.state.Pitchpos,'DisplayName','Pitchpos')
plot(SF.Time,SF.state.Pitchspeed,'DisplayName','Pitchacc')

plot(SF.Time,SF.state.Yawpos,'DisplayName','Yawpos')
plot(SF.Time,SF.state.Yawspeed,'DisplayName','Yawspeed')

plot(SF.Time,SF.state.Xpos,'--','DisplayName','Xpos')
plot(SF.Time,SF.state.Xspeed,'--','DisplayName','Xspeed')

plot(SF.Time,SF.state.Ypos,'--','DisplayName','Ypos')
plot(SF.Time,SF.state.Yspeed,'--','DisplayName','Yspeed')

plot(SF.Time,SF.state.Zpos,'--','DisplayName','Zpos')
plot(SF.Time,SF.state.Zspeed,'--','DisplayName','Zspeed')





%% Sollwerte
f2=figure;

f2.Position = [1015,84,831,878];
subplot(2,1,1)
legend()
title('Aktor Werte')
hold on

plot(SF.Time,SF.stell.prop,'DisplayName','prop')
plot(SF.Time,SF.stell.flapXP+0.01,'DisplayName','flapXP')
plot(SF.Time,SF.stell.flapXN+0.02,'DisplayName','flapXN')
plot(SF.Time,SF.stell.flapYP+0.03,'DisplayName','flapYP')
plot(SF.Time,SF.stell.flapYN+0.04,'DisplayName','flapYN')

%% Regler Berechnung

subplot(2,1,2)
legend()
title('Simulierter Regler')
hold on


plot(SF.Time,SF.Corr.Roll,'DisplayName','Roll')
plot(SF.Time,SF.Corr.Pitch+0.01,'DisplayName','Pitch')
plot(SF.Time,SF.Corr.Yaw+0.02,'DisplayName','Yaw')
plot(SF.Time,SF.Corr.X+0.03,'DisplayName','X')
plot(SF.Time,SF.Corr.Y+0.04,'DisplayName','Y')
plot(SF.Time,SF.Corr.Z+0.05,'DisplayName','Z')
