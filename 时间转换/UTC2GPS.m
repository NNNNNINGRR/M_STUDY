clear;
clc;
GPS0 = '1980-01-06 00:00:00'; %GPS 起始时间
t1 = datetime(GPS0,'InputFormat','yyyy-MM-dd HH:mm:ss');
N = input('请输入UTC时间（e.g.yyyy-MM-dd HH:mm:ss）:', 's');    %输入当前时间
t2= datetime(N,'InputFormat','yyyy-MM-dd HH:mm:ss');
s=t2-t1; %计算时间差，单位s
s=seconds(s);
s=s+18;
weeks=floor(s/604800);
if(weeks>2047)
    weeks=weeks-2048;
elseif(weeks>1023)
    weeks=weeks-1024;
end
sec=mod(s,604800);
fprintf('GPS Weeks  %d\n', weeks);
fprintf('GPS Seconds  %d\n', sec);