% % Priklad 1
f = @(t,z) [10*z(1)-5*z(1)*z(2); 3*z(2)+z(1)*z(2)-3*z(2)^2];
drawNonlinearSystem(f, [-5 6], [-3 6], ...
    '$\dot{x}=10x-5xy,\;\dot{y}=3y+xy-3y^2$', ...
    [0 0; 0 1; 3 2]);

% % Priklad 2
% f = @(t,z) [ z(2) ; -sin(z(1)) - 0.5*z(2) ];
% fixedPts = [ -3*pi 0;
%              -2*pi   0;
%              -pi   0;
%               0    0;
%               pi   0;
%               2*pi   0;
%               3*pi 0 ];
% drawNonlinearSystem(f, [-3*pi 3*pi], [-5 5], ...
%     '$ \dot{x} = y,\;\; \dot{y} = -\sin(x) - \frac{1}{2}y $', ...
%     fixedPts);
% 
% % Priklad 3
% f = @(t,z) [ z(2) ; -sin(z(1))];
% fixedPts = [ -3*pi 0;
%              -2*pi   0;
%              -pi   0;
%               0    0;
%               pi   0;
%               2*pi   0;
%               3*pi 0 ];
% drawNonlinearSystem(f, [-3*pi 3*pi], [-5 5], ...
%    '$ \dot{x} = y,\;\; \dot{y} = -\sin(x) $', ...
%     fixedPts);
% 
% % % Priklad 4
% f = @(t,z) [z(1)*(5-z(1)^2-z(2)) ; 4*(z(1)^2-4)];
% drawNonlinearSystem(f, [-6 6], [-3 6], ...
%     '$\dot{x}=x(5-x^2-y),\;\dot{y}=4(x^2-4)$', ...
%     [2 1; -2 1]);
