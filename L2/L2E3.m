% L2E3 - DFT di segnali analogici campionati

% Intervallo di campionamento

T0 = 4; 

% Frequenze di campionamento

fc1 = 5; 
fc2 = 20;

% Vettore n

N1 = T0*fc1;
n1 = (-(N1)/2):((N1)/2 - 1);

N2 = T0*fc2;
n2 = (-(N2)/2):((N2)/2 - 1);

% Segnali campionati

x1_1 = zeros(1, N1);
x2_1 = zeros(1, N1);
x3_1 = zeros(1, N1);

x1_2 = zeros(1, N2);
x2_2 = zeros(1, N2);
x3_2 = zeros(1, N2);

syms t;
x1(t) = (sin(pi*t)/(pi*t))^2;
x2(t) = exp(-4*abs(t));
x3(t) = cos(2*pi*t);

% Campiona a frequenza fc1

for i = 1:N1
    % Campiona x1
    if(n1(i) == 0)
        x1_1(i) = 1;
    else
        x1_1(i) = x1((n1(i)/fc1));
    end
    % Campiona x2
    x2_1(i) = x2((n1(i)/fc1));
    % Campiona x3
    x3_1(i) = x3((n1(i)/fc1));
end

% Campiona a frequenza fc2

for i = 1:N2
    % Campiona x1
    if(n2(i) == 0)
        x1_2(i) = 1;
    else
        x1_2(i) = x1((n2(i)/fc2));
    end
    % Campiona x2
    x2_2(i) = x2((n2(i)/fc2));
    % Campiona x3
    x3_2(i) = x3((n2(i)/fc2));
end

% Vettore frequenze

f1 = n1*(fc1/N1);
f2 = n2*(fc2/N2);

% Stampa grafici DFT

subplot(3,2,1)
plot(f1,abs(fftshift(fft(x1_1)))*T0, '.')
title('Modulo X1_1')
subplot(3,2,3)
plot(f1,abs(fftshift(fft(x2_1)))*T0, '.')
title('Modulo X2_1')
subplot(3,2,5)
plot(f1,abs(fftshift(fft(x3_1)))*T0, '.')
title('Modulo X3_1')
subplot(3,2,2)
plot(f2,abs(fftshift(fft(x1_2))), '.')
title('Modulo X1_2')
subplot(3,2,4)
plot(f2,abs(fftshift(fft(x2_2))), '.')
title('Modulo X2_2')
subplot(3,2,6)
plot(f2,abs(fftshift(fft(x3_2))), '.')
title('Modulo X3_2');