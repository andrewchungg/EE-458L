clear, clc;

%% Task 1

% A SSB signal for message m(t) is defined by the equation  x(t) = m(t) cos(2πfct) + mh(t) sin(2πfct),
% where,  mh(t) is the Hilbert Transform of the message and fc is the carrier frequency. In this part, 
% you will generate 1200 samples of the SSB signal in the following manner: 

% a.First generate and plot the DSB-SC signal x1(t) = m(t) cos(2πfct) for 1200 samples. Both m(t) and 
% the cosine carrier must be 1200 samples long.
% b.For  sine  waves,  the  Hilbert  Transform  just  delays  the  phase  by 90. So, if m(t)=cos(2πfmt), 
% then mh(t)=sin(2πfmt).
% c.Next, generate and plot a second DSB-SC signal x2(t) = mh(t) sin(2πfct) for 
% 1200 samples.d.Lastly, plot the SSB signal as x(t) = x1(t)+x2(t).Use sampling frequency fs = 20 kHz, 
% carrier frequency fc = 1000 Hz and 50 Hz as the frequency of a sine-wave message.

Fs = 20000;       % sampling frequency
fc = 1000;        % carrier frequency
fm = 50;          % message frequency
T = 1/Fs;         % sampling period

num_samples = 1200;     % number of samples generated
t = T:T:num_samples*T;  % time vector 

mt = cos(2*pi*fm*t);    % message signal m(t)
ct = cos(2*pi*fc*t);    % carrier signal c(t)
mh = sin(2*pi*fm*t);    % hilbert transform of m(t)

x1 = mt.*ct;                % DSB-SC signal
x2 = mh.*sin(2*pi*fc*t);    % DSB-SC signal
x = x1+x2;                 % SSB signal

% plots
figure(1)
subplot(3,1,1)
plot(t,x1)
title('DSB-SC signal')
xlabel('time (s)')
ylabel('amplitude');

subplot(3,1,2)
plot(t,x2)
title('DSB-SC signal')
xlabel('time (s)')
ylabel('amplitude');

subplot(3,1,3)
plot(t,x)
title('SSB signal')
xlabel('time (s)')
ylabel('amplitude');
