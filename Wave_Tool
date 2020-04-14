% Erwin Horvath
% Wave Tool
% 09/06/2017

%To run function, save file:
%Copy this to your command window:
Wave_Tool(10,2,20,10,0.02,5,-2.5); 
%Then hit enter


%-----------------------------------START---------------------------------%
function [L,H_b,L2]=HorvathErwin_Wave_Tool(d1,H1,a1,T,B,d2,z2);

%PARAMETERS%
L1=1; % Initial Wavelength to begin iteration
tol=0.00001; %Tolerance for iteration
dif=99; % Difference for 
g=9.81; % Gravitational Acceleration
rho=1025; %density of seawater in kg/m^3 

%-----------------------------B: OUTPUTS @ d1-----------------------------%
fprintf('\nB:Outputs at d1:\n')
% Wavelength 
while tol<=dif;
    L=(g*T^2/(2*3.14))*tanh((2*3.14/L1)*d1); %equation
    dif=abs(L1-L); %difference between guess and answer
    L1=L;
end
fprintf('\nWavelength(L1): %0.2f m.', L)
k=2*3.14/L; %Wave Number
% Wave Celerity
C=L/T;
fprintf('\nWave Celerity(C1): %0.2f m/s.', C)
% Group Speed
n=0.5*(1+((4*3.14*d1/L)/(sinh(2*k*d1))));
C_g=n*C;
fprintf('\nGroup Speed(Cg1): %0.2f m/s.\n\n', C_g)
%-----------------------------------END OF B------------------------------%

%----------------------------C: DEEPWATER OUTPUTS-------------------------%
fprintf('C:Deepwater Outputs:\n')
%Deep Water Wavelength
L_0=g*T^2/(2*3.14);
fprintf('\nWavelength(L0): %0.2f m.\n', L_0)
%Deep Water Wave Celerity
C_0=((g*T)/(2*3.14));
fprintf('Wave Celerity(C0): %0.2f m/s.\n', C_0)
%Deep Water Wave Angle
a0=asind(sind(a1)*(C_0/C));
fprintf('Wave Angle(a0): %0.2f�.\n', a0)
%Deep Water Group Speed
Cg0=0.5*C_0;
fprintf('Group Speed(Cg0): %0.2f m/s.\n', Cg0)
%Deep Water Wave Height at H1 @ d1
H0=H1*sqrt((C_0)/(2*n*C))*sqrt(cosd(a1)/cosd(a0)); 
fprintf('Wave Height(H0(H1 @ d1)): %0.2f m.\n', H0) 
%Deep Water Wave Height 
H_0=H0*sqrt((C_0)/(2*n*C))*sqrt(cosd(a1)/cosd(a0)); 
fprintf('Wave Height(H0): %0.2f m.\n', H_0)   
%-----------------------------------END OF C------------------------------%

%------------------------D: BREAKING DEPTHS OUTPUT:-----------------------%
fprintf('\nD:Breaking Depths Output:\n')
close all;
H_b1=1;
tol=0.001; %Tolerance for iteration
dif=99; % Difference for 
g=9.81; % Gravitational Acceleration
rho=1025; %density of seawater in kg/m^3 
a=43.8*(1.0-exp(-19*B)); % a equation from k
b=1.56/(1+exp(-19*B));% b equation
%Wave Height Breaking
while tol<=dif;
    H_b=(b-(a*H_b1/(g*T^2)))*d2/1.5; % basically Hb=k*hb
    dif=abs(H_b1-H_b);
    H_b1=H_b;
end
fprintf('\nWave Height at Breaking(Hb): %0.2f m.\n',H_b)
% Depth at Breaking
K=b-(a*H_b/(g*T^2));
h_b=H_b/K;
fprintf('Depth at Breaking(db): %0.2f m.\n', h_b)
%--------------------------------END OF D---------------------------------%

%-----------------------E: VERIFICATION d2(d2>db)-------------------------%
fprintf('\nE:Verification:\n\n')
if d2<=h_b
    fprintf('Verification confirmed: d2 < h_b\n')
else
    fprintf('Verification failed: d2 > h_b\n')
end
%--------------------------------END OF E---------------------------------%

%------------------------------F:OUTPUTS AT d2---------------------------%:
fprintf('\nF:Outputs at d2:\n')
%Wavelength
close all;
tol=0.00001; %Tolerance for iteration
dif=99; % Difference for 
g=9.81; % Gravitational Acceleration
rho=1025; %density of seawater in kg/m^3 
while tol<=dif;
    L2=(g*T^2/(2*3.14))*tanh((2*3.14/L1)*d2); %equation
    dif=abs(L1-L2); %difference between guess and answer
    L1=L2;
end
fprintf('\nWavelength(L2): %0.2f m.', L2)
k2=2*3.14/L2;
%Wave Celerity
C2=L2/T;
fprintf('\nWave Celerity(C2): %0.2f m/s.\n', C2)
%Group Speed
n1=0.5*(1+((4*3.14*d2/L2)/(sinh(2*k2*d2))));
Cg2=n1*C2;
fprintf('Group Speed(Cg2): %0.2f m/s.\n', Cg2)
%Wave Angle
a2=asind(sind(a1)*(C2/C));
fprintf('Wave Angle(a2): %0.2f�.\n', a2)
%Wave Height
H_20=H1*sqrt((C2)/(Cg2))*sqrt(cosd(a2)/cosd(a1));
fprintf('Wave Height(H2 @ d2): %0.2f m.\n', H_20)
%Water Wave Height for H2 @ d2
H_2=H_20*sqrt((C2)/(Cg2))*sqrt(cosd(a2)/cosd(a1));
fprintf('Wave Height(H2): %0.2f m.\n', H_2)
%Horizontal Particle Velocity
u=(H_2/2)*g*(T/L2)*(cosh(2*3.14*(z2+d2)/L2)/cosh(2*3.14*d2/L2));
fprintf('Horizontal Velocity(u): %0.2f m/s \n', u)
%Vertical Particle Velocity
w=(H_2/2)*g*(T/L2)*(sinh(2*3.14*(z2+d2)/L2)/(cosh(2*3.14*d2/L2)));
fprintf('Vertical Velocity(w): %0.2f m/s \n', w)
%Horizontal Acceleration
ax=3.14*g*(H_2/L2)*(cosh(k2*z2+k2*d2)/cosh(k2*d2));
fprintf('Horizontal Acceleration(ax): %0.2f m/s^2. \n', ax)
%Vertical Acceleration
az=3.14*g*(H_2/L2)*(sinh(k2*z2+k2*d2)/cosh(k2*d2));
fprintf('Vertical Acceleration(az): %0.2f m/s^2. \n',az)
%Wave Energy per Unit Crest
E=(rho*g*H_2^2*L2)/8;
fprintf('Energy(E): %0.2s Joules/m \n', E)
%Wave Power per Unit Crest
P=(rho*g*H_2^2)*C_g;
fprintf('Wave Power(P): %0.2s Watts/m \n', P)
%-------------------------------END OF F----------------------------------%

end
