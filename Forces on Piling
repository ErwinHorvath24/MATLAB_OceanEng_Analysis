%Erwin Horvath

% ALL CALCULATIONS WERE DONE UTILIZING EQUATIONS FROM THE CEM  ON PAGE
% VI-5-278 TO VI-5-302

%Given Parameters:
h=3;%m
H=2.97;%m
T=20;%s
D=1; %m
rho=1025; %kg/m3
visc=0.000001040; %m2/s kinematic viscosity of seawater at 20 Celsius
CM=1.8; % This was obtained from grpah after calculating Reynold's number.
CD=0.62;% This was obtained from grpah after calculating Reynold's number.
CL=0.2;% This was obtained from graph in CEM. 

L1=1;
tol=0.0001; %tolerance
dif=99;
g=9.81;
while tol<=dif;
    L=(g*T^2/(2*3.14))*tanh((2*3.14/L1)*h); %equation
    dif=abs(L1-L); %difference between guess and answer
    L1=L;
end

k=2*3.14/L; % wave number
omega=2*3.14/T; % angular frequency
fprintf('\nThe wavelength(L) is: %0.2f m \n', L)
fprintf('The wavenumber(k) is: %0.2f  m\n', k)
fprintf('The wave frequency(w) is: %0.2f \n', omega)

% #1
% D/L ratio
ratio=D/L;
fprintf('D/L ratio is: %0.2f \n', ratio)
% U Max
 u=(3.14*H/(T*tanh(k*h)));
% u=(H/2)*g*(T/L)*(cosh(2*3.14*(0+h)/L)/cosh(2*3.14*h/L));
fprintf('The horizontal velocity(U_max) is: %0.2f m/s \n', u)
n=0.5*(1+2*k*h/sinh(2*k*h));
fprintf('The Group Velocity Factor(n) is: %0.2f \n', n)

% #3
% In order to calculate MAX values, according to CEM t=time= -T/4 for Ki &
% Si, 
Ki=0.5*tanh((2*3.14*h)/L)*sin((-2*3.14*(-T/4))/T);
fprintf('Max Ki is: %0.2f \n', Ki)
Kd=0.25*n*cos(0)*abs(cos(0));
fprintf('Max Kd is: %0.2f \n', Kd)
Si=1+(1-cosh((2*3.14*h)/L)/((2*3.14*h)/L)*sinh((2*3.14*h)/L));
fprintf('Max Si is: %0.2f \n', Si)
Sd=0.5+(1/2*n)*(0.5+((1-cosh((4*3.14*h)/L))/(((4*3.14*h)/L)*sinh((4*3.14*h)/L))));
fprintf('Sd is: %0.2f \n', Sd)

% #4
Fd=CD*0.5*rho*g*D*H^2*Kd;
fprintf('Max Drag Force is: %0.2f \n', Fd)
Fi=CM*rho*g*((3.14*D^2)/4)*H*Ki;
fprintf('Max Inertial Force is: %0.2f \n', Fi)
Md=CD*0.5*rho*g*D*H^2*Kd*h*Sd;
fprintf('Max Drag Moment: %0.2f \n', Md)
Mi=CM*rho*g*((3.14*D^2)/4)*H*Ki*h*Si;
fprintf('Max Inertial Moment: %0.2f \n', Mi)

% #6
phi_m=0.5;
alpha_m=0.48;
W=((CM*D)/(CD*H)); % W is calculated to find PHI & ALPHA from graphs(nomograms) in the CEM
fprintf('W is: %0.2f \n', W)
FM=(phi_m)*(CD)*rho*g*H^2*D; % MAX force
fprintf('FM is: %0.2f KN*m \n', FM)
MM=(alpha_m)*CD*rho*g*H^2*D*h; % MAX MOMENT
fprintf('MM is: %0.2f KN*m \n', MM)

% #8
%Keulegen-Carpenter Number
K_c=(u*T)/D;
fprintf('The Keulegen-Carpenter Number is: %0.2f \n', K_c)
fprintf('K_c is greater than 7, therefore, extremely turbulent flow \n');
%Reynolds Number
Re=(u*D)/visc; % Kinematic viscosity for seawater at 20 celsius is utilized. 
fprintf('The Reynolds Number is: %0.2f \n', Re)
%Frequency Factor
%B=Re/K_c;
B=(D^2/(visc*T));
fprintf('The Frequency Factor "Beta" is: %0.2f \n', B);
%FLM
FLM=CL*((rho*g)/2)*D*H^2*Kd;
fprintf('FLM(Max Transverse Force) is: %0.2f \n', FLM)

%B:
T_a=20;
L_a=((g*T_a^2)/(2*3.14));
D_1=0.05*L_a;
fprintf('Wavelength is: %0.2f meters \n', L_a)
fprintf('Max D is: %0.2f \n', D_1)
T_b=4;
L_b=((g*T_b^2)/(2*3.14));
D_2=0.05*L_b;
fprintf('Wavelength is: %0.2f meters \n', L_b)
fprintf('Max D is: %0.2f \n', D_2)


