
    %% Experiment 1
    % engine 80
    % Akku nicht ganz voll
    % Hebelarm = 0.525m  achse war 0.045m über schwerpunkt --> 
    leverage1 =  0.525-0.045;
    angles1 = [0 10 20 30 40 50 60];
    forces1 = [0 0.5+1/20 0.5+9/20 1.5-2/20 1.5+4/20 1.5+4/20 1+6/20];
    torque1 = forces1.*leverage1;
    %% Experiment 2
    % engine 80
    % Akku stand nach Experiment1 (zwischen 1&2 wurde nicht geladen)
    % Hebelarm = 0.525m achse war 0.045m über schwerpunkt -->
    leverage2 =  0.525-0.045;
    angles2 = [0 5 10 15 20 25 30 35 40 45 50];
    forces2 = [0 0.5-3/20 0.5 0.5+5/20 1-1/20 1+2/20 1+6/20 1.5+1/20 1.5+3/20 1.5+5/20 1.5+5/20];
    torque2 = forces2.*leverage2;

