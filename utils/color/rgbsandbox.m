l = linspace(0,255,5);

colorway = [
"Red",      255,   0,   0;
"Yellow",   255, 255,   0;
"Green",      0, 255,   0;
"Cyan",       0, 255, 255;
"Blue", 	  0,   0, 255;
"Purple",   255,   0, 255;
"Black",      0,   0,   0];


cName = colorway(:,1);
cRv = str2num(char(colorway(:,2)));
cGv = str2num(char(colorway(:,3)));
cBv = str2num(char(colorway(:,4)));

Tc = table(cName, cRv, cGv, cBv);
Tc.sum = Tc.cRv + Tc.cGv + Tc.cBv;

Tc.cRp(Tc.sum > 0,:) = Tc.cRv(Tc.sum > 0,:)./Tc.sum(Tc.sum > 0,:) *100;
Tc.cGp(Tc.sum > 0,:) = Tc.cGv(Tc.sum > 0,:)./Tc.sum(Tc.sum > 0,:) * 100;
Tc.cBp(Tc.sum > 0,:) = Tc.cBv(Tc.sum > 0,:)./Tc.sum(Tc.sum > 0,:) * 100;
Tc.cRp(Tc.sum == 0,:) = 100/3; 
Tc.cGp(Tc.sum == 0,:) = 100/3; 
Tc.cBp(Tc.sum == 0,:) = 100/3;
Tc.pct = [Tc.cRp, Tc.cGp, Tc.cBp];


saturation = ["dark", "bold", "light", "muted", "pastel"];

%Dark
    
mycolorway = "Red";

