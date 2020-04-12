% START %
function
[Wave_height,Period,water_depth,wave_number,x_dist,z_dist,time]=linearW
aveKinematics(H,T,h,k,x,z,t);
L1=2*3.14/k;
%Gravity and Density
g=9.81;
rho=1025; % Density of S.W. is 1025 kg/m^3
%Phase speed
C=(g*T/(2*3.14))*tanh(2*3.14*h/L1);
fprintf('The phase speed is: %g m/s \n', C)
%Horizontal Vel
u=H/2*g*T/L1*(cosh(2*3.14*(z+h)/L1)/cosh(2*3.14*h/L1))*cos(k*x-
(2*3.14/L1)*t);
fprintf('The horizontal velocity is: %g m/s \n', u)
%Vertical Vel
w=H/2*g*T/L1*(sinh(2*3.14*(z+h)/L1)/cosh(2*3.14*h/L1))*sin(k*x-
(2*3.14/L1)*t);
fprintf('The vertical velocity is: %g m/s \n', w)
%Horizontal Acceleration
horiz_acc=3.14*g*H/L1*(cosh(k*z+k*h)/cosh(k*h))*sin(k*x-
((2*3.14)/L1)*t);
fprintf('The horizontal acceleration is: %g m/s^2 \n', horiz_acc)
%Vertical Acceleration
vert_acc=-3.14*g*H/L1*(sinh(k*z+k*h)/cosh(k*h))*cos(k*x-
((2*3.14)/L1)*t);
fprintf('The vertical acceleration is: %g m/s^2 \n', vert_acc)
%Horizontal Displacement
h_disp=-H/2*(cosh((k*z)+(k*h))/cosh(k*h))*sin((k*x)-(2*3.14/L1)*t);
fprintf('The horizontal displacement is: %g m \n', h_disp)
%Vertical Displacement
v_disp=H/2*(sinh(k*z+k*h)/cosh(h*k))*cos(k*x-(2*3.14/L1)*t);
fprintf('The vertical displacement is: %g m \n', v_disp)
%Pressure
pressure=rho*g*H/2*(cosh(k*z+k*h)/cosh(k*h))-rho*g*z;
fprintf('The dynamic pressure is: %g N/m^2 \n', pressure)
end
% END %


c)
% START %
% parameters given from part a)
H = 1;
T = 12;
h = 20;
L1=152.42;
k = 2*pi/L1;
g=9.81;
rho=1025;
% independent variables
x = 0;
z = -h:0.25:0; % includes an array of z from seafloor to still water
line
t = T/3;
eta=H/2*cos((2*3.14*x/L1)-(2*3.14*t/L1));
% loop over depth (z array) here and compute all your kinematic
quantities
for i = z+1
%Horizontal Vel
u=H/2*g*T/L1*(cosh(2*3.14*(z+h)/L1)/cosh(2*3.14*h/L1))*cos(k*x-
(2*3.14/L1)*t);
%Vertical Vel
w=H/2*g*T/L1*(sinh(2*3.14*(z+h)/L1)/cosh(2*3.14*h/L1))*sin(k*x-
(2*3.14/L1)*t);
%Horizontal Acceleration
horiz_acc=3.14*g*H/L1*(cosh(k*z+k*h)/cosh(k*h))*sin(k*x-
((2*3.14)/L1)*t);
%Vertical Acceleration
vert_acc=-3.14*g*H/L1*(sinh(k*z+k*h)/cosh(k*h))*cos(k*x-
((2*3.14)/L1)*t);
%Pressure
pressure=rho*g*H/2*(cosh(k*z+k*h)/cosh(k*h))-rho*g*z;
end
figure
%Velocity Plot
subplot(1,3,1)
plot(u,z,'b')
hold on
plot(w,z,'r')
grid on
legend('u','w')
xlabel('Velocity (m/s)')
ylabel('z (m)')
%Acceleration Plot
subplot(1,3,2)
plot(horiz_acc,z,'g')
hold on
plot(vert_acc,z,'m')
grid on
legend('a_x','a_z')
xlabel('Acceleration (m/s^2)')
%Pressure Plot
subplot(1,3,3)
plot(pressure,z)
grid on
xlabel('Dynamic Pressure (N/m^2)')
% END %

d)
% START %
% parameters given from part a)
H = 1;
T = 12;
h = 20;
L1=152.42;
k = 2*pi/L1;
g=9.81;
rho=1025;
% independent variables
x = 0;
z = -4; % includes an array of z from seafloor to still water line
t = 0:0.1:2*T;
% loop over depth (z array) here and compute all your kinematic
quantities
for i = t+0.1
eta=H/2*cos((2*3.14*x/L1)-(2*3.14*t/L1));
%Horizontal Vel
u=H/2*g*T/L1*(cosh(2*3.14*(z+h)/L1)/cosh(2*3.14*h/L1))*cos(k*x-
(2*3.14/L1)*t);
%Vertical Vel
w=H/2*g*T/L1*(sinh(2*3.14*(z+h)/L1)/cosh(2*3.14*h/L1))*sin(k*x-
(2*3.14/L1)*t);
%Horizontal Acceleration
horiz_acc=3.14*g*H/L1*(cosh(k*z+k*h)/cosh(k*h))*sin(k*x-
((2*3.14)/L1)*t);
%Vertical Acceleration
vert_acc=-3.14*g*H/L1*(sinh(k*z+k*h)/cosh(k*h))*cos(k*x-
((2*3.14)/L1)*t);
%Pressure
pressure=rho*g*H/2*(cosh(k*z+k*h)/cosh(k*h))-rho*g*z;
end
figure
subplot(4,1,1)
plot(eta,t, 'g')
grid on
xlabel('Distance x (m)')
ylabel('eta')
title('Free Surface')
subplot(4,1,2)
plot(u,z,'b')
hold on
plot(w,z,'r')
grid on
legend('u','w')
xlabel('Velocity (m/s)')
ylabel('z (m)')
title('Velocities')
subplot(4,1,3)
plot(horiz_acc,z,'g')
hold on
plot(vert_acc,z,'m')
grid on
legend('a_x','a_z')
xlabel('Acceleration (m/s^2)')
title('Accelerations')
subplot(4,1,4)
plot(pressure,z)
grid on
xlabel('Dynamic Pressure (N/m^2)')
title('Dynamic Pressure')
% End %
