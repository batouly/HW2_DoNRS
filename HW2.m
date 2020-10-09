clear; clc; 
q = sym('q',[1 6]);
[T06,R03,R36]=FK_HW2(q)
q=[0 0 0 pi/3 pi/6 pi];
[T06,R03,R36]=FK_HW2(q);
d = [0.4 0 0 0.515 0 .09];
a = [0.025 0.56 0.025 0 0 0];
O_c=T06*[0;0;0;1]-0.09*T06(1:4,1);
x_c = O_c(1);
y_c = O_c(2);
z_c = O_c(3);

q1_front = atan2(y_c, x_c);
%q1_behind = pi + atan2(y_c, x_c);

% front case
r = sqrt(x_c^2 + y_c^2) - a(1);
s = z_c - d(1);
D = (r^2 + s^2 - d(4)^2 - a(3)^2 - a(2)^2) / (2 * a(2) * sqrt(d(4)^2 + a(3)^2)); % cos(phi)
gamma = atan2(d(4), a(3));

q3_up = atan2(sqrt(1 - D^2), D) - gamma;
q3_down = atan2(-sqrt(1 - D^2), D) - gamma;


B = sqrt(1 - D^2) * sqrt((d(4)^2 + a(3)^2 ) / (r^2 + s^2)); % sin(alpha) - can be positive (q3_up) or negative (q3_down)
beta = atan2(s, r);

q2_up = -(atan2(B, sqrt(1 - B^2)) + beta);
q2_down = -(atan2(-B, sqrt(1 - B^2)) + beta);
q2_up=pi/2+q2_up;
q2_down=pi/2+q2_down;

q4 = atan2(R36(2,1),-R36(3,1));
q5 = atan2(sqrt(R36(1,2)^2+R36(1,3)^2), R36(1,1));
q6 = atan2(R36(1,2), R36(1,3));


q_fu = [q1_front, q2_up, q3_up q4 q5 q6];
q_fd = [q1_front, q2_down, q3_down q4 q5 q6];
q_fu=rad2deg(q_fu)
q_fd=rad2deg(q_fd)

