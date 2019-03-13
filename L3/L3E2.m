% L3E2 - Periodogramma di Bartlett

B = audioread('guitar.flac'); % Leggi audio
S = 0; %Campione inizio
f = 44100; % Frequenza campionamento
T = 1; % 5 % Intervallo campionamento
N = T*f;
n = (1:N); % Vettore n
f0 = n/f;
M1 = 10;
M2 = 50;
M3 = 100;

x = B(n); % Salva campione di un secondo

% Effettua DFT 1

X_p = zeros(1, N/M1);
P1 = zeros(1, N/M1);

for i = 0:(M1 - 1)
    X_p = fft(x(((N/M1*i) + 1):((N/M1*(i + 1))))); % FFT delle sottosequenze
    for j = 1:(N/M1)
        P1(j) = P1(j) + abs(X_p(j))^2/(N/M1);
    end
end

% Media P e calcola vettore f
P1 = P1/M1;
f1 = (-(N/(2*M1))*f:f:(N/(2*M1) - 1)*f);

% Effettua DFT 2

X_p = zeros(1, N/M2);
P2 = zeros(1, N/M2);

for i = 0:(M2 - 1)
    X_p = fft(x(((N/M2*i) + 1):((N/M2*(i + 1))))); % FFT delle sottosequenze
    for j = 1:(N/M2)
        P2(j) = P2(j) + abs(X_p(j))^2/(N/M2);
    end
end

% Media P e calcola vettore f
P2 = P2/M1;
f2 = (-(N/(2*M2))*f:f:(N/(2*M2) - 1)*f);

% Effettua DFT 3

X_p = zeros(1, N/M3);
P3 = zeros(1, N/M3);

for i = 0:(M3 - 1)
    X_p = fft(x(((N/M3*i) + 1):((N/M3*(i + 1))))); % FFT delle sottosequenze
    for j = 1:(N/M3)
        P3(j) = P3(j) + abs(X_p(j))^2/(N/M3);
    end
end

% Media P e calcola vettore f
P3 = P3/M1;
f3 = (-(N/(2*M3))*f:f:(N/(2*M3) - 1)*f);

% Disegna P
subplot(3,1,1)
plot(f1, fftshift(P1))
title('P1')
subplot(3,1,2)
plot(f2, fftshift(P2))
title('P2')
subplot(3,1,3)
plot(f3, fftshift(P3))
title('P3')