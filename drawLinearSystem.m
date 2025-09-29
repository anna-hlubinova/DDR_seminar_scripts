function drawLinearSystem(A, xrange, yrange, sysName)
% Interactive phase portrait pre system \dot{z} = A z
%
% Inputs:
%   A       ... 2x2 matica systému
%   xrange  ... [xmin xmax]
%   yrange  ... [ymin ymax]
%   sysName ... string s LaTeX zápisom systému (napr. '$\dot{x}=x+y,\;\dot{y}=4x+y$')

f = @(t,z) A*z;

%% Vektorové pole
[xg,yg] = meshgrid(linspace(xrange(1),xrange(2),25), ...
                   linspace(yrange(1),yrange(2),25));
Ug = A(1,1)*xg + A(1,2)*yg;
Vg = A(2,1)*xg + A(2,2)*yg;

figure('Units','centimeters','Position',[2 2 20 20]); % ľavý dolný roh X,Y a šírka×výška
hold on; box on

hField = quiver(xg,yg,Ug,Vg,'AutoScale','on','AutoScaleFactor',0.8,'Color',[0.3 0.3 0.3]);

%% Nulové čiary
t = linspace(xrange(1), xrange(2), 200);
hNull = gobjects(2,1);

% \dot{x}=0
if A(1,2) ~= 0
    yline1 = -(A(1,1)/A(1,2))*t;
    hNull(1) = plot(t, yline1, 'k--','LineWidth',2);
elseif A(1,1) ~= 0
    hNull(1) = plot([0 0], yrange, 'k--','LineWidth',2);
end

% \dot{y}=0
if A(2,2) ~= 0
    yline2 = -(A(2,1)/A(2,2))*t;
    hNull(2) = plot(t, yline2, 'k-.','LineWidth',2);
elseif A(2,1) ~= 0
    hNull(2) = plot([0 0], yrange, 'k-.','LineWidth',2);
end

%% Vlastné vektory (iba reálne)
[V,D] = eig(A);
eigvals = diag(D);
realIdx = abs(imag(eigvals)) < 1e-10;   % len reálne vlastné hodnoty
Vreal = V(:,realIdx);

hEig = [];
if ~isempty(Vreal)
    eigColor = [0 0 1];
    scale = 0.8 * max(diff(xrange), diff(yrange));
    tLine = linspace(-scale, scale, 200);

    for i = 1:size(Vreal,2)
        v = Vreal(:,i)/norm(Vreal(:,i));
        lineX = tLine*v(1);
        lineY = tLine*v(2);
        hLine = plot(lineX,lineY,'Color',eigColor,'LineWidth',2.2);
        hEig = [hEig hLine]; %#ok<AGROW>

        % šípky z oboch strán
        arrowLength = 0.15*scale;
        quiver(0,0,  arrowLength*v(1),  arrowLength*v(2),0,...
               'Color',eigColor,'LineWidth',2.2,'MaxHeadSize',0.6,'HandleVisibility','off');
        quiver(0,0, -arrowLength*v(1), -arrowLength*v(2),0,...
               'Color',eigColor,'LineWidth',2.2,'MaxHeadSize',0.6,'HandleVisibility','off');
    end
end

%% Nastavenie osí a popis
% nastavenie rozsahu s malým marginom (napr. 5%)
axis([xrange yrange]); 
axis equal

xlabel('$x$','Interpreter','latex','FontSize',20)  % zvýšený font
ylabel('$y$','Interpreter','latex','FontSize',20)  % zvýšený font

if nargin>3 && ~isempty(sysName)
    title(sysName,'Interpreter','latex','FontSize',24)  % väčší nadpis
end

%% Legenda
legItems = [];
legText  = {};

if isgraphics(hField)
    legItems(end+1) = hField;
    legText{end+1} = 'vektorové pole';
end
if isgraphics(hNull(1))
    legItems(end+1) = hNull(1);
    legText{end+1} = '$\dot{x}=0$';
end
if isgraphics(hNull(2))
    legItems(end+1) = hNull(2);
    legText{end+1} = '$\dot{y}=0$';
end
if ~isempty(hEig) && all(isgraphics(hEig))
    legItems(end+1) = hEig(1);  % stačí jeden handle
    legText{end+1} = 'vlastné vektory';
end

L = legend(legItems, legText, 'Interpreter','latex','Location','northeast');
set(L,'EdgeColor','k','LineWidth',1.2,'FontSize',16,'Color',[0.95 0.95 0.95]);  % väčší font legendy

xlim(xrange)
ylim(yrange)

%% Callback na kliknutie (trajektória)
set(gca,'ButtonDownFcn',@(src,evt)clickTrajectory(src,evt,f,xrange,yrange))
hold off
end

%% Pomocná funkcia pre trajektórie
function clickTrajectory(src,evt,f,xrange,yrange)
coords = get(src,'CurrentPoint');
x0 = coords(1,1);
y0 = coords(1,2);

if x0 < xrange(1) || x0 > xrange(2) || y0 < yrange(1) || y0 > yrange(2)
    return
end

tspanF = [0 15];
tspanB = [0 -15];
[~,zF] = ode45(f,tspanF,[x0;y0]);
[~,zB] = ode45(f,tspanB,[x0;y0]);

hold on
plot(zF(:,1),zF(:,2),'r-','LineWidth',1.5,'HandleVisibility','off')
plot(zB(:,1),zB(:,2),'r-','LineWidth',1.5,'HandleVisibility','off')
hold off
end

