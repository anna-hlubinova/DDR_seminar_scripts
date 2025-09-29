set(groot, 'DefaultAxesFontSize', 14, 'DefaultTextFontSize', 14, 'DefaultLineLineWidth', 2.5);

% Diferenciálna rovnica: (y+x^2y) dx/dy = 2,
% Rodina riešení: y(x) = ± sqrt(4*atan(x) + C)

% rozsah x
x = linspace(-10,10,1000);

% vybrate hodnoty parametra C
C_vals = [1, 3, 6, 10, 15];

figure('Units','normalized','Position',[0.1 0.1 0.6 0.6])
hold on
grid on
box on

specialC = 0;  % špeciálna hodnota

for k = 1:length(C_vals)
    C = C_vals(k);
    f = 4*atan(x) + C;
    mask = f >= 0; % iba tam, kde odmocnina dáva zmysel
    yplus = sqrt(f);
    yminus = -sqrt(f);
    
    plot(x(mask), yplus(mask), 'k-', 'LineWidth', 1.2);
    plot(x(mask), yminus(mask), 'k-', 'LineWidth', 1.2);

end

xlabel('x')
ylabel('y')
xlim([0 10])
ylim([-6 6])
set(gca,'FontSize',12)
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Diferenciálna rovnica: dy/dx = x*y/(x^2+4)
% Rodina riešení: y(x) = A * sqrt(x^2 + 4)

% rozsah x
x = linspace(-10, 10, 800);

% vybrate hodnoty parametra A
A_vals = [-1.5, -1, -0.5, -0.25, 0.25, 0.5, 1];

figure('Units','normalized','Position',[0.1 0.1 0.6 0.6])
hold on
grid on
box on

% --- vykreslime rodinné krivky ---
specialA = -1/2;   % špeciálna hodnota A

for k = 1:length(A_vals)
    A = A_vals(k);
    y = A * sqrt(x.^2 + 4);
    if abs(A - specialA) < 1e-10
        % špeciálna trajektória (červená, hrubá)
        plot(x, y, 'r-', 'LineWidth', 2.5);
        % pridáme popis do grafu
        text(7.8, -3.7, sprintf('A = %.2f', A), ...
             'Color','r','FontSize',12,'FontWeight','bold');
    else
        % ostatné trajektórie (čierne)
        plot(x, y, 'k-', 'LineWidth', 1.2);
    end
end

% --- smerové pole cez celý výrez ---
[X, Y] = meshgrid(linspace(-10,10,25), linspace(-10,10,25));
DX = 1;
DY = (X .* Y) ./ (X.^2 + 4);
L = sqrt(DX.^2 + DY.^2);
quiver(X, Y, DX./L, DY./L, 0.5, 'Color', [0.6 0.6 0.6], 'LineWidth', 0.8)

xlabel('x')
ylabel('y')
% t = title(['$$y(x) = A \cdot \sqrt{x^2+4}$$'])
% set(t,'Interpreter','latex','fontsize',24)
xlim([-10 10])
ylim([-6 6])
set(gca,'FontSize',12)
hold off
