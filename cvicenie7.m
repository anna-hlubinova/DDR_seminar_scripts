% Funkcia T(t) = 24 + 2^(10 - t)
% t je v hodinach od polnoci (t=0 => 0:00)

% cas umrtia (ked T=36.6)
T_dead = 36.6;
t_dead = 10 - log2(T_dead - 24);  % riesenie rovnice (~6.34 hod = 6:20)

% definujeme rozsah casu od casu umrtia po 10:00
t = linspace(t_dead, 10, 400);
T = 24 + 2.^(10 - t);

figure('Units','normalized','Position',[0.2 0.2 0.55 0.55])
hold on
grid on
box on

% vykreslime T(t)
plot(t, T, 'b-', 'LineWidth', 2);

% horizontalna ciara prostredia
yline(24, 'k:', 'LineWidth', 3);

% vertikalne ciary pre 8:00, 9:00 a cas umrtia
xline(8, 'k--', 'LineWidth', 1.2);
xline(9, 'k--', 'LineWidth', 1.2);
xline(t_dead, 'r--', 'LineWidth', 1.5);

% cervene body
plot(t_dead, T_dead, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % cas smrti
plot(9, 26, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'r');          % meranie o 9:00
plot(8, 28, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'r');         % meranie o 8:00

% osi a popisy
xlabel('čas t [hod]', 'FontSize', 14)
ylabel('teplota T(t) [°C]', 'FontSize', 14)

% rozsah osi
xlim([6 10])
ylim([20 38])

% pekne popisky casu na osi x
xticks(6:1:10)
xticklabels({'6:00','7:00','8:00','9:00','10:00'})

% cerveny text pod osou x pri case smrti
text(t_dead, 19.2, '6:20', 'Color','r', 'FontSize',14, 'FontWeight','bold', ...
     'HorizontalAlignment','center')

legend({'T(t)'}, 'Location','northeast')

hold off
