clear, clc;

% The equation for an FM signal is given by φfm(t) = cos[2π fct + c x(t)], where, x(t) is the integral 
% of the message v(t). 

%% Task 1

% Generate an FM signal using the VCO method. Program the input v(t) to be 3 periods of a sine 
% wave with frequency 1 Hz. Also, use ω0 = 100, sensitivity c = 50 and sampling frequency fs 
% =1000 Hz. Graph the frequency-modulated signal. You can use your program from Lab 8 for 
% this part. 

fm = 1;         % message frequency
w0 = 100;       % reference frequency
c = 50;         % sensitivity
fs = 1000;      % sampling frequency

Ts = 1/fs;
t = Ts:Ts:3*(1/fm);     % time vector
n = 1:1:length(t);

vt = sin(2*pi*fm*t);        % message signal
xn = cos(w0*n*Ts + c*Ts*(cumsum(vt)));

figure(1)
plot(n*Ts, xn)
xlabel('time (s)')
ylabel('amplitude')
title('VCO Output')

%% Task 2

% A digital FM demodulator is designed according to the block diagram shown below. Write a 
% program to implement this demodulator and display the output. For the LPF, you can use a 32 
% tap filter (use your filter program from Lab 3). Graph the demodulated signal. 

temp1 = xn.*cos(w0*t);
temp2 = xn.*sin(w0*t);

% need to solve for f_pass and trans_width for the filter 
xn1 = fft(temp1, 4096);
xn2 = fft(temp2, 4096);
xn1_shifted = fftshift(xn1);
xn2_shifted = fftshift(xn2);  
xn1_magSpec = abs(xn1_shifted);
xn2_magSpec = abs(xn2_shifted);
xn1_freqAxis = (-4096/2:4096/2-1)*(fs/4096);
xn2_freqAxis = (-4096/2:4096/2-1)*(fs/4096);

figure(2)
plot(xn1_freqAxis,xn1_magSpec)
xlabel('frequency (Hz)')
ylabel('magnitude');

f_pass = 15;        % includes low frequency portion of signal
trans_width = 4;    % width to not include higher frequency portion of the signal
f_cut = f_pass + trans_width;
F = [0, f_pass, f_cut, fs/2]/(fs/2);     % 4 elements that specify frequency 
A = [1, 1, 0, 0];
order1 = 32;
h = firpm(order1, F, A);     % h is the impulse response (time domain)

y1 = conv(temp1,h);          % convolve temp signal with impulse response of the LPF
y2 = conv(temp2,h);          % convolve temp signal with impulse response of the LPF

kxt = unwrap(atan2(y2,y1));

figure(3)
plot((1:length(kxt))/fs, kxt)
xlabel('time (s)')
ylabel('amplitude')
title('Demodulated Signal')


