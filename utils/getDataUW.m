function [country,C,date0] = getDataUW (locale)
% GETDATA Coronavirus data
%   Get data from UW table for a particular locale

if nargin < 1
    error('getDataUW :  locale is a required input')
end

defaultFile = 'data/parsed_UW_data.mat';

if ~isfile(defaultFile)
    parse_UW_data('data/virus.csv');
end
load(defaultFile)

country = locale;
first_non_NaN = find(~isnan(TConf.(locale)), 1);
date0 = datenum(TConf.datetime(first_non_NaN));
C = transpose(TConf.(locale)(first_non_NaN:end));