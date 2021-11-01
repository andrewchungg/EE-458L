clear, clc;

%% Task 1

% Generate a narrow-band FM signal using the equation g.m(t)cos(2*pi*fc*t) + G.sin(2*pi*fc*t). 
% Use a sine wave with frequency 1 Hz for the message m(t). Also, use carrier frequency fc = 10Hz 
% and sampling frequency fs = 200Hz. Lastly, use amplitudes g=0.1 and G=1. Generate the narrowband 
% FM signal for 3 periods of the message signal

fc = 10;        % carrier frequency
fm = 1;         % message frequency
fs = 200;       % sampling frequency

Ts = 1/fs;
t = Ts:Ts:3*(1/fm);     % time vector

g = 0.1;        % amplitude
G = 1;          % amplitude

mt = sin(2*pi*fm*t);        % message signal
xt = g.*mt.*cos(2*pi*fc*t) + G.*sin(2*pi*fc*t);    

figure(1)
plot(t,xt)
xlabel('time (s)')
ylabel('amplitude')
title('Narrow-Band FM Signal')

%% Task 2

% Generate an FM signal using the VCO method. Program the input v(t) to be 3 periods of a sine wave with 
% frequency 1 Hz. Also, use w0 = 100, sensitivity c = 50, and sampling frequency fs = 1000 Hz.

w0 = 100;       % reference frequency
c = 50;         % sensitivity
fs = 1000;      % sampling frequency

Ts = 1/fs;
t = Ts:Ts:3*(1/fm);     % time vector
n = 1:1:length(t);

mt = sin(2*pi*fm*t);
xn = cos(w0*n*Ts + c*Ts*(cumsum(mt)));

figure(2)
plot(n*Ts, xn)
xlabel('time (s)')
ylabel('amplitude')
title('VCO Output')
