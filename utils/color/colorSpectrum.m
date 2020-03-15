function ColorCodes = colorSpectrum(N, c1, c2, c3)
    % colorSpectrum Creates a spectrum of colors from red to green to blue. 
    %   ColorCodes = colorSpectrum(N) ColorCodes contains N three-element RPG 
    %   vectors. The RPG vectors follow the transition of red to green and 
    %   green to blue. Avoids colors such as cyan and yellow, which are hard to
    %   see in plots. N should be greater than 2.
    % 
    %   Ex. The following example shows the full spectrum made.
    %       N = 1000;C=colorSpectrum(N);figure,hold on,
    %       for i = 1:N,plot([1:10],ones(10,1)*i,'Color',C(i,:)),end,hold off
    %   Copywrite 2013 Kirk T. Smith
    %   
    %R = linspace(255,-255,N)';

    if ~exist('c3','var')
        R = linspace(rgb(c1,'r'),rgb(c2,'r') , N)';
        G = linspace(rgb(c1,'g'),rgb(c2,'g') , N)';
        B = linspace(rgb(c1,'b'),rgb(c2,'b') , N)';
    else
        R = [linspace(rgb(c1,'r'),rgb(c2,'r') , ceil(N/2)),...
            linspace(rgb(c2,'r'),rgb(c3,'r') , floor(N/2))]';
        G = [linspace(rgb(c1,'g'),rgb(c2,'g') , ceil(N/2)),...
            linspace(rgb(c2,'g'),rgb(c3,'g') , floor(N/2))]';
        B = [linspace(rgb(c1,'b'),rgb(c2,'b') , ceil(N/2)),...
            linspace(rgb(c2,'b'),rgb(c3,'b') , floor(N/2))]';  
    end
%     
%     R = linspace(255,0,N)';
%     G = linspace(50,100,N)';
%     B = linspace(0,255,N)';

    %G = [linspace(0,255,ceil(N/2)),linspace(255,0,ceil(N/2))]';
    % if mod(N,2)
    %     G = [G(1:ceil(N/2));G(ceil(N/2)+2:end)];
    % end
    %B = linspace(-255,255,N)';
    ColorCodes = [R,G,B];
    ColorCodes = max(0,ColorCodes);

    testplot = 0; % Use for checking your selected color range
    	
    if testplot == 1
        figure
        x = linspace(1,10);
        for i = 1:N
            plot(x,x * i, 'Color', ColorCodes(i,:))
            hold on
        end
    end
    end

        