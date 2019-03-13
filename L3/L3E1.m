% L3E1 - Periodogramma semplice

B = audioread('guitar.flac'); % Leggi audio
S = 0; % Campione inizio
f = 44100; % Frequenza campionamento
T = 1; %5 % Intervallo campionamento
N = T*f;
n = (1:1:N); % Vettore n
f1 = (-N/2*f:f:(N/2 - 1)*f);

% Effettua DFT

x = B(n); % Salva campione di T secondi
X = fftshift(fft(x, length(x))); % Effettua DFT
P = zeros(1, N); % Inizializza P

for i = 1:N
    P(i) = abs(X(i))^2/N;
end;

plot(f1, P)

% Il periodogramma, valutato su un intervallo di 5 secondi
% si infittisce