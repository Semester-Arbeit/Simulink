%close all
clc
clear
%warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')
M = readtable("../Data/SensorTest_18.11/FlightLog03.csv");

sens= -M.xGyro;
stell = M.cP;
dif= sens-stell;


                                                        f1 = figure;
                                                        f1.Position = [24,104,990,858];
                                                        f1.Name = "Pitch Regelwert";
                                                        hold on
                                                        legend()
%--------------------------
plot(M.Time,sens,'DisplayName','Sens')
plot(M.Time,stell+0.1,'DisplayName','Stell')
plot(M.Time,dif,'DisplayName','diff')

maxDiff=max(dif)
me=find(dif==maxDiff);
%plot(M.Time(me),10,'o')




                                                        f2 = figure;
                                                        f2.Position = [1015,84,831,878];
                                                        f2.Name = "Corrections";
                                                        hold on
                                                        legend()
%--------------------------
plot(M.Time,M.cP,'DisplayName','Pitch')
plot(M.Time,M.cR+0.1,'DisplayName','Roll')
plot(M.Time,M.cYI-0.1,'DisplayName','Yaw')


