clear, clc;

%% Task 1

% Store a suitable audio .wav file as an array x. Let N be the size of the array. If 
% N is not a multiple of 4, append one, two or three zeros (as required) to make 
% the array size a multiple of 4.  

% reading a 'wav' file 
% x = column vector w/ audio signal
% fs = sampling frequency of audio signal
[x, fs] = audioread('AllIWantForChristmas.wav');
N = length(x);      % divisible by 4
p0 = audioplayer(x, fs);
%play(p0);

figure(1)
plot(x)
title('Original signal')

%% Task 2

% Obtain the FFT of the signal, fftshift it, and plot the transform.

X=fft(x);                   % Fast Fourier Transfrom
XShifted = fftshift(X);     % Plot centered at 0
XLength = length(X);        % Length of the signal
magSpec = abs(XShifted);    % Magnitude spectrum
freqAxis = (-XLength/2:XLength/2-1)*(fs/XLength);   % x-axis in Hertz (Hz)

figure(2)
plot(freqAxis, magSpec);    % Plot
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('FFT of signal')

%% Task 3

% Obtain 50% compression. For this, set the first N/4 and the last N/4 transform 
% values to zero. It is very important for this to be exact (hence N should be a 
% multiple of 4). A mismatch will result in a non-symmetric transform and will 
% have a complex IFFT. 

% Y = XShifted(2819693:8459076);     % 50% compression

Y = XShifted;
r = 0.5;
% r = 0.8;

l = N * r * 0.5;
h = N - l + 1;
Y(1:l) = 0;
Y(h:N) = 0;

% when r is over .5, the distortion gets significantly worse. It's hard to
% visualize on the graph but the blue magnitude is the only part affected.
%% Task 4

% Obtain the IFFT of the compressed signal after fftshift one more time and play 
% it at the same sampling frequency as the original signal. This is the com-
% pressed signal. Try compressing to different extents and identify approximate-
% ly at what extent the signal sounds distorted.

y = ifft(fftshift(Y));
p1 = audioplayer(y, fs);
play(p1);

y_length = length(Y);
freqAxis = (-y_length/2:y_length/2-1)*(fs/y_length);

figure(3)
plot(freqAxis, abs(Y));    
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Truncated signal')
