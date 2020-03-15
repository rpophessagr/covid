function [p] = progBar (index,taskSize,intervalPct)
% Prints the progress of a task based on the current index, total
% number of items in the task iteration, and the interval of how many
% progress lines you want (i.e. intervalPct = 20 prints every 20%
% completion, or 5x per task. Default 10%.)
% Progress readout adds up to ~3s per 1000 items.
    
    if ~exist('intervalPct','var'); intervalPct = 10; end    
    
    nx = round(taskSize/intervalPct);
    p = (index/taskSize)*100;
    if mod(index, nx) == 0
        fprintf("Task %.2f %% complete at line %d\r",p,index);
    end
end