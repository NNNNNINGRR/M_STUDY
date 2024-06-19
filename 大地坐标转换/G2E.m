%大地坐标系的坐标地心地固直角坐标系(ECEF)
a = 6378137; % 地球长半径
b = 6356752.3142; % 地球短半径
e_squared = (a^2 - b^2) / a^2; % 椭球偏心率平方
%请求用户输入地心地固直角坐标
coord_input = input('请输入x, y, z坐标，用逗号分隔: ', 's');

% 使用textscan函数解析输入字符串
formatSpec = '%f,%f,%f'; % 定义输入格式
coord_txt = textscan(coord_input, formatSpec);

% 获取解析后的坐标值
x = coord_txt{1};
y = coord_txt{2};
z = coord_txt{3};

% 确保输入有效且解析成功
if ~isempty(coord_txt{1}) && ~isempty(coord_txt{2}) && ~isempty(coord_txt{3})
    disp(['输入的坐标为：(', num2str(x), ', ', num2str(y), ', ', num2str(z), ')']);
else
    error('输入格式不正确，请确保输入的是三个用逗号分隔的数字。');
end

% 请求用户输入最大迭代次数
max_iter = input('请输入最大迭代次数: ');
% 请求用户输入迭代精度（这里以米为单位举例，实际根据需要调整）
tol_meters = input('请输入迭代精度（单位：米）: ');
% a是地球的半长轴，用于将米转换为与地球坐标系匹配的比例
tol = tol_meters / a; 

% 地心地固直角坐标转大地坐标
[phi_t, lambda_t, h_t] = ecefToGeodetic(x, y, z, a, b, e_squared, tol, max_iter);

fprintf('大地坐标系的坐标地心地固直角坐标系(ECEF):\n');
fprintf('大地坐标转地心地固直角坐标:\n');
fprintf('x = %f, y = %f, z = %f\n', x, y, z);
fprintf('地心地固直角坐标转大地坐标:\n');
fprintf('纬度 = %f°, 经度 = %f°, 高度 = %f\n', phi_t, lambda_t, h);
