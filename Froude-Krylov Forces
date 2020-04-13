% Erwin Horvath
% 04/25/2017

% Wavelength iteration
function[WaveHeight, Depth, Period, Cd, Cm, Ch, Cv, Diameter]=homework6(H,h,T,Cd,Cm,Ch,Cv,D);
L1=1;
tol=0.0001; %tolerance
dif=99;
g=9.81;
while tol<=dif;
    L=(g*T^2/(2*3.14))*tanh((2*3.14/L1)*h); %equation
    dif=abs(L1-L); %difference between guess and answer
    L1=L;
end

% Assuming rigid cylinder with given values below %
rho=1.025; %t/m3
visc=1.1881*10^-6; %m2/s
D=1.2; %meters (diameter for a pile)
x=0; % position of cylinder in x direction
y=0; % position of cylinder in y direction
z=2; % position of cylinder in z direction
k=2*3.14/L; % wave number
wt=0:6.28/20:6.28; %omega*time going from 0-2pi in intervals of 20
omega=2*3.14/T; % angular frequency
fprintf('\nThe wavelength(L) is: %0.2f m \n', L)
fprintf('The wavenumber(k) is: %0.2f m \n', k)
fprintf('The wave frequency(w) is: %0.2f \n', omega)
fprintf('The position of this cylinder is at x=%0.2f,y=%0.2f,z=%0.2f. \n', x, y, z)

% U Max
u=(3.14*H/(T*tanh(k*h)));
fprintf('The horizontal velocity(U_max) is: %0.2f m/s \n', u)

%Reynolds Number
Re=u*D/visc;
fprintf('The Reynolds Number is: %0.2f \n', Re)

% Drag and Mass Coefficients

%Keulegen-Carpenter Number
K_c=u*T/D;
fprintf('The Keulegen-Carpenter Number is: %0.2f \n', K_c)
fprintf('K_c is greater than 7, therefore, extremely turbulent flow \n');

% Energy
E=rho*g*H^2/8;
fprintf('The Energy is: %0.2f KJ/m^2 \n', E)

% Group Velocity Factor n
n=0.5*(1+2*k*h/sinh(2*k*h));
fprintf('The Group Velocity Factor(n) is: %0.2f \n', n)

% Max Drag Force
F_DMax=Cd*n*E*D;
fprintf('The Max Drag Force is: %0.2f kN\n', F_DMax)

% Max Drag Moment
M_D=h*(1-(1/(2*n)))*((cosh(2*k*h)-1+2*(k*h)^2)/(2*k*h*sinh(2*k*h)));
fprintf('The Drag Moment is: %0.2f kN*m\n', M_D)
M_DMax=F_DMax*M_D;
fprintf('The Max Drag Moment is: %0.2f kN*m\n', M_DMax)

% Max Inertia Force
F_IMax=Cm*D*E*3.14*(D/H)*tanh(k*h);
fprintf('The Max Inertia Force is: %0.2f kN\n', F_IMax)

% Max Inertia Moment
M_I=h*(1-((cosh(k*h)-1)/(k*h*sinh(k*h))));
fprintf('The Inertia Moment is: %0.2f kN*m\n', M_I)
M_IMax=M_I*F_IMax;
fprintf('The Max Inertia Moment is: %0.2f kN*m\n', M_IMax)
fprintf('\n')
fprintf('\n')
fprintf('\n')

%Morrison Equations (Total Force)
F_I=F_IMax*sin(k*x-wt);
F_D=F_DMax*cos(k*x-wt).*abs(cos(k*x-wt));
M_i=M_IMax*sin(k*x-wt);
M_d=M_DMax*cos(k*x-wt).*abs(cos(k*x-wt));
F_T=F_I+F_D; % Total Force
Morrison_Eqn=table((F_I).',(F_D).',(M_i).',(M_d).', (F_T).');
Morrison_Eqn.Properties.VariableNames = {'FI_kN' 'FD_kN' 'MI_kNm' 'MD_kNm' 'FT_kN'}
figure
plot(wt,F_I)
hold on 
plot(wt,F_D)
hold on
plot(wt,F_T)
legend('F_I', 'F_D', 'F_T')
title('F_I, F_D, F_T Morrison Equation')
xlabel('omega*t')
ylabel('F [kN]')
grid minor

%Froude-Krylov Forces
Star=Ch*((3.14*rho*g*H*(H/2)^2*L*k)/2*cosh(k*h));
F_X=Star*cosh(k*0)*sin(wt); % Horizontal Force
Star_2=Cv*((3.14*rho*g*H*(H/2)^2*L*k)/2*cosh(k*h));
F_Z=Star_2*cosh(k*0)*cos(wt); %Vertical Force
Froude_Krylov=table((F_X).',(F_Z).');
Froude_Krylov.Properties.VariableNames = {'FX_kN' 'FZ_kN'}
figure
plot(wt,F_X)
hold on
plot(wt,F_Z)
legend('F_X', 'F_Z')
title('Froude Krylov Forces')
xlabel('omega*t')
ylabel('F [kN]')
grid minor

%Diffraction Forces/McCamy-Fuchs Forces
F_XMF=Cm*(3.14/8)*rho*g*H*(D^2)*tanh(k*h)*cos(wt-0.25);
McCamy_Fuchs=table((F_XMF).');
McCamy_Fuchs.Properties.VariableNames = {'FX_kN'}
figure
plot(wt,F_XMF)
title('McCamy-Fuchs Force')
xlabel('omega*t')
ylabel('F [kN]')
grid minor



