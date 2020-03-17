function parse_UW_data(fname)

%---------------------%
% Duplicate from main.m
%fname = 'virus.csv';



% In the data table, each entry indicates the infection status in the 
% format of "#-#-#-#" -- a 4-sequel entry divided by dashes. The first 
% sequel represents the number of confirmed cases, the second sequel 
% represents suspected cases, the third sequel represents cured cases, 
% the fourth sequel represents death cases.


% -- LOAD FILE DATA -- %
fprintf("\r\n\r\nLoading file data\r\n");
opts = detectImportOptions(fname);
T = readtable(fname,opts);

headers = T.Properties.VariableNames;
sz = size(T);
data = zeros(size(T));

TConf = array2table(data);
TConf.Properties.VariableNames = headers;
TConf.datetime = T.datetime;
TSusp = array2table(data);
TSusp.Properties.VariableNames = headers;
TSusp.datetime = T.datetime;
TCure = array2table(data);
TCure.Properties.VariableNames = headers;
TCure.datetime = T.datetime;
TDead = array2table(data);
TDead.Properties.VariableNames = headers;
TDead.datetime = T.datetime;

for row = 1:size(T,1)
    progBar(row,size(T,1),10);
    for col = 2:size(headers,2)
        C = (strsplit(char(T.(headers{col})(row)),'-')); %str2double
        %disp(C);
        sz = size(C,2);
        if sz > 0
            iConf = str2double(C(1));
        else
            iConf = 0;
        end
        if sz > 1
            iSusp = str2double(C(2));
        else
            iSusp = 0;
        end
        if sz > 2
            iCure = str2double(C(3));
        else
            iCure = 0;
        end
        if sz > 3
            iDead = str2double(C(4));
        else
            iDead = 0;
        end
        TConf.(headers{col})(row) = iConf;
        TSusp.(headers{col})(row) = iSusp;
        TCure.(headers{col})(row) = iCure;
        TDead.(headers{col})(row) = iDead;
    end
end
chinaProv = headers{3:36};
TConf.china = mean(TConf{:,chinaProv},2)*size(chinaProv,2);
TSusp.china = mean(TSusp{:,chinaProv},2)*size(chinaProv,2);
TCure.china = mean(TCure{:,chinaProv},2)*size(chinaProv,2);
TDead.china = mean(TDead{:,chinaProv},2)*size(chinaProv,2);

save('data/parsed_UW_data.mat', 'TConf', 'TSusp', 'TCure', 'TDead')
