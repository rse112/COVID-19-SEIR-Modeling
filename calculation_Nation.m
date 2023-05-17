function t = calculation_Nation(t)
    t.dt = t.t(2) - t.t(1);
    for i = 1:length(t.t) - 1
        t.S(i+1) = t.S(i) + t.dt * (-t.beta * (t.I(i) / t.N(i)) * t.S(i) - t.beta_f * (1 - exp(-t.tau * t.Q(i))) * t.S(i));

        t.Sf(i+1) = t.Sf(i) + t.dt * (t.beta_f * (1 - exp(-t.tau * t.Q(i))) * t.S(i) - t.delta * t.beta * (t.I(i) / t.N(i)) * t.Sf(i));

        t.E(i+1) = t.E(i) + t.dt * (t.beta * (t.I(i) / t.N(i)) * t.S(i) + t.delta * t.beta * (t.I(i) / t.N(i)) * t.Sf(i) - t.kappa * t.E(i));
        
        t.I(i+1) = t.I(i) + t.dt * (t.kappa * t.E(i) - t.alpha * t.I(i));
        
        t.Q(i+1) = t.Q(i) + t.dt * (t.alpha * t.I(i) - t.gamma * t.Q(i));
        
        t.R(i+1) = t.R(i) + t.dt * (t.gamma * t.Q(i));
       
        t.N(i+1) = t.S(i+1) + t.Sf(i+1) + t.E(i+1) + t.I(i+1) + t.Q(i+1) + t.R(i+1);
    end
end
