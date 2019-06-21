function senal=grabacion(t,Fs,Ch,bits)
audio=audiorecorder(Fs,bits,Ch);
disp('Empieza audio');
recordblocking(audio,t);
disp('Audio terminado');
senal=getaudiodata(audio);
end