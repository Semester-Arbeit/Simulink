clc
close all
run RaketeParameter.m


%%









out=sim("RaketenMolell_V1.slx");


T = timeseries2timetable(out.RM_State);
SF = table(   T.Time,T.Data(:,1),T.Data(:,2),T.Data(:,3),T.Data(:,4),T.Data(:,5),T.Data(:,6),T.Data(:,7),T.Data(:,8),T.Data(:,9),T.Data(:,10),T.Data(:,11),T.Data(:,12),T.Data(:,13),T.Data(:,14),T.Data(:,15),T.Data(:,16),T.Data(:,17),T.Data(:,18),...
    'VariableNames',{'Time','Xpos'     ,'Xspeed'   ,'Xacc'     ,'Ypos'     ,'Yspeed'   ,'Yacc'     ,'Zpos'     ,'Zspeed'   ,'Zacc'     ,'Pitchpos'  ,'Pitchspeed','Pitchacc'  ,'Rollpos'   ,'Rollspeed' ,'Rollacc'   ,'Yawpos'    ,'Yawspeed'  ,'Yawacc'});
clear("T","out")

plot(SF.Time,SF.Pitchpos,SF.Time,SF.Pitchspeed)