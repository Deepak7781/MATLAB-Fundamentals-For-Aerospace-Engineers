function aerospace_coordinate_demo

% Define Euler angles in radians
phi = deg2rad(10);
theta = deg2rad(20);
psi = deg2rad(30);

alpha = deg2rad(5);
beta = deg2rad(2);

R1_mat = R1(phi);
R2_mat = R2(theta);
R3_mat = R3(psi);

C_B_I = R3_mat * R2_mat * R1_mat;

C_I_B = C_B_I';

C_W_B = R2(-alpha) * R3(-beta);

omega = [0.1; 0.2; 0.3];

omega_x = skew(omega);

v = [1; 2; 3];

omega_cross_v = omega_x * v;

end

