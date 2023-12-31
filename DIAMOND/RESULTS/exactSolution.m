%% PLOT DIAMOND SOLUTION

%% create line in domain
np = 1000;

p1 = [0 0.2];
p2 = [2 0.2];

% p1 = [0.13 0.4];
% p2 = [1.3 -0.02];

ss = linspace(0,1,np)';
p12 = p2-p1;
l = norm(p12);
pp = p1 + ss.*p12;

x = pp(:,1);
y = pp(:,2);

%% get solution on line

% exact
M = zeros(size(x));

for i = 1:np
   M(i) = getM(x(i),y(i)); 
end

% read SU2
T1 = readtable('coarse.csv');
T2 = readtable('medium.csv');
T3 = readtable('fine.csv');

%% plot
figure;
plot(x,M,'--k','linew',1.3);

hold on;
plot(T1.Points_0,T1.Mach,'r','linew',1.3);
plot(T2.Points_0,T2.Mach,'b','linew',1.3);
plot(T3.Points_0,T3.Mach,'k','linew',1.3);

tx = xlabel('$x$');
ty = ylabel('$Mach$');
tz = legend('Exact','coarse','medium','fine');

legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
tz.Interpreter='latex';
tz.Location='best';
set(gca,'TickLabelInterpreter', 'latex');
x0=10000;
y0=1000;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;
grid on; box on; hold on;
% ylim([-0.2,3]);
% xlim([-0.5,2.5]);

%% functions

function M = getM(x,y)

% freestream conditions and data
M0 = 2;
M1 =  1.37284236;
M2 =  2.60856512;
M3 =   1.88207577;

theta0 = 0;
theta1 = 16.6992;
theta2 = -16.6992;
theta3 = 0;

a0 =  47.7507207;
a1 = 46.7537448 + theta1;
a2 =  22.5415004 + theta2;
a3 =  37.5891831 - theta1;

mu = @(M) asind(1./M);
w = @(M) sqrt(2.4/0.4)*atan(sqrt((0.4/2.4)*(M.*M-1)))-atan(sqrt(M.*M-1));

% left of LE shock
if atan2d(y,x) >= a0
    M = M0;
elseif atan2d((y-0.15),(x-0.5)) > a1 % left of first fan wave
        M = M1;
elseif atan2d((y-0.15),(x-0.5)) > a2 % in fan
    f = @(M) atan2d((y-0.15),(x-0.5)) - theta1 - 8.2086 + rad2deg(w(M)) - mu(M);
    M = fsolve(f,2);
elseif atan2d((y),(x-1)) > a3 % left of TE shock
    M = M2;
else
    M = M3;
end
    
    
end


