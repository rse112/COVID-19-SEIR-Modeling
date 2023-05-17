function t = initialize_condition_TK(data_TK)
    %% initial conditions
    t = struct;
    t.S(1) = 4963622; %
    t.Sf(1) = 0; 
    t.E(1) = 450;  %450
    t.I(1) = 110;  %110
    t.Q(1) = 1; 
    t.R(1) = 0; 
    t.N(1) = t.S(1)+t.Sf(1)+t.E(1)+t.I(1)+t.Q(1)+t.R(1);
    t.beta = 1.353;  %6.184
    t.beta_f = 0.4176;  %4.085
    t.tau = 1/1000; 
    t.delta = 0.02; 
    t.kappa = 1/4.1;
    t.alpha = 1/4; 
    t.gamma = 1/14; 
    
    t.dt=0;
    t.t0 = 0; % 시작 시간
    t.t1 = length(data_TK); % 끝나는 시간
    t.t = linspace(t.t0,t.t1,10000); 
     % 0.5단위로 끊김. 0, 0.5, 1, 1.5 ,2.0... 이렇게 읽혀짐
end

