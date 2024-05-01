% fs = 1000;
% t = 724.35;
% lfp = CeADir;
% 
% lfp = lfp((t*fs):((t+30)*fs));
% plot(lfp)

% % 0-4 Hz (delta)
% frange = 0:0.01:4;
% pxx = periodogram(lfp, [], frange, fs);
% % periodogram(lfp, [], frange, fs)
% resultado(1,1) = sum(pxx);
% 
% % 4-10 Hz (theta)
% frange = 4:0.01:10;
% pxx = periodogram(lfp, [], frange, fs);
% % periodogram(lfp, [], frange, fs)
% resultado(1,2) = sum(pxx);
% 
% % 10-30 Hz (beta)
% frange = 10:0.01:30;
% pxx = periodogram(lfp, [], frange, fs);
% % periodogram(lfp, [], frange, fs)
% resultado(1,3) = sum(pxx);
% 
% % 30-80 Hz (gama)
% frange = 30:0.01:80;
% pxx = periodogram(lfp, [], frange, fs);
% % periodogram(lfp, [], frange, fs)
% resultado(1,4) = sum(pxx);
% 
% % 80-200 Hz (fast)
% frange = 80:0.01:200;
% pxx = periodogram(lfp, [], frange, fs);
% % periodogram(lfp, [], frange, fs)
% resultado(1,5) = sum(pxx);
% 
% % 200-600 Hz (ultra fast)
% frange = 200:0.01:600;
% pxx = periodogram(lfp, [], frange, fs);
% % periodogram(lfp, [], frange, fs)
% resultado(1,6) = sum(pxx);

% 200-500 Hz (ultra fast - considering fs = 1000 Hz)
fs = 2000;
lfp = CeADir;

frange = 200:0.01:500;

% 10 min
t = 1783;
lfp1 = lfp((t*fs):((t+30)*fs));
plot(lfp1)
pxx = periodogram(lfp1, [], frange, fs);
resultado(1,1) = sum(pxx);

% % 5 min
% t = 1650.26;
% lfp2 = lfp((t*fs):((t+30)*fs));
% pxx = periodogram(lfp2, [], frange, fs);
% resultado(1,2) = sum(pxx);
% 
% % 2,75 min
% t = 1785.26;
% lfp3 = lfp((t*fs):((t+30)*fs));
% pxx = periodogram(lfp3, [], frange, fs);
% resultado(1,3) = sum(pxx);
% 
% % 1 min
% t = 1890.26;
% lfp4 = lfp((t*fs):((t+30)*fs));
% pxx = periodogram(lfp4, [], frange, fs);
% resultado(1,4) = sum(pxx);
% 
% % 30 s
% t = 1920.26;
% lfp5 = lfp((t*fs):((t+30)*fs));
% pxx = periodogram(lfp5, [], frange, fs);
% resultado(1,5) = sum(pxx);
% 
% % 1st PD
% t1 = 1960.19;
% t2 = 1993.5;
% lfp6 = lfp((t1*fs):(t2*fs));
% pxx = periodogram(lfp6, [], frange, fs);
% resultado(1,6) = sum(pxx);