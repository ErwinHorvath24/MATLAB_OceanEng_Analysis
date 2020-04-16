% Erwin Horvath
% Tides & Currents Homework
% 10/02/2017
% Station HomePage: https://www.tidesandcurrents.noaa.gov/stationhome.html?id=9751364
 
%Annual 2016-2017
Tide_A=xlsread('Tides_9-16_9-17.xlsx','D:D'); % Load data from NOAA tides for one year
T_A=0:0.3968:365; % 365 days = 1 year
Time_A=T_A'; %Transpose
 
%Semi-Annual 
Tide_SA=xlsread('Tides_Semi-Annual-9-28-16_3-28-2017','D:D'); % Load data from NOAA tides for six months
T_SA=0:0.397:182; % 182 days = 6 months
Time_SA=T_SA'; %Transpose
 
% Month in Spring
Tide_SM=xlsread('Tide_SpringMonth_3-28-2017_4-28-2017', 'D:D'); % Load data from NOAA tides for one month
T_SM=0:0.342:30; % 30 days = 1 month
Time_SM=T_SM';
 
% Month in Autumn
Tide_AM=xlsread('Tide_Month_8-28-17_9-28-17', 'D:D'); % Load data from NOAA tides for one month
T_AM=0:0.35:30; % 30 days = 1 month
Time_AM=T_AM';
 
% Graph 1 annual:
figure
plot(Time_A, Tide_A, 'b'); % plot
hline = refline([0 0]); % reference line
hline.Color = 'r'; % Colorline 
xlabel('Time [Days]','fontweight','bold','fontsize',16)
ylabel('Depth Fluctuation [meters]','fontweight','bold','fontsize',16)
title('Annual Tide Heights vs. Time','fontweight','bold','fontsize',25)
grid minor
legend('Tides @ Christiansted Harbor, St Croix (9-2016 to 9-2017) U.S. Virgin Islands','Reference @ 0')
[Z,P]=ginput(4);
MWL=abs(P(1)-P(2));
 
% Graph 2 semiannual:
figure
plot(Time_SA, Tide_SA, 'b');
hline = refline([0 0]); % reference line
hline.Color = 'r'; % Colorline 
xlabel('Time [Days]','fontweight','bold','fontsize',16)
ylabel('Depth Fluctuation [meters]','fontweight','bold','fontsize',16)
title('Semi-Annual Tide Heights vs. Time','fontweight','bold','fontsize',25)
grid minor
legend('Tides @ Christiansted Harbor, St Croix (8-28-2016 to 3-28-2017) U.S. Virgin Islands','Reference @ 0')
[V,E]=ginput(4);
MWL_2=abs(E(1)-E(2));
 
% Graph 3 SPRING month:
figure
plot(Time_SM, Tide_SM, 'b');
hline = refline([0 0]); % reference line
hline.Color = 'r'; % Colorline 
xlabel('Time [Days]','fontweight','bold','fontsize',16)
ylabel('Depth Fluctuation [meters]','fontweight','bold','fontsize',16)
title('Spring Month Tide Heights vs. Time','fontweight','bold','fontsize',25)
grid minor
legend('Tides @ Christiansted Harbor, St Croix (3-28-2017 to 4-28-2017) U.S. Virgin Islands','Reference @ 0')
[W,F]=ginput(4);
MWL_3=abs(F(1)-F(2));
 
% Graph 4 AUTUMN month:
figure
plot(Time_AM, Tide_AM, 'b');
hline = refline([0 0]); % reference line
hline.Color = 'r'; % Colorline 
xlabel('Time [Days]','fontweight','bold','fontsize',16)
ylabel('Depth Fluctuation [meters]','fontweight','bold','fontsize',16)
title('Autumn Month Tide Heights vs. Time','fontweight','bold','fontsize',25)
grid minor
legend('Tides @ Christiansted Harbor, St Croix (8-28-2017 to 9-28-2017) U.S. Virgin Islands','Reference @ 0')
[Y,G]=ginput(4);
MWL_4=abs(G(1)-G(2));
 
distFig('Rows',2,'Columns',2);
 
fprintf('The MWL obtained from the annual graph is: %0.2f meters. \n', MWL)
fprintf('The MWL obtained from the semi-annual graph is: %0.2f meters. \n', MWL_2)
fprintf('The MWL obtained from the spring month graph is: %0.2f meters. \n', MWL_3)
fprintf('The MWL obtained from the autumn month graph is: %0.2f meters. \n', MWL_4)
