clear, clc;

%% Task 1

% We will generate a DSB-SC modulated signal with message m(t) = sin(t) (four periods only) and carrier frequency fc=10 Hz. 
% Use sampling frequency Fs=200 Hz.  (i)Generate four periods of the signal sin(t). This is the message m(t). 
% (ii)Generate a sine wave of frequency 10 Hz; the length of this vector (signal) should be exactly the same as that of m(t) in (i). 
% This will be the carrier. 
% (iii) Multiply the message and carrier signals sample-by-sample to obtain the DSB-SC signal as m(t) x carrier Graph the message, 
% carrier and DSB-SC signals.

Fs = 200;       % sampling frequency
fc = 10;        % carrier frequency

Tm = 2 * pi;        % time period 
t = 0:1/Fs:4*Tm;    % time vector
mt = sin(t);        % message m(t)

tc = 0:1/Fs:4*Tm;       % 4 periods of carrier signal
ct = sin(2*pi*fc*tc);   % carrier signal c(t)

DSBSC = mt.*ct;     % DSB-SC signal = m(t) x c(t)

figure(1)
subplot(3,1,1)
plot(t, mt)
title('message signal m(t)')
xlabel('time (s)')
ylabel('amplitude');

subplot(3,1,2)
plot(t, ct)
title('carrier signal c(t)')
xlabel('time (s)')
ylabel('amplitude');

subplot(3,1,3)
plot(t, DSBSC)
title('DSB-SC signal')
xlabel('time (s)')
ylabel('amplitude');





%% Task 2

% A low-pass filter is defined by the impulse response h(t)=e-100t. Use the sampling frequency Fs=1500 Hz 
% and store this signal in Matlab (truncate the signal to 10 samples, as in Lab 1). It is required to determine 
% the Fourier Transform of this filter H(f) at f=100 Hz, i.e., H(100). This can be solved in the following manner: 
% (i) Generate a 100 Hz sine wave for 10 periods and store this as x[n] on Matlab. (ii) Convolve the signals x[n] 
% and h[n] (see Lab 1) to get y[n]=x[n]*h[n] (iii) Plot the signals x[n] and y[n]. From the graphs of x[n] and y[n], 
% you can determine H(100) as: H(100)=Amplitude of y[n]Amplitude of x[n]

Fs = 1500;                 % sampling frequency
T = 1/Fs;                  % sampling period
f = 100;                   %frequency of filter H(f)
T2 = 1/f;
t = 1/Fs:1/Fs:10*T2;          % time vector
h = exp(-100*t(1:10));     % Truncated impulse response

xn = sin(2*pi*f*t); % signal x[n]
y = conv(h, xn);    % convolving signals x[n] and h[n]
ty = 0:T:(length(y)-1)*T;           % define vector of time instant ty

figure (2)
subplot(2,1,1)
plot(t,xn)
xlabel('time (s)')
ylabel('amplitude')

subplot(2,1,2)
plot(ty,y)
xlabel('time (s)')
ylabel('amplitude')

% H(100) = 3
