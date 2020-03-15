function [cVal] = rgb(color, value)
    % Returns RGB values (individual or triplet) for a given text string color
    % Inputs:
    %   color - string should match list below
    %   value - char matching 'r', 'g', 'b', or 'rgb'
    % Outputs:
    %   cVal is the rgb value selected (individual number or triplet)
    %
    % Supported Color List:
    % red, darkred, lightred, mediumred, defaultred (matlab plot default),
    % mutedred
    % orange, yellow, mutedbrown
    % green, darkgreen, mediumgreen, mutedgreen
    % teal, mutedteal1 (more green), mutedteal2 (more blue)
    % blue, darkblue, lightblue, mediumblue, defaultblue
    % purple, darkpurple, mediumpurple, mutedpurple
    % white, grey, black, plus 4 shades of grey (grey1 - grey4)
    % Support more colors by adding them to the array here.

    RGBvals = [
        255,   0,   0,  "red";    
        175,   0,   0,  "darkred";    
        255, 100, 100,  "lightred";    
        255,  50,  50,  "mediumred";    
        216,  84,  26,  "defaultred";    
        175, 100, 150,  "mutedred";
        
        255, 150,   0,  "orange";   
        255, 230,   0,  "yellow";   
        175, 150, 100,  "mutedbrown";
        
          0, 200,   0,  "green";   
          0, 100,   0,  "darkgreen";   
        100, 200, 100,  "mediumgreen";
        150, 175, 100,  "mutedgreen";
        
        100, 175, 150,  "teal";
        100, 175, 150,  "mutedteal1";
        100, 150, 175,  "mutedteal2";
        
          0,   0, 255,  "blue";    
          0,   0, 175,  "darkblue";    
        100, 100, 255,  "lightblue";    
          0, 150, 200,  "mediumblue";     
          0, 116, 189,  "defaultblue";     
        
        175,   0, 255,  "purple";    
        100,   0, 150,  "darkpurple";   
        175, 100, 255,  "mediumpurple";   
        150, 100, 175,  "mutedpurple";
        
        255, 255, 255,  "white";    
        153, 153, 153,  "grey";    
        204, 204, 204,  "grey1";    
        153, 153, 153,  "grey2";    
        102, 102, 102,  "grey3";    
         51,  51,  51,  "grey4";    
          0,   0,   0,  "black"    
        ];
        
    colorName = RGBvals(:,4);
    RVal = str2num(char(RGBvals(:,1)));
    GVal = str2num(char(RGBvals(:,2)));
    BVal = str2num(char(RGBvals(:,3)));

    cTable = table(colorName, RVal, GVal, BVal);
%     cTable = table(cRv, cGv, cBv, 'VariableNames', {'colorName', 'RVal', 'GVal', 'BVal'});
    cTable.rgb = [cTable.RVal, cTable.GVal, cTable.BVal];
    if value == "r"    
        cVal = cTable.RVal(cTable.colorName == color)/255;
    elseif value == "g"
        cVal = cTable.GVal(cTable.colorName == color)/255;
    elseif value == "b"
        cVal = cTable.BVal(cTable.colorName == color)/255;
    elseif value == "rgb"
%         cVal = [cTable.RVal(cTable.colorName == color)/255, ...
%         cTable.GVal(cTable.colorName == color)/255, ...
%         cTable.BVal(cTable.colorName == color)/255];
        cVal = cTable.rgb(cTable.colorName == color,:)/255;
    else
        cVal = 0;
    end
  
    
%     figure
%     for i = 1:size(cTable,2)
%         plot(linspace(0,10,1),i,'Color',cTable.rgb(i)/255)
%     end
%         
end