% L1E2.1 - Convoluzione lineare con FFT e IFFT

% Creo i due vettori ai quali applicare la convoluzione

x = sin(pi*(0:5)/5);
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

% Genera matrice circolante

m = zeros(l, l);

for i = 1:l
    for j = 1:l
        m(i, j) = y(mod((i - j), l) + 1);
    end
end

z = m*x';
z = z';

% La soluzione implementata restituisce il medesimo risultato del punto
% L1E2 implementato grazie alla convoluzione circolare