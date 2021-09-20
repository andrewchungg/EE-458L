clear, clc;

%% Task 1

Fs = 15e3; % sampling frequency
T = 1/Fs; % sampling period

fc = 1e3; % frequency of sine wave
Tc = 1/fc; % length of one period of sine wave
num_cycles = 20;

t = T:T:num_cycles*Tc; 
x = sin(2*pi*fc*t);

X = fft(x, 4096); % perform Fast Fourier Transform
Xshifted = fftshift(X);
Xlength = 4096;
magSpec = abs(Xshifted);
freqAxis = (-Xlength/2:Xlength/2-1)*(Fs/Xlength);

figure(1)
plot(freqAxis, magSpec)
xlabel('frequency (Hz)')
ylabel('magnitude');


% amplitude is for signal in time domain, can be positivie or negative 
% amplitude is for signal in frequency domain, only positive

%% Task 2

T2 = 30*(1/Fs);
t = 1/Fs:1/Fs:0.002; %30*T2-1/Fs;
y = 500*t;
Y = repmat(y,1,30);
t2 = (1:length(Y)) * T;

figure(2)
plot(t2,Y)
grid on;
xlabel('frequency (Hz)')
ylabel('magnitude');


%% Task 3

Y_F = fft(Y, 4096);
Y_F_shifted = fftshift(Y_F);

magSpec2 = abs(Y_F_shifted);

figure(3)
plot(freqAxis,magSpec2)
xlabel('frequency (Hz)')
ylabel('magnitude');

