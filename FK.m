clear; clc;
syms theta d a alpha ;
%DH matrix
DH=[cos(theta) -cos(alpha)*sin(theta) sin(alpha)*sin(theta) a*cos(theta);
    sin(theta)  cos(alpha)*cos(theta) -sin(alpha)*cos(theta) a*sin(theta);
    0 sin(alpha) cos(alpha) d;
    0 0 0 1];
f(theta,d,a,alpha)=DH;
q = sym('q',[1 6]);
q=[0,pi/3,0,0,pi/6,0];
d = [0.4 0 0 0.515 0 0.09];
a = [0.025 0.56 0.025 0 0 0];
alpha = [deg2rad(-90) 0 deg2rad(-90) deg2rad(90) deg2rad(-90) 0];
T1=f(q(1),d(1),a(1),alpha(1));
T2=f(q(2),d(2),a(2),alpha(2));
T3=f(q(3),d(3),a(3),alpha(3));
T4=f(q(4),d(4),a(4),alpha(4));
T5=f(q(5),d(5),a(5),alpha(5));
T6=f(q(6),d(6),a(6),alpha(6));
H=T1*T2*T3*T4*T5*T6;
H=simplify(H);
H=double(H)
Px=H(1,4)
Py=H(2,4)
Pz=H(3,4)
nx=H(1,1)
ny=H(2,1)
nz=H(3,1)
sx=H(1,2)
sy=H(2,2)
sz=H(3,2)
rx=H(1,3)
ry=H(2,3)
rz=H(3,3)








