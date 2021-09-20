clear, clc;

%% Task 1

Fs = 20e3;      % sampling frequency
T = 1/Fs;       % sampling period 
fc = 1e3;       % sinusoidal frequency
Tc = 1/fc;
t = T:T:6*Tc;       % vector of time instants
x = sin(2*pi*fc*t);     % sinusoidal signal 

figure(1)
plot(t,x);
xlabel('Time');
ylabel('Amplitude');

%% Task 2

fc = 19e3;
x2 = sin(2*pi*fc*t);

figure(2)
plot(t,x2);
xlabel('Time');
ylabel('Amplitude');

%% Task 3 

h = exp(-1000*t(1:10));     % Truncated impulse response
% h_truncated = h(1:10);      % Gives 10 samples
y = conv(h, x);
ty = 0:T:(length(y)-1)*T;           % define vector of time instant ty

figure(3)
xlabel('Time');
ylabel('Amplitude');
plot(ty, y);
xlabel('Time');
ylabel('Amplitude');


