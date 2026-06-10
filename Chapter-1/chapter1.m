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

omega_cross_v_builtin = cross(omega, v);

% Display results  
disp('Direction cosine matrix C_{B<-I}:');  
disp(C_B_I);  
disp('Inverse transform C_{I<-B}:');  
disp(C_I_B);  
disp('Direction cosine matrix C_{W<-B}:');  
disp(C_W_B);  disp('Skew symmetric matrix [omega]_x:');  
disp(omega_x);  
disp('omega_x * v:');  
disp(omega_cross_v);  
disp('cross(omega, v):');  
disp(omega_cross_v_builtin); 



end

function R = R1(phi)
    R = [1 0 0; 
        0 cos(phi) sin(phi);
        0 -sin(phi) cos(phi)];
end

function R = R2(theta)
    R = [cos(theta) 0 -sin(theta);
         0 1 0;
         sin(theta) 0 cos(theta)];
end

function R = R3(psi)
    R = [cos(psi) sin(psi) 0;
         -sin(psi) cos(psi) 0;
         0 0 1];
end

function S = skew(w)
p = w(1);
q = w(2);
r = w(3);

S = [0 -r -q; r 0 -p; -q p 0];

end