% Analysis of COVID-19 epidemic
% 

% Data from:
% https://hgis.uw.edu/virus/
% http://hgis.uw.edu/virus/assets/virus.csv

% Epidemic Curve fit from:
% -- @Spark, fill this in? --

% user determines which sequences to run
do_us = 1;
do_ma = 1;
do_ch = 1;
do_it = 1;
do_wa = 1;
do_tx = 1;
do_ca = 1;

% end


close all
addpath('data')
addpath('utils')

if do_us
    locale = 'us';    % Update desired locale here
    fitVirus(@getDataUW,locale);
end

if do_ch
    locale = 'china';    % Update desired locale here
    fitVirus(@getDataUW,locale);
end
   
if do_ma
    locale = 'massachusetts';    % Update desired locale here
    fitVirus(@getDataUW,locale);
end

if do_wa
    locale = 'washington';    % Update desired locale here
    fitVirus(@getDataUW,locale);
end

if do_it
    locale = 'italy';    % Update desired locale here
    fitVirus(@getDataUW,locale);
end

if do_tx
    locale = 'texas';    % Update desired locale here
    fitVirus(@getDataUW,locale);
end

if do_ca
    locale = 'california';    % Update desired locale here
    fitVirus(@getDataUW,locale);
end

close all
