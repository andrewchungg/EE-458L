clear, clc;

%% Task 1
% 1. Write a program to generate the VCO output x(t) for 200 samples, i.e., for n = 1,2,...,200 
% in the above equation. Use w0 = 20 and c = 2. Use sampling frequency fs = 100 Hz.

fs = 100;           % sampling frequency
T = 1/fs;           % sampling period
w0 = 20;            % center frequency
c = 2;              % sensitivity 
f0 = w0/(2*pi);     

num_samples = 200;      % number of samples
nt = T:T:num_samples*T; % time vector 

v = 0;                      % input signal voltage
vs = v*ones(1,length(nt));   % sampled voltages 

xt = cos(w0*nt + c*T*cumsum(vs));    % Output of a VCO


%% Task 2
% 2. For the DC input v(t) = 0, graph the VCO output x(t). What is the output frequency?

figure(1)
plot(nt,xt)
xlabel('time (s)')
ylabel('amplitude')
title('VCO for input V=0')

% The output frequency is 6 cycles in 2 seconds so 3 Hz


%% Task 3
% 3. Repeat for DC inputs v(t) = 5 and v(t) = -5.

% v(t) = 5:

v = 5;                      % input signal voltage
vs = v*ones(1,length(nt));   % sampled voltages 
xt = cos(w0*nt + c*T*cumsum(vs));    % Output of a VCO

figure(2)
plot(nt,xt)
xlabel('time (s)')
ylabel('amplitude')
title('VCO for input V=5')

% v(t) = -5

v = -5;                      % input signal voltage
vs = v*ones(1,length(nt));   % sampled voltages 
xt = cos(w0*nt + c*T*cumsum(vs));    % Output of a VCO

figure(3)
plot(nt,xt)
xlabel('time (s)')
ylabel('amplitude')
title('VCO for input V=-5')
