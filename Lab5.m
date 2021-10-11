clear, clc;

%% Task 1

% Generate 1200 samples of the AM signal x[n] with modulation index equal to 1. 
% a.Use the sampling frequency fs = 20 kHz; carrier frequency fc = 1000 Hz; and a 50 Hz sine wave as your message signal. 
% b.Generate  the  AM  signal  according  to  the  equation x(t)  =  [A  +  m(t)]cos(ωct). Since, modulation index μ = 1/A, 
% the DC amplitude is A = 1/ μ. 
% c.Plot your generated AM time series.

% a
Fs = 20000;       % sampling frequency
fc = 1000;        % carrier frequency
fm = 50;          % message frequency
T = 1/Fs;         % sampling period

num_samples = 1200;     % number of samples generated
t = T:T:num_samples*T;  % time vector 

ct = sin(2*pi*fc*t);    % carrier signal c(t)
mt = sin(2*pi*fm*t);    % message signal m(t)

% b
u = 1;                      % modulation index
A = 1/u;                    % DC amplitude
xn = (A + mt) .* ct;        % AM signal x[n]

% c
figure(1)
subplot(3,1,1)
plot(t,xn)
title('AM signal x[n]')
xlabel('time (s)')
ylabel('amplitude');

%% Task 2

% Rectify the signal x[n] (convert all negative samples to positive ones) and LPF the resulting signal 
% (use the digital LPF design from Lab 3). Use 150 Hz as the bandwidth of the  LPF  and  63  as  filter  
% order.  Plot  the  filtered  output. This  should  look  like  the  message sine wave after an initial 
% transient.

xn_rect = abs(xn);      % rectified AM signal x[n]

f_pass = 150;                         % passband: 0-150Hz
trans_width = 200;                    % transition width: 200Hz
f_cut = f_pass + trans_width;         % cutoff freq
F = [0, f_pass, f_cut, Fs/2]/(Fs/2);  % 4 elements that specify frequency 
A = [1, 1, 0, 0];
order = 63;

h = firpm(order, F, A);     % impulse response (time domain)
y = conv(xn_rect,h);        % convolution of rectified signal and impulse response
t2 = T:T:1263*T;            % time vector for convolved signal

figure(1)
subplot(3,1,1)
plot(t,xn)
title('AM signal x[n]')
xlabel('time (s)')
ylabel('amplitude');

subplot(3,1,2)
plot(t,xn_rect)
title('Rectified signal')
xlabel('time (s)')
ylabel('amplitude');

subplot(3,1,3)
plot(t2,y)
title('Filtered output')
xlabel('time (s)')
ylabel('amplitude');


% Extra plots
figure(2)
subplot(2,1,1)
plot(t,ct)
title('Carrier signal c(t)')
xlabel('time (s)')
ylabel('amplitude');

subplot(2,1,2)
plot(t,mt)
title('Message signal m(t)')
xlabel('time (s)')
ylabel('amplitude');