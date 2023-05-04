close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

%% Initialisation of some variables

%% Start of your processing
% Question 1
% Read the samples from HelloWorld.wav
[x, Fs] = audioread('data/HelloWorld.wav');

% x restricted to [0.01 s, 0.04 s]
x1=x(0.01*Fs: 0.04*Fs);
k1=0.01*Fs:0.04*Fs;

nexttile;
plot(k1, x1);
title('x1 restricted to [0.01 s, 0.04 s], unvoiced');

% Question 2
% x restricted to [0.2 s, 0.23 s]
x2=x(0.2*Fs: 0.23*Fs);
k2=0.2*Fs:0.23*Fs;

nexttile;
plot(k2, x2);
title('x2 restricted to [0.2 s, 0.23 s], voiced');

% Question 3
% x restricted to hello 
xh=x(0.1*Fs: 0.35*Fs);
kh=0.1*Fs: 0.35*Fs;
%sound(xh, Fs);

figure;
plot(kh, xh);
title('xh restricted to [0.1 s: 0.35 s], Hello World!');

% Question 4
% x restricted to [HH]
xhh=x(0.1*Fs: 0.15*Fs);
khh=0.1*Fs: 0.15*Fs;
%sound(xhh, Fs);

% x restricted to [AH]
xah=x(0.15*Fs:0.20*Fs);
kah=0.15*Fs: 0.20*Fs;
%sound(xah, Fs);

% x restricted to [L]
xl=x(0.20*Fs:0.23*Fs);
kl=0.20*Fs: 0.23*Fs;
%sound(xl, Fs);

% x restricted to [OW]
xow=x(0.23*Fs:0.35*Fs);
kow=0.23*Fs: 0.35*Fs;
%sound(xow, Fs);

figure;
plot(khh, xhh, kah, xah, kl, xl, kow, xow);
legend("[HH]", "[AH]", "[L]", "[OW]");
title('xhh restricted to [0.1 s, 0.15 s], unvoiced');

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








