clc;
clear;

syms x xd y yd z zd phi phid theta thetad psi psid T tau_phi tau_theta tau_psi g m Ix Iy Iz


dX(1:3,1)=[xd, yd, zd];

dX(4:6,1)=[phid, thetad, psid];

% linear accellerations
dX(7:9,1)=[-(cos(psi)*sin(theta)*cos(phi) + sin(psi)*sin(phi))*(T/m)
         -(sin(psi)*sin(theta)*cos(phi) - sin(phi)*cos(psi))*(T/m)
         -(cos(theta)*cos(phi)*(T/m))+g];

% angular accelerations
dX(10:12,1)=[tau_phi/Ix; tau_theta/Iy; tau_psi/Iz];

A = jacobian(dX, [x y z phi theta psi xd yd zd phid thetad psid])
A = subs(A, [x y z phi theta psi xd yd zd phid thetad psid T tau_phi tau_theta tau_psi], ...
    [0 0 -1 0 0 0 0 0 0 0 0 0 m*g 0 0 0])

B = jacobian(dX, [T tau_phi tau_theta tau_psi]);
B = subs(B, [x y z phi theta psi xd yd zd phid thetad psid], [0 0 -1 0 0 0 0 0 0 0 0 0])

%%
% subs with numerical values

% g = 9.81; % gravitational accelleration
% 
% m = 1.2; % mass
% 
% Ix = 2.353 * exp(-3); % inertia along x-axis
% Iy = 2.353 * exp(-3); % inertia along y-axis
% Iz = 5.262 * exp(-2); % inertia along z-axis

A = double(subs(A, [g m Ix Iy Iz], [9.81 1.2 2.353*exp(-3) 2.353*exp(-3) 5.262*exp(-2)]))
B = double(subs(B, [g m Ix Iy Iz], [9.81 1.2 2.353*exp(-3) 2.353*exp(-3) 5.262*exp(-2)]))

save("linearized_system.mat", "A", "B")