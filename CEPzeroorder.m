starth = 0;
time_step  = 1e-2;
t= starth:time_step:endtime;
x = @(t)(10*sin(2*pi*t));
% Samples
no_of_Samples = endtime/Ts; 
samples = 0:no_of_Samples;
% continous to Discrete signal 
take_samp = zeros(1,length(t));
take_samp(1:Ts/time_step:end) = x(samples*Ts);
% Impulse Zero order hold 
z_imp = ones(1,ceil(Ts/time_step));

% Zero order hold for reconstruction
rec_zoh = conv(z_imp,take_samp);
rec_zoh = rec_zoh(1:length(t));
% plot(abs(fftshift(fft(xZoh1))));

%Plot Frequency spectrum of original signal and 
%reconstructed signal at every sampling rate.
figure('Name','Frequency spectrum of original signal and reconstructed signal','NumberTitle','off')
subplot 121; plot(abs(fftshift(fft(x(t)))));
xlabel('Frequency');
ylabel('Magnitude');
title('Frequency spectrum of original signal');

subplot 122;  plot(abs(fftshift(fft(rec_zoh))));
xlabel('Frequency');
ylabel('Magnitude');
title('Frequency spectrum of reconstructed  signal');


% Plot of original and reconstructed signal at every sampling rate. 
figure('Name','Original and reconstructed signal','NumberTitle','off')
subplot 311, plot(t,x(t));title('Original signal');
subplot 312, stem(t,take_samp);title('Discrete signal');
subplot 313, plot(t,rec_zoh);title('Reconstructed signal by Zoh');