clc;

load('../linearized_system.mat')

% build extended system 
 
C = zeros(4,12);
C(1,1) = 1;
C(2,2) = 1;
C(3,3) = 1;
C(4,6) = 1;

D = zeros(size(C,1), size(B,2));

Ae = [A zeros(12, 4); -C zeros(4, 4)];
Be = [B; zeros(4, 4)];

size(ctrb(Ae, Be))
rank(ctrb(Ae, Be))

E = eye(size(Ae)); % state cost
R = 0.01; % control cost

Ke = -lqr(Ae, Be, E, R);

KP = Ke(:, 1:12)
KI = Ke(:, 13:end)

eigCLsys = eig([A+B*KP B*KI; -C zeros(size(C, 1), size(B*KI, 2))])