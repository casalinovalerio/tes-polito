% L1E2 - Convoluzione circolare

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

% Crea vettore z

z = zeros(1, l);

% Effettua convoluzione [Utilizza indici da 0 a l-- per valutare modulo]

for i = 0:(l - 1)
    for j = 0:(l - 1)
        z(i + 1) = z(i + 1) + x(j + 1)*y(mod((i - j), l) + 1);
    end
end

z

% Il risultato coincide conquello della funzione cconv().
% conv() e cconv() coincidono per un numero di campioni pari a 6.
% Il vettore conv() ha sei elementi, quindi sono necessari sei campioni per
% avere lo stesso numero con cconv(). I risultati coincidono con un valore
% di N = l + 1 = 5 (l'ultimo elemento viene portato all'inizio del vettore cconv()) 