clc;

load('../linearized_system.mat')

C = zeros(4,12);
C(1,1) = 1;
C(2,2) = 1;
C(3,3) = 1;
C(4,6) = 1;

D = zeros(size(C,1), size(B,2));

Q = eye(size(A)); % state cost
R = 0.01; % control cost 

K = -lqr(A, B, Q, R);
eig_controller = eig(A+B*K);

L = -lqr(A', C', Q, R);
L = L';

eig_observer = eig(A+L*C);

u_bar = m*g; % feedforward 

% build continuos time observer model
A_obs = A + B*K + L*C;
B_obs = L;
C_obs = eye(12,12);
D_obs = zeros(12, 4);
sys_obs = ss(A_obs, B_obs, C_obs, D_obs);


%% discrete time 

Ts = SampleTime; % sample time

obs_DT = c2d(sys_obs, Ts, 'zoh'); % discrete time observer model