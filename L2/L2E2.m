% L2E2 - Implementazione DFT e DTFT

% Creo segnale x[n] con relativa lunghezza

x = sin(pi*(0:4)/5);
N = length(x);

% Applico DFT

X = zeros(1, N);

for i = 0:(N - 1)
    for j = 0:(N - 1)
        X(i + 1) =  X(i + 1) + (x(j + 1) * exp(-(2*pi*j*1i*i/N)));
    end
end

% Applico IDFT

xi = zeros(1, N);

for i = 0:(N - 1)
    for j = 0:(N - 1)
        xi(i + 1) =  xi(i + 1) + (1/N)*(X(j + 1) * exp(2*pi*j*1i*i/N));
    end
end

xi
ifft(X)