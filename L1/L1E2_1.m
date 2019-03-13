% L1E2.1 - Convoluzione lineare con FFT e IFFT

% Creo i due vettori ai quali applicare la convoluzione

x = sin(pi*(0:4)/5);
y = ones(1, 3);

% Lunghezze vettori e parametri convoluzione

a = length(x); % Lunghezza x
b = length(y); % Lunghezza y

% Effettua l'aggiunta di zeri

if a > b
    y = [y, zeros(1, a - b)];
    l = a;
else
    x = [x, zeros(1, b - a)];
    l = b;
end

% Effettua la trasformata e la moltiplicazione nel dominio delle frequenze

X = fft(x);
Y = fft(y);

% Crea vettore Z

Z = zeros(1, l);

% Moltiplica X e Y

Z = X.*Y;
z = ifft(Z);

% La soluzione implementata restituisce il medesimo risultato del punto
% L1E2 implementato grazie alla convoluzione circolare