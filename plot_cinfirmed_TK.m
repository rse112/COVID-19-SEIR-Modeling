function plot_cinfirmed_TK(data_TK,t)
    alp_I_t = t.alpha * t.I ;

    figure();
    hold on
    plot(t.t,alp_I_t,'k',LineWidth=3)
    %plot(t.t,t.S)
    %plot(t.t,t.Sf)
    %plot(t.t,t.E)
    plot(data_TK,'ro')
    xlabel('Days')
    ylabel('Cases')
    %ylim([0,1000])
    %title('Daegu')
    hold off

end
