clear;
clc;
tiksloFunkcija = @(x) (x.^2-1).^2/9-1;

% intervalas [l, r]
l = 0;
r = 10;
% tikslumas
tikslumas = 10^-4; 

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

phi = (sqrt(5) - 1)/2;

L = r-l;
x1 = r-phi*L;
x2 = l+phi*L;
y1 = tiksloFunkcija(x1);
y2 = tiksloFunkcija(x2);
counterFunc = counterFunc + 2;

while L >= tikslumas
    
    if y2 < y1
        l = x1;
        L = r-l;
        fprintf('%d iteracija %.15f %.15f \n', counter, x2, y2);
        plot(x2, y2, 'og');
        x1 = x2;
        y1 = y2;
        x2 = l+phi*L;
        y2 = tiksloFunkcija(x2);
        counterFunc = counterFunc + 1;
    else
        r = x2;
        L = r-l;
        fprintf('%d iteracija %.15f %.15f \n', counter, x1, y1);
        plot(x1, y1, 'or');
        x2 = x1;
        y2 = y1;
        x1 = r-phi*L;
        y1 = tiksloFunkcija(x1);
        counterFunc = counterFunc + 1;
    end
    
    counter = counter + 1;
end

if y1 < y2
    fprintf('\n Minimumas: %.4f %.4f \n Funkcija buvo iskviesta %d kartu \n', x1, y1, counterFunc);
else 
    fprintf('\n Minimumas: %.4f %.4f \n Funkcija buvo iskviesta %d kartu \n', x2, y2, counterFunc);
end