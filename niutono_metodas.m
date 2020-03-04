clear;
clc;
tiksloFunkcija = @(x) (x.^2-1).^2/9-1;
tiksloFunkcijosIsvestine = @(x) (4*x*(x.^2-1))/9;
tiksloFunkcijosIsvestine2 = @(x) (12*(x.^2)-4)/9;

% intervalas [l, r]
l = 0;
r = 10;
% grafikas
x = l:0.1:r;
y = tiksloFunkcija(x);

plot(x,y);
hold on;
grid on

% zingsniu skaicius
counter = 1;
% funkcijos kvietimu skaicius
counterFunc = 0;

x0=5;
% tikslumas
tikslumas = 10^-4; 

d = 1;

while d>=tikslumas
    x1=x0 - tiksloFunkcijosIsvestine(x0)/tiksloFunkcijosIsvestine2(x0);
    counterFunc = counterFunc + 2;
    d = abs(x1-x0);
    x0 = x1;

    fprintf('%d iteracija %.15f %.15f \n', counter, x0, tiksloFunkcija(x0));
    plot(x0, tiksloFunkcija(x0), 'or');
    counter = counter + 1;

end

fprintf('\n Minimumas: %.4f %.4f \n Funkcija buvo iskviesta %d kartu \n', x1, tiksloFunkcija(x1), counterFunc);