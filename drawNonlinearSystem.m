function drawNonlinearSystem(f, xrange, yrange, sysName, fixedPts)
% Interactive phase portrait pre nelineárny systém

%% Vektorové pole
[xg,yg] = meshgrid(linspace(xrange(1),xrange(2),25), ...
                   linspace(yrange(1),yrange(2),25));
Ug = zeros(size(xg));
Vg = zeros(size(yg));
for i = 1:numel(xg)
    z = [xg(i); yg(i)];
    dz = f(0,z);
    Ug(i) = dz(1);
    Vg(i) = dz(2);
end

figure; hold on; box on

% Vektorové pole
hField = quiver(xg,yg,Ug,Vg,'AutoScale','on','AutoScaleFactor',0.8,'Color',[0.3 0.3 0.3]);

%% Nulové čiary pomocou kontúr
[xc,yc] = meshgrid(linspace(xrange(1),xrange(2),200), ...
                   linspace(yrange(1),yrange(2),200));
F1 = zeros(size(xc));
F2 = zeros(size(yc));
for i = 1:numel(xc)
    dz = f(0,[xc(i); yc(i)]);
    F1(i) = dz(1);
    F2(i) = dz(2);
end

contour(xc,yc,F1,[0 0],'k--','LineWidth',2);
contour(xc,yc,F2,[0 0],'k-.','LineWidth',2);

% fake handles pre legendu
hNull1 = plot(NaN,NaN,'k--','LineWidth',2);
hNull2 = plot(NaN,NaN,'k-.','LineWidth',2);

%% Pevné body (ak sú zadané)
if nargin >= 5 && ~isempty(fixedPts)
    hFixed = plot(fixedPts(:,1), fixedPts(:,2),'go','MarkerFaceColor','g','MarkerSize',6);
else
    hFixed = [];
end

%% Nastavenie osí a popis
axis([xrange yrange]); axis equal manual   % manual -> aby sa okno neposúvalo
xlabel('$x$','Interpreter','latex','FontSize',20);
ylabel('$y$','Interpreter','latex','FontSize',20);
if nargin>3 && ~isempty(sysName)
    title(sysName,'Interpreter','latex','FontSize',24);
end

%% Legenda
legend([hField hNull1 hNull2 hFixed], ...
       {'vektorové pole','$\dot{x}=0$','$\dot{y}=0$','pevné body'}, ...
       'Interpreter','latex','Location','northeast', 'FontSize',16);

%% Callback na kliknutie (trajektória)
set(gca,'ButtonDownFcn',@(src,evt)clickTrajectoryNonlinear(src,evt,f,xrange,yrange))
hold off
end

%% Callback pre trajektórie kliknutím
function clickTrajectoryNonlinear(src,evt,f,xrange,yrange)
coords = get(src,'CurrentPoint'); 
x0 = coords(1,1); 
y0 = coords(1,2);

if x0<xrange(1)||x0>xrange(2)||y0<yrange(1)||y0>yrange(2), return; end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% POZOR toto treba zmenit pre rozne funkcie:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % priklad 1,4
tspanF = [0 1]; 
tspanB = [0 -1];

% % priklad 2, 3
% tspanF = [0 10]; 
% tspanB = [0 -10];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[~,zF] = ode45(f,tspanF,[x0;y0]);
[~,zB] = ode45(f,tspanB,[x0;y0]);

hold on
plot(zF(:,1),zF(:,2),'r-','LineWidth',1.5,'HandleVisibility','off')
plot(zB(:,1),zB(:,2),'r-','LineWidth',1.5,'HandleVisibility','off')
hold off
end
