function [phi, lambda, h] = ecefToGeodetic(x, y, z, a, b, e_squared, tol, max_iter)
    % 地心地固直角坐标转大地坐标，使用迭代法求解
    tol = tol/100; % 精度调整，假设原始tol以百分比给出
    p = sqrt(x^2 + y^2);
    phi_0 = atan(z/(p*(1 - e_squared))); % 初始纬度估计
    % N = a / sqrt(1 - e_squared * sind(phi_0)^2);
    % h = p/cosd(phi_0) - N;
    for iter = 1:max_iter
        N = a / sqrt(1 - e_squared * sind(phi_0)^2);
        h_0 = p/cosd(phi_0) - N;
        phi_new = atan(z/(p*(1 - e_squared*N/(N+h_0))));
        
        % 检查收敛
        if abs(phi_new - phi_0) < tol
            break;
        end
        
        phi_0 = phi_new;
    end
    
    lambda = atan2(y, x);
    h = p/cosd(phi_new) - N;
    
    % 返回结果
    phi = phi_new* 180/pi;
    lambda = lambda * 180/pi; % 转换为度
end
