fs = 2000;
t_avaliado = 1783.72;

t = 0:1/fs:2-1/fs;
y = CeADir((t_avaliado*fs):((t_avaliado+30)*fs));
figure;
spectrogram(y,100,80,100,fs,'yaxis');
figure;
tempo = 0:1/fs:length(y)/fs;
tempo = tempo';
tempo = tempo(2:end);
plot(tempo,y)