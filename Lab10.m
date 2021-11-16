clear, clc;

% In this experiment, you will learn the concept of windowing in digital filter design. Analog filters 
% have infinitely long impulse responses. In practice, circuit elements such as inductors and capacitors 
% have responses that decay exponentially, but, may still exist for a significant amount of time depend-
% ing on their time constants. Many times, digital filter impulse responses are obtained as sampled ver-
% sions of their analog counterparts. A very long discrete impulse response is a problem since it con-
% sumes time and energy for the computations. It may be necessary to “truncate” the impulse responses. 
% When a discrete time impulse response is truncated, the resulting “rectangular windowing” exhibits 
% sinc-pulse like side lobes (ripples). Windowing can be used to reduce these ripples. Windowing typi-
% cally expands the main lobe while minimizing the side lobes. 

% Two commonly used window functions are: 
% a) Hamming window (Matlab command hamming) 
% b) Kaiser window (Matlab command Kaiser) 
% If the impulse response is one sided (as in a digital differentiator or a Hilbert transformer), only 
% half the window will be used. If the impulse response is two-sided (as in low-pass or band-pass 
% filters), the full window will be used. 

%% Task 1

% Design a 255-order (256 point) low-pass filter with pass band up to 3 kHz using the firpm com-
% mand. Use the sampling frequency of 16 kHz. Plot the (i) impulse response and (ii) magnitude of 
% the Fourier Transform of the impulse response. 


fs = 16e3;                               % Sampling frequency
f_pass = 3e3;
trans_width = 200;
f_cut = f_pass + trans_width;
F = [0, f_pass, f_cut, fs/2]/(fs/2);     % 4 elements that specify frequency 
A = [1, 1, 0, 0];

% (a)
order1 = 255;
h1 = firpm(order1, F, A);     % h is the impulse response (time domain)
x1 = fft(h1, 4096);           % FFT of the impulse response = transfer function of the filter
Xlength = 4096;
freqAxis = (-Xlength/2:Xlength/2-1)*(fs/Xlength);

X1shifted = fftshift(x1);
magSpec1 = abs(X1shifted);

figure(1)
plot(1:length(h1), h1)
xlabel('frequency (Hz)')
ylabel('amplitude')
title('Impulse Response')

figure(2)
plot(freqAxis, magSpec1)
xlabel('frequency (Hz)')
ylabel('magnitude');
title('Magnitude of FFT of Impulse Response')


%% Task 2

% Next, truncate this to a 128-point filter by using only the middle 128 terms of the impulse re-
% sponse. The first 64 samples and the last 64 samples of the impulse response should be set to zero 
% (middle 128 samples must be retained.) Plot the magnitude of the Fourier transform of this modi-
% fied impulse response. 

h1_truncated = h1(65:192);
x1_truncated = fft(h1_truncated, 4096);       % FFT of the impulse response = transfer function of the filter

X1shifted_truncated = fftshift(x1_truncated);
magSpec2 = abs(X1shifted_truncated);

figure(3)
plot(freqAxis, magSpec2)
xlabel('frequency (Hz)')
ylabel('magnitude');
title('Magnitude of FFT of Modified Impulse Response')

%% Task 3

% Next, window the above 128-point impulse response with a length 128 Hamming window (multi-
% ply term wise the impulse response value and the window function.) Plot the transfer function 
% (magnitude of the Fourier Transform) of this revised impulse response. You should observe a sig-
% nificant improvement in the passband and stopband responses.

h2 = hamming(128)' .* h1_truncated;  % multiplying truncated impulse response with hamming window of length 128 
x2 = fft(h2, 4096);                  % FFT of the impulse response = transfer function of the filter

X2shifted = fftshift(x2);
magSpec3 = abs(X2shifted);

figure(3)
plot(freqAxis, magSpec3)
xlabel('frequency (Hz)')
ylabel('magnitude');
title('Transfer Function of Revised Impulse Response')
