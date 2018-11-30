close all
figure
scatter3(Test(:,1),Test(:,2),Test(:,3))
axis equal
figure
scatter3(Test2(:,1),Test2(:,2),Test2(:,3))
axis equal
Test3=[Test;Test2];
figure
[X,Y,Z] = xyz2grid(Test3(:,1),Test3(:,2),Test3(:,3));
surf(X,Y,Z) 
shading flat
camlight
figure
scatter3(Test3(:,1),Test3(:,2),Test3(:,3))
axis equal