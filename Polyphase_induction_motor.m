Po=2.2;     %kW Q=Co *D^2 *Lns   
Es=400;     %Voltage
eta=0.8;    %Efficiency
f=50;       %frequency
pf=0.825;   %power factor
p=4;        %pole
Ns=1500;    %Speed
Bav=0.44;   %p*Q/(pi*D*L); 
ac=21000;   %(Ia*Z)/(pi*D) electrical loading
Ks=0.9;
Kw=0.955;   
qs=2;       %slot per pole per phase
m=3;        %number of phases

%Main Dimensions
%L/tow=1.5 for minimum cost design hence L=1.18D
Q=Po/(eta*pf);            %input power
Co=11*Kw*Bav*ac*(1/1000);  %Output Co-efficient
ns=Ns/60;                 %speed in rps
G = Q/(Co*ns);
D=(G/1.18)^(1/3); %diameter
L=1.18*D;                 %Length of the machine
Li=Ks*L;                  %net Iron Length
B=D^2*L;

%Stator Design         #Delta connected for Lt
Fm=(3.14*D*L*Bav)/p;     %Flux per pole
Ts=Es/(4.44*f*Fm*Kw);  %Stator turns per phase
Ss=qs*p*m;             %Total number of slots     %minimum value is 2
Yss=(3.14*D)/Ss;       %stator slot pitch
Zs=2*m*Ts;             %total Stator Conductors
Zss=Zs/Ss;             %Stator conductors per slot
Cs0=Ss/p;              %Coil span
if mod(Cs0,2)==0
    Cs=Cs0-1;
end
alpha=(180/Cs0);                %chording angle in degree
A=(pi/180)*alpha;               %chording angle in rad
Kp=cos(A/2);                    %pitch factor
Kd=(sin(qs*A/2))/(qs*sin(A/2)); %distribution factor
Kws=Kp*Kd;
%Stator Conductor Design
cd=4;                      %current density
Ips=Po*1000/(3*Es*eta*pf); %Stator phase current
Ils=Ips*sqrt(3);           %Stator line current
Asc= Ips/cd;               %Stator conductor cross section area
diasc=sqrt(4*Asc/pi);      %diameter of conductor
diascnew=0.95;

Ascnew=(pi*(diascnew^2))/4; %New Stator conductor cross section area
cdnew=Ips/Ascnew;           %New cd for new diameter

%Slot Dimension
sf=0.4;         %Space factor of slot
Btm=1.7;        %Maximum flux density
Sbc=Zss*Ascnew; %Space required for bare conductors
Aslot=Sbc/sf;   %Slot area

Wtsmin=(Fm*p)/(1.7*Ss*Li);                  %Minimum width of stator teeth
Wts=6*0.001;                                %Width of stator teeth
x=(pi*((D*1000)+(2*4))/Ss)-(Wts*1000);      %x in mm
h=(-x+sqrt(x^2+(4*pi*Aslot/Ss)))/(2*pi/Ss); %in mm
BB=x +((2*pi*h)/Ss);                        %BB in mm
h=ceil(h);                                  %rounding to higher value
dss=h+4;                                    %depth in mm

%Stator Core
Bcs=1.2;                  %Flux density in stator core
Bt=Fm/(Ss*6*Li*1000/p);   %Flux density in stator teeth
Fcs=Fm/2;                 %Flux in stator core
Acs=Fcs/Bcs;              %Area of stator core
dcs=ceil(Acs/Li*1000);    %Depth of stator core
Bcsnew=Fcs/Acs;           %New Flux density in stator core
Do=D+(2*(dss+dcs));       %Outer diameter of stator lamination

%Rotor Design
delb=6;          %current density in rotor bar
rho=0.021;       %Specific resistance
lg=0.3;          %length of air gap in mm
Dr=(D)-(2*lg*0.001); %diameter of rotor
Sr=Ss-2;         %no. of rotor slot
Ysr=(pi*Dr)/Sr;  %rotor slot pitch
Irb=Ips*Zs*Kw*pf/Sr;  %Rotor bar current
Ab=Irb/delb;     %Area of rotor bar conductor
Ab=44.6;         %According to lookup table area is 44.6 with dimension 7x6.5
Dsr=0.0093;      %depth of rotor slot adding 0.15 on both sides for lamination and slanght height of 1 plus 1 of neck
Wr=0.0068;       %width of rotor slot adding 0.15 mm on both sides for lamination
rpitchb=(pi*(D-(2*Dsr))/Sr); %rotor slot pitch at bottom
Wtr=rpitchb-Wr;  %width of rotor teeth
Lb=Li+(2*0.015)+0.001; %length of Bar 15 mm for end ring and 10 mm for slant
rb=0.021*Lb/Ab;  %resistance of rotor bar
Btr=Fm*4/(Sr*Lb*Wtr); %Flux in rotor
Culossr=(Irb^2)*rb*22; %Copper loss in rotor

%End rings
delc=6;              %current density in end ring
Ib=Sr*Irb/(pi*p);    %Current in end ring
de=0.01;             %diameter of end ring=0.01
te=0.008;            %width of end ring=0.008 in mm
Ae=Ib/delc;          %Area of end ring
Doe=Dr-(2*Dsr);      %Outside diameter of end ring
Die=Doe-(2*de);      %Inside diameter of end ring
De=(Doe+Die)/2;      %Avg diameter
re=rho*pi*De/Ae;     %resistance of end ring
Culoss=2*(Ib^2)*rb;  %Copper loss in end ring
rcl=Culoss+Culossr;  %Total copper loss
% Rotor input:Rotor copper loss:Rotor output = 1:s:1-s
q=rcl*0.001/Po; 
S=q/(1+q);  %Slip

%Rotor core
dcr=dcs;                   %depth of rotor slot
Bcr=1.185;                 %Flux in rotor core
Di=Dr-2*((Dsr*1000)+dcr);  %Inner diameter of rotor core

%No load current and Efficiency
%Air gap mmf
sos=2; %stator opening in mm
ras=sos/lg; %Ratio or stator opening to air gap
Kcs=0.68; %carter coefficient
Kgss=Yss*1000/((Yss*1000)-(Kcs*sos)); %Gap contraction factor for stator
sor=1.5;   %rotor opening in mm
rar=sor/lg; %Ratio or rotor opening to air gap
Kcr=0.6;  %carter coefficient
Kgsr=Ysr*1000/((Ysr*1000)-(Kcr*sor)); %Gap contraction factor for rotor
Kgs=Kgss*Kgsr;  %Total slot gap contraction factor
Kgd=1; %factor due to duct
Kg=Kgs*Kgd;
Atg=800000*1.36*Bav*Kg*lg*0.001; %Air gap MMF  

%Stator teeth mmf
atts=1200;      %MMF per meter height
ATts = atts*dss;

%stator core mmf
atcs=280;       %MMF per unit length of stator core
Lcs=pi*(D+(2*(dss+dcs)*(0.001)))/(3*p); %Mean length of the magnetic path in stator core
ATcs=atcs*Lcs;  %MMF  in stator core
%Rotor teeth mmf
atr=2000;
ATtr=atr*Dsr*1000; 

%Rotor core mmf
Lcr = (pi*(Dr+(2*(((Dsr*1000)+dcr)*0.001))))/(3*p); %Mean length of the magnetic path in rotor core
atcr=280;  %MMF per unit length of rotor core
ATcr=atcr*Lcr;  %MMF  in rotor core  %correct

AT=Atg+ATts+ATcs+ATtr+ATcr; %total MMF
Im=(0.427*p*AT)/(Kws*Ts);    %Magnetising current

%LOSS Component
%Iron loss in stator
Vst=Ss*Wts*Li*dss*0.001;
Wst=Vst*7.6*1000;
%Bmt=1.12*pi/2;
Ist=Wst*11.5;  %iron loss is 11.5wt/kg of stator teeth

%Iron loss in stator core
Vsc=pi*(D+2*(dss+dcs)*0.001)*Li*dcs*0.001;
Wsc=Vsc*7.6*1000;
Isc=4.9*Wsc;
Iloss=2*(Ist+Isc);

%Friction and Windage loss
FWls=1.5*10*Po;         %Friction and windage loss
NLoss=Iloss+FWls;       %No load loss
Il=NLoss/(3*Es);        %Active current
Io=sqrt((Il^2)+(Im^2)); %No load current
rs=5.699;               
scl=3*(Ips^2)*rs;       %stator copper loss
LOSS=rcl+scl+NLoss;     %Total Loss
Eff=(Po/(Po+(LOSS*0.001)))*100; % in percentage

% Display important variables
fprintf('Important Calculated Variables:\n');
fprintf('----------------------------------\n');
fprintf('Input Power (Q): %.2f kW\n', Q);
fprintf('Output Co-efficient (Co): %.2f\n', Co);
fprintf('Diameter (D): %.2f m\n', D);
fprintf('Length (L): %.2f m\n', L);
fprintf('Net Iron Length (Li): %.2f m\n', Li);
fprintf('Outer Diameter of Stator Lamination (Do): %.2f m\n', Do);
fprintf('Flux per Pole (Fm): %.4f Wb\n', Fm);
fprintf('Stator Turns per Phase (Ts): %.2f\n', Ts);
fprintf('Total Slots (Ss): %.2f\n', Ss);
fprintf('Stator Slot Pitch (Yss): %.2f m\n', Yss);
fprintf('Stator Conductors per Slot (Zss): %.0f\n', Zss);
fprintf('Coil Span (Cs): %.2f\n', Cs);
fprintf('Chording Angle (alpha): %.2f degrees\n', alpha);
fprintf('Current Density in Rotor (delb): %.2f A/mm^2\n', delb);
fprintf('Slip (S): %.2f\n', S);
fprintf('Magnetising Current (Im): %.2f A\n', Im);
fprintf('Copper Loss in Rotor (Culossr): %.2f W\n', Culossr);
fprintf('Efficiency (Eff): %.2f%%\n', Eff);