clear;
clc;
GPS0 = '2006-01-01 00:00:00'; %BD 起始时间
t1 = datetime(GPS0,'InputFormat','yyyy-MM-dd HH:mm:ss');
N = input('请输入UTC时间（e.g.yyyy-MM-dd HH:mm:ss）:', 's');    %输入当前时间
t2= datetime(N,'InputFormat','yyyy-MM-dd HH:mm:ss');
s=t2-t1; %计算时间差，单位s
s=seconds(s);
s=s+4;
weeks=floor(s/604800);
sec=mod(s,604800);
fprintf('BD Weeks  %d\n', weeks);
fprintf('BD Seconds  %d\n', sec);