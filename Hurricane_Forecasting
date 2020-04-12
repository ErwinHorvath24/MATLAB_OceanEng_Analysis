% Erwin Horvath
% 09/18/2017
% Hurricane Andrew Forecasting Project


% Parameters
fontSize = 20;
R=24; % 24 km (Radius of Max Wind)
T=22; % Air Temp in Celsius
vf=6.94444; % Forward Speed m/s
pa=101400; % Ambient Pressure in Pa
pe2=93000; % Central Pressure on Landfall in Pa
pe1=92200; % Central Pressure before Landfall in Pa
f=2*0.286*sind(25.46); % Coriolis effect w/ Homestead Latitude
rho=1; % Density of air in kg/m^3
B1=1.8;
B2=1.95;

% Polar coordinate conversion
aZ = 1600;% a value
rZ = 1000;% r value
r = (0: rZ)'/ rZ;% Transpose matrix 
theta = 2*pi*(-aZ : aZ) / aZ;% Range for theta angle
X = r*cos(theta);% polar coordinate condition X direction
Y = r*sin(theta);% polar coordinate condition Y direction

%For Loop of SPM & CEM Equations
for rr = 1 : length(r)
	for aa = 1 : length(theta)
        %SPM Calculation
		Vel_B(rr, aa)=((-f*rr/2)+sqrt(((f^2)*(rr.^2)./4)+(1/rho).*(pa-pe1).*(R./rr).*exp(-R./rr)))*2; % before landfall
        Vel_A(rr, aa)=((-f*rr/2)+sqrt(((f^2)*(rr.^2)./4)+(1/rho).*(pa-pe2).*(R./rr).*exp(-R./rr)))*2; % on landfall
       
        %CEM Calculation
        V_B(rr,aa)=abs(sqrt((f.*rr/2)+(B1*(pa-pe1)./rho).*((R/rr).^B1).*exp(-(R/rr).^B1))-(rr.*f/2)); %before landfall
        V_A(rr,aa)=abs(sqrt((f.*rr/2)+(B2*(pa-pe2)./rho).*((R/rr).^B2).*exp(-(R/rr).^B2))-(rr.*f/2)); %before landfall
    end
end

%%%%%%%%-------------SPM-------------%%%%%%%%%%
% Before Landfall Plot
figure
contour(X,Y,Vel_B,'Showtext','on')
axis equal tight
colorbar
grid minor
title('Hurricane Andrew Wind Field(SPM Method, Windspeeds in km/hr)')
xlabel('x distance from eye of hurricane(x500 km)')
ylabel('y distance from eye of hurricane(x500 km)')
legend('Before Landfall: 922 mb (27.74 inHg) at 18:00 hrs, 23 Aug 1992')

% After Landfall Plot
figure
contour(X,Y,Vel_A,'Showtext','on')
axis equal tight
colorbar
grid minor
title('Hurricane Andrew Wind Field(SPM Method, Windspeeds in km/hr)')
xlabel('x distance from eye of hurricane(x500 km)')
ylabel('y distance from eye of hurricane(x500 km)')
legend('After Landfall: 930 mb at landfall 18:00 hrs, 24 Aug 1992')
%%%%%%%%------------END of SPM-----------%%%%%%%%%%

%%%%%%%%-------------CEM-------------%%%%%%%%%%
% Before Landfall Plot
figure
contour(X,Y,V_B,'Showtext','on')
axis equal tight
colorbar
grid minor
title('Hurricane Andrew Wind Field(CEM Method, Windspeeds in km/hr)')
xlabel('x distance from eye of hurricane(x500 km)')
ylabel('y distance from eye of hurricane(x500 km)')
legend('Before Landfall: 922 mb (27.74 inHg) at 18:00 hrs, 23 Aug 1992')

% After Landfall Plot
figure
contour(X,Y,V_A,'Showtext','on')
axis equal tight
colorbar
grid minor
title('Hurricane Andrew Wind Field(SPM Method, Windspeeds in km/hr)')
xlabel('x distance from eye of hurricane(x500 km)')
ylabel('y distance from eye of hurricane(x500 km)')
legend('After Landfall: 930 mb at landfall 18:00 hrs, 24 Aug 1992')
%%%%%%%%------------END of CEM-----------%%%%%%%%%%


%%%%Speed
UmaxB=0.447*(14.5*sqrt(10140-9220)-R*(0.31*f));
UmaxA=0.447*(14.5*sqrt(10140-9300)-R*(0.31*f));

uMAXB=0.865*UmaxB+0.5*vf;
uMAXA=0.865*UmaxA+0.5*vf;
