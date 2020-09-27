clear; clc;
syms theta d a alpha ;
DH=[cos(theta) -cos(alpha)*sin(theta) sin(alpha)*sin(theta) a*cos(theta);
    sin(theta)  cos(alpha)*cos(theta) -sin(alpha)*cos(theta) a*sin(theta);
    0 sin(alpha) cos(alpha) d;
    0 0 0 1];
f(theta,d,a,alpha)=DH;
q = sym('q',[1 6]);
d = [0.4 0 0 0.515 0 0.09];
a = [0.025 0.56 0.025 0 0 0];
alpha = [deg2rad(-90) 0 deg2rad(-90) deg2rad(90) deg2rad(-90) 0];
T1=f(q(1),d(1),a(1),alpha(1));
T2=f(q(2),d(2),a(2),alpha(2));
T3=f(q(3),d(3),a(3),alpha(3));
T4=f(q(4),d(4),a(4),alpha(4));
T5=f(q(5),d(5),a(5),alpha(5));
T6=f(q(6),d(6),a(6),alpha(6));
%transformation between frame 6 and 5
T56=[1 0 0 0;0 1 0 0;0 0 1 0.09;0 0 0 1];
%transformation matrix for q=[]
T06=[   
         0         0   -1.0000   -0.2185;
         0   -1.0000         0         0;
   -1.0000         0         0   -0.3641;
         0         0         0    1.0000];
T05=T06*inv(T56);
P05=T05*[0;0;0;1];
P04=P05;
E=simplify(T1*T2*T3*T4*[0;0;0;1]);
%solving 3 equations using vrasolve function 
syms q1 q2 q3
E1=E(1)==P04(1);
E2=E(2)==P04(2);
E3=E(3)==P04(3);
[q1,q2,q3]=vpasolve(E1,E2,E3,q1,q2,q3)
T1=f(q1,d(1),a(1),alpha(1));
T2=f(q2,d(2),a(2),alpha(2));
T3=f(q3,d(3),a(3),alpha(3));
T4=f(q(4),d(4),a(4),alpha(4));
T5=f(q(5),d(5),a(5),alpha(5));
T6=f(q(6),d(6),a(6),alpha(6));
T03=T1*T2*T3;% after supstituting q1,q2,q3
T36=T4*T5*T6;
T36=simplify(T36);
R36=T36(1:3,1:3);%f(q4,q5,q6)
R03=T03(1:3,1:3);
R06=T06(1:3,1:3);
R36n=inv(R03)*R06;
%using euler equations
q4=atan2(-R36n(2,3),-R36n(1,3))
q5=atan2(sqrt(R36n(1,3)^2+R36n(2,3)^2),R36n(3,3))
q6=atan2(-R36n(3,2),R36n(3,1))






















