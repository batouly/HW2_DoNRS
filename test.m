 formatSpec = '%f';
sizeA = [6 Inf];
fileID = fopen('test.txt','r');
A = fscanf(fileID,formatSpec,sizeA);
A=transpose(A);
A=deg2rad(A);
for i=1:2
    T=FK_HW2(A(i,:));
end