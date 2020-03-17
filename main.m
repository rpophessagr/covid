% Analysis of COVID-19 epidemic
% 

% Data from:
% https://hgis.uw.edu/virus/
% http://hgis.uw.edu/virus/assets/virus.csv

% Epidemic Curve fit from:
% -- @Spark, fill this in? --
close all
addpath('data')
addpath('utils')
locale = 'us';    % Update desired locale here
fitVirus(@getDataUW,locale);

locale = 'china';    % Update desired locale here
fitVirus(@getDataUW,locale);

locale = 'massachusetts';    % Update desired locale here
fitVirus(@getDataUW,locale);

locale = 'washington';    % Update desired locale here
fitVirus(@getDataUW,locale);