%地心地固直角坐标系(ECEF)的坐标转换到大地坐标系
a = 6378137; % 地球长半径
b = 6356752.3142; % 地球短半径
e_squared = (a^2 - b^2) / a^2; % 椭球偏心率平方


phi = deg2rad(input('请输入纬度（度）: '));
lambda = deg2rad(input('请输入经度（度）: '));
h = input('请输入高度（单位：米）: ');
[x, y, z] = geodeticToEcef(phi, lambda, h, a, b, e_squared);

fprintf('地心地固直角坐标系(ECEF)的坐标转换到大地坐标系:\n');
fprintf('大地坐标转地心地固直角坐标:\n');
fprintf('x = %f, y = %f, z = %f\n', x, y, z);
fprintf('地心地固直角坐标转大地坐标:\n');
fprintf('纬度（弧度） = %f°, 经度（弧度） = %f°, 高度 = %f\n', phi, lambda, h);