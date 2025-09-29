% Priklad 1
A = [1 1; 4 1];
drawLinearSystem(A,[-5 5],[-5 5],'$\dot{x}=x+y,\;\dot{y}=4x+y$')

% Priklad 2
A2 = [-3 sqrt(2); sqrt(2) -2];
drawLinearSystem(A2, [-5 5], [-5 5], '$\dot{x} = -3x + \sqrt{2}y,\;\dot{y} = \sqrt{2}x-2y$');

% Priklad 3
A3 = [-0.5 1; -1 -0.5];
drawLinearSystem(A3, [-5 5], [-5 5], '$\dot{x} = -\frac{1}{2}x + y,\; \dot{y} = -x-\frac{1}{2}y$');

% Priklad 4
A4 = [0 1; -5 0];
drawLinearSystem(A4, [-4 4], [-4 4], '$\dot{x} = y,\; \dot{y} = -5x$');

% Priklad 5
A5 = [7 1; -4 3];
drawLinearSystem(A5, [-4 4], [-4 4], '$\dot{x} = 7x + y,\; \dot{y} = -4x +3y$');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dalsie priklady

% Priklad 1
A6 = [-1 1; -6 0];
drawLinearSystem(A6, [-4 4], [-4 4], '$\dot{x} = -x+y,\; \dot{y} = -6x$');

% Priklad 2
A7 = [3 -0.5; -3 1];
drawLinearSystem(A7, [-4 4], [-4 4], '$\dot{x} = 3x - \frac{1}{2}y,\; \dot{y} = -3x+y$');

% Priklad 3
A8 = [1 -2; 0 0.5];
drawLinearSystem(A8, [-4 4], [-4 4], '$\dot{x} = x - 2y,\; \dot{y} =  \frac{1}{2}y$');

% Priklad 4
A9 = [-2/3 -1; 2 2/3];
drawLinearSystem(A9, [-4 4], [-4 4], '$\dot{x} = -\frac{2}{3}x - y,\; \dot{y} =  2x + \frac{2}{3}y$');

% Priklad 5
A10 = [7 -4; 10 -5];
drawLinearSystem(A10, [-10 10], [-10 10], '$\dot{x} = 7x - 4y,\; \dot{y} =  10x -5y$');
% 
% Priklad 6
A11 = [2 1; -1 4];
drawLinearSystem(A11, [-5 5], [-5 5], '$\dot{x} = 2x + y,\; \dot{y} = -x +4y$');

% Priklad 7
A12 = [2 1; 3 4];
drawLinearSystem(A12, [-5 5], [-5 5], '$\dot{x} = 2x + y,\; \dot{y} = 3x +4y$');

% Priklad 8
A13 = [1 -2; 0 1];
drawLinearSystem(A13, [-5 5], [-5 5], '$\dot{x} = x -2y,\; \dot{y} = y$');

% Priklad 9
A14 = [-3 2; 0 5];
drawLinearSystem(A14, [-5 5], [-5 5], '$\dot{x} = -3x + 2y,\; \dot{y} = 5y$');

