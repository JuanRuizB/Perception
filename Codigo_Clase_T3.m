clear all,close all, clc

Fs = 8000;
canales = 1;
num_bits = 16;
tiempo = 2;
recObj = audiorecorder(Fs,num_bits,canales);
disp('Start speaking')
recordblocking(recObj, tiempo);
disp('End of Recording.');
% Play back the recording
play(recObj);
senal = getaudiodata(recObj);

% Crear y reproducir una señal artificial
% senal = randn(1,12000);
obj_senal = audioplayer(senal,20000);
play(obj_senal);
