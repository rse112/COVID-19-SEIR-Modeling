function plot_cinfirmed_nation(data,t)
    alp_I_t = t.alpha * t.I ;

    figure();
    hold on
    plot(t.t,alp_I_t,'k',LineWidth=3)
    %plot(t.t,t.S)
    %plot(t.t,t.Sf)
    %plot(t.t,t.E)
    plot(data,'ro')
    xlabel('Days')
    ylabel('Cases')

    %title('Nation')
hold off

end
