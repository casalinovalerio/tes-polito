% L1E1 - Convoluzione lineare

% Creazione dei due vettori sui quali applicare la convoluzione
x = sin(pi*(0:4)/5);
y = ones(1, 3);

% Lunghezze vettori e parametri convoluzione

% Lunghezza x
a = length(x); 
% Lunghezza y
b = length(y); 
% Lunghezza del vettore x in seguito all'aggiunta di 0 di padding per 
% l'iterazione
c = 2*(b - 1) + a; 

% Effettua l'aggiunta di zeri per l'iterazione
x = [zeros(1, b - 1), x, zeros(1, b - 1)];

% Ribalta il vettore y e crea vettore z
yf = fliplr(y);
z = zeros(1, (c - b));

% Effettua iterazione per convoluzione lineare
for i = 1:(c - b)
   for j = 1:b
       z(i) = z(i) + (yf(j)*x(i + j));
   end
end

z
conv(x, y)

% Il risultato coincide con quello della funzione conv() a meno di alcuni
% zeri di padding posti ai capi del vettore risultato probabilmente dovuti
% all'implementazione dell'algoritmo in MATLAB