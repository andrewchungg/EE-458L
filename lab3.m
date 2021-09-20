clear,clc;

%% Task 1

%Use Matlab function ‘firpm’ to design 
%(a) Low-pass 31-order filter hL,1[n], with pass band 0-2 kHz.
%(b) Low-pass 127-order filter hL,2[n], with pass band 0-2 kHz. 

Fs = 15e3;      % Sampling frequency
f_pass = 2e3;
trans_width = 200;
f_cut = f_pass + trans_width;
F = [0, f_pass, f_cut, Fs/2]/(Fs/2);     % 4 elements that specify frequency 
A = [1, 1, 0, 0];

% (a)
order1 = 31;
h1 = firpm(order1, F, A);     % h is the impulse response (time domain)
x1 = fft(h1, 4096);       % FFT of the impulse response = transfer function of the filter
Xlength = 4096;
freqAxis = (-Xlength/2:Xlength/2-1)*(Fs/Xlength);

X1shifted = fftshift(x1);
magSpec1 = abs(X1shifted);

figure(1)
plot(freqAxis, magSpec1)
xlabel('frequency (Hz)')
ylabel('magnitude');

% (b)
order2 = 127;
h2 = firpm(order2, F, A);     % h is the impulse response (time domain)
x2 = fft(h2, 4096);            % FFT of the impulse response = transfer function of the filter

X2shifted = fftshift(x2);
magSpec2 = abs(X2shifted);

figure(2)
plot(freqAxis, magSpec2)
xlabel('frequency (Hz)')
ylabel('magnitude');

%% Task 2

%Generate a signal x[n] as the sum of two sine waves, at frequencies 1 kHz and3 kHz, respectively. 
%Use the sampling frequency of 15 kHz and generate the signals such that they are about 300 samples long. 
%Plot the magnitude of the Fourier Transform for this signal. 
    
fc1 = 1e3;      % frequency 1kHz
fc2 = 3e3;      % frequency 2 kHz
T = 1/Fs; % sampling period
num_samples = 300;
t = T:T:num_samples*T; 

xn_1 = sin(2*pi*fc1*t);
xn_2 = sin(2*pi*fc2*t);
xn = xn_1 + xn_2;       % time domain

Xn = fft(xn, 4096); % perform Fast Fourier Transform
Xnshifted = fftshift(Xn);
Xn_magSpec = abs(Xnshifted);
Xn_freqAxis = (-Xlength/2:Xlength/2-1)*(Fs/Xlength);

figure(3)
plot(Xn_freqAxis, Xn_magSpec)
xlabel('frequency (Hz)')
ylabel('magnitude');


%% Task 3

% Convolve the signal in (2) with the impulse response in (1b). 
% Plot the magnitude of the Fourier Transform of the filtered output. 
% You should see the higher frequency component (3 kHz) suppressed in the output.

y = conv(xn,h2);        % convolution is in time domain so both inputs need to be in time domain

Ylength = 4096;
Y = fft(y, 4096);
Y_shifted = fftshift(Y);
Y_magSpec = abs(Y_shifted);
Y_freqAxis = (-Ylength/2:Ylength/2-1)*(Fs/Ylength);

figure(4)
plot(Y_freqAxis,Y_magSpec)
xlabel('frequency (Hz)')
ylabel('magnitude');