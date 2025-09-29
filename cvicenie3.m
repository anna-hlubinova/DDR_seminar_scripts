% Replikacia grafov: kyvadlo bez rezonancie (homogenne) a s rezonanciou (a=1)
n = 0:30;

% Homogenne riesenie pre x(n+2)+x(n)=0 s x(0)=1, x(1)=2
x_h = cos(n*pi/2) + 2*sin(n*pi/2);

% Riesenie pre a = 1 (rezonancia), analyticky:
% x(n) = (2-n)/2 * cos(n*pi/2) + 2 * sin(n*pi/2)
x_res = ((2 - n)/2) .* cos(n*pi/2) + 2 .* sin(n*pi/2);

% Vykreslenie
figure('Position',[100 100 1000 380]);

% Homogenne (bez rezonancie)
subplot(1,2,1)
stem(n, x_h, 'filled', 'MarkerSize',6)
hold on
plot([n(1) n(end)], [0 0], 'k:') % nula
hold off
title('x(n) - homogénne riešenie (bez rezonancie)')
xlabel('n')
ylabel('x(n)')
axis([ -1 31 -2.5 2.5 ])
set(gca,'XTick',0:5:30)
grid on

% Rezonancia (a = 1)
subplot(1,2,2)
stem(n, x_res, 'filled', 'MarkerSize',6)
hold on
plot([n(1) n(end)], [0 0], 'k:') % nula
hold off
title('x(n) - s rezonanciou (a = 1)')
xlabel('n')
ylabel('x(n)')
axis([ -1 31 -16 16 ])
set(gca,'XTick',0:5:30)
grid on

