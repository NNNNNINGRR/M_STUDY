clear;
clc;
GPS0 = '2006-01-01 00:00:00'; %BD 起始时间
t1 = datetime(GPS0,'InputFormat','yyyy-MM-dd HH:mm:ss');
weeks = input('请输入BD周:');
seconds= input('请输入BD秒:');
seconds1=604800*weeks+seconds+4;
day=floor(seconds1/86400);
msec=mod(seconds1-day*86400,86400);
hr=floor(msec/3600);
min=floor(mod(msec,3600)/60);
sec=seconds-86400*floor(seconds/86400)-3600*hr-60*min-4;
t2=t1+days(day);
fprintf('UTC %s',t2);
TIME = ' %d时 %d分 %d秒\n';
fprintf(TIME,hr,min,sec);
