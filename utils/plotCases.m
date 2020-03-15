function plotCases(location,TConf, TSusp, TCure, TDead)
%     pTConf = cell2table(caseTables(1));
%     pTSusp = cell2table(caseTables(2));
%     pTCure = cell2table(caseTables(3));
%     pTDead = cell2table(caseTables(4));
    
    plot(TConf.(location),'Color','Red');
    hold on
    plot(TSusp.(location),'Color','Yellow');
    plot(TCure.(location),'Color','Green');
    plot(TDead.(location),'Color','Black');
    legend('Confirmed', 'Suspected', 'Cured', 'Dead');
end
