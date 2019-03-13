% L2E1 - Filtro tempo-discreto e convoluzione

% Creo i due vettori ai quali applicare la convoluzione

x = sin(pi*(0:4)/5);
h = ones(1, 3); % Risposta all'impulso del filtro tempo-discreto

% Lunghezze vettori e parametri convoluzione

a = length(x); % Lunghezza x
b = length(h); % Lunghezza y
c = 2*(b - 1) + a; % Lunghezza del vettore x in seguito all'aggiunta di 0 di padding per l'iterazione

% Effettua l'aggiunta di zeri per l'iterazione

x = [zeros(1, b - 1), x, zeros(1, b - 1)];

% Ribalta il vettore y e crea vettore z

hf = fliplr(h);
y = zeros(1, (c - b));

% Effettua iterazione per convoluzione lineare

for i = 1:(c - b)
   for j = 1:b
       y(i) = y(i) + (hf(j)*x(i + j)); % uscita del filtro
   end
end

% Il risultato coincide conquello della funzione conv() a meno di alcuni
% zeri di padding posti ai capi del vettore risultato probabilmente dovuti
% all'implementazione dell'algoritmo in MATLAB