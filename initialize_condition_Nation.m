function t = initialize_condition_Nation(data)
    %% initial conditions
    t = struct;
    t.S(1) = 50000000; %
    t.Sf(1) = 0; 
    t.E(1) = 516;  %516
    t.I(1) = 126;  %125
    t.Q(1) = 2; 
    t.R(1) = 0; 
    t.N(1) = t.S(1)+t.Sf(1)+t.E(1)+t.I(1)+t.Q(1)+t.R(1);
    t.beta = 1.353;  %6.184 1.353
    t.beta_f = 0.4004;  %4.085 0.4004
    t.tau = 1/1000; 
    t.delta = 0.02; 
    t.kappa = 1/4.1;
    t.alpha = 1/4; 
    t.gamma = 1/14; 
    
    t.dt=0;
    t.t0 = 0; % 시작 시간
    t.t1 = length(data); % 끝나는 시간
    t.t = linspace(t.t0,t.t1,10000); 
    
end

