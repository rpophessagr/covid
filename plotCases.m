function plotCases(location,TConf, TSusp, TCure, TDead)
    addpath('utils');  
    addpath('utils/color');
%     pTConf = cell2table(caseTables(1));
%     pTSusp = cell2table(caseTables(2));
%     pTCure = cell2table(caseTables(3));
%     pTDead = cell2table(caseTables(4));
    f = figure();
    plot(TConf.(location),'Color','Red');
    hold on
    plot(TSusp.(location),'Color',rgb('orange','rgb'));
    plot(TCure.(location),'Color','Green');
    plot(TDead.(location),'Color','Black');
    legend('Confirmed', 'Suspected', 'Cured', 'Dead');
    title({'COVID-19 cases in: ', upper(location)});
    xlabel('time');
    ylabel('Cases');
end
