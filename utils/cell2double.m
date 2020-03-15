function [d] = cell2double(c)
    d=zeros(size(c,1),size(c,2));
    d=str2double(c);
end