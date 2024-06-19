function [x, y, z] = geodeticToEcef(phi, lambda, h, a, b, e_squared)
    % 大地坐标转地心地固直角坐标
    sin_phi = sind(phi);
    cos_phi = cosd(phi);
    sin_lambda = sind(lambda);
    cos_lambda = cosd(lambda);
    
    N = a / sqrt(1 - e_squared * sin_phi^2); % 卯酉圈曲率半径
    x = (N + h) * cos_phi * cos_lambda;
    y = (N + h) * cos_phi * sin_lambda;
    z = ((1 - e_squared) * N + h) * sin_phi;
end