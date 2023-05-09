close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

%% Time analysis 
%% Initialisation of variables

% Read the samples from HelloWorld.wav
[x, Fs] = audioread('data/HelloWorld.wav');

% Question 1
% x restricted to [0.01 s, 0.04 s]
start1 = 0.01;
stop1 = 0.04;
x1=x(start1*Fs: stop1*Fs);
k1=start1*Fs:stop1*Fs;

% Question 2
% x restricted to [0.2 s, 0.23 s]
start2 = 0.2;
stop2 = 0.23;
x2=x(start2*Fs: stop2*Fs);
k2=start2*Fs:stop2*Fs;

% Question 3
% x restricted to hello 
start3 = 0.1;
stop3 = 0.35;
xh=x(start3*Fs: stop3*Fs);
kh=start3*Fs: stop3*Fs;
sound(xh, Fs);

%% Display processing

% Question 1
% x restricted to [0.01 s, 0.04 s]
nexttile;
plot(k1, x1);
title('x1 restricted to [0.01 s, 0.04 s], unvoiced');

% Question 2
% x restricted to [0.2 s, 0.23 s]
nexttile;
plot(k2, x2);
title('x2 restricted to [0.2 s, 0.23 s], voiced');

% Question 3
% x restricted to hello
figure;
plot(kh, xh);
title('xh restricted to [0.1 s: 0.35 s], Hello World!');


%% Frequencies analysis
%% Initialisation of variables

% Question 4
% x restricted to [HH]
starthh = 0.1;
stophh = 0.15;
xhh=x(starthh*Fs: stophh*Fs);
khh=starthh*Fs: stophh*Fs;
% sound(xhh, Fs);

% x restricted to [AH]
starthh = 0.15;
stophh = 0.20;
xah=x(starthh*Fs:stophh*Fs);
kah=starthh*Fs: stophh*Fs;
% sound(xah, Fs);

% x restricted to [L]
startL = 0.20;
stopL = 0.23;
xl=x(startL*Fs:stopL*Fs);
kl=startL*Fs: stopL *Fs;
%sound(xl, Fs);

% x restricted to [OW]
startow = 0.23;
stopow = 0.35;
xow=x(startow*Fs:stopow*Fs);
kow=startow*Fs: stopow*Fs;
%sound(xow, Fs);

%% Display processing

% Display of 'Hello' cut in 4 parts: "[HH]", "[AH]", "[L]", "[OW]"
figure;
plot(khh, xhh, kah, xah, kl, xl, kow, xow);
legend("[HH]", "[AH]", "[L]", "[OW]");
title('xhh restricted to [0.1 s, 0.15 s], unvoiced');

%% Short Term Fourier Transform and Spectrogram
%% Initialisation of variables

% Question 3.3.4
% Magnitude spectrum of the signal

% On definie le nombre de points
N=1024;

% TDF x1
Xfft1=fft(x1, N);
f_TFD1 = linspace(-(Fs/2),((Fs/2)-1), N);

Xfftshift1=fftshift(Xfft1);

figure;
plot(f_TFD1, abs(Xfftshift1));

% TFD x2
Xfft2=fft(x2, N);
f_TFD2 = linspace(-(Fs/2),((Fs/2)-1), N);

Xfftshift2=fftshift(Xfft2);

figure;
plot(f_TFD2, abs(Xfftshift2));

% Question 5/6/7
%hamming
N = 441;
d = 441;
N_fft = 1024;
w = hamming(N);

%On veut voir que les 4kHz
f0 = 4000;

[Sx, f, t] = spectro(x,w,d,N_fft,Fs);

% On convertit l'axe des y en frequence

f_stop = (f0*N_fft)/Fs;

figure;
subplot(3,1,1);
imagesc((t), (0:f),log(Sx(1:f_stop,1:80)));
title("spectrogram with window=hamming and N=441");
xlabel("time");
ylabel("frequences");

N = 882;
w = hamming(N);

[Sx, f, t] = spectro(x,w,d,N_fft,Fs);

subplot(3,1,2);
imagesc((t), (0:f),log(Sx(1:f_stop,1:80)));
title("spectrogram with window=hamming and N=882");
xlabel("time");
ylabel("frequences");


%ones
N = 441;
w = ones(1,N); 

[Sx, f, t] = spectro(x,w,d,N_fft,Fs);

subplot(3,1,3)
imagesc((t), (0:f),log(Sx(1:f_stop,1:80)));
title("spectrogram with window=ones and N=441");
xlabel("time");
ylabel("frequences");

%Comment il n'y a pas de fenetre de ponderation on perd quelque details








