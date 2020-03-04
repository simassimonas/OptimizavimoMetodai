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

xm = (l + r)/2;
ym = tiksloFunkcija(xm);
counterFunc = counterFunc + 1;
plot(xm, ym, 'og');
L = r - l;

while L >= tikslumas
    x1 = l + L/4;
    y1 = tiksloFunkcija(x1);
    x2 = r - L/4;
    y2 = tiksloFunkcija(x2);
    counterFunc = counterFunc + 2;
    
    fprintf('%d iteracija %.15f %.15f \n', counter, xm, ym);
    
    if y1 < ym
        r = xm;
        xm = x1;
        ym = y1;
    elseif y2 < ym
        l = xm;
        xm = x2;
        ym = y2;
    else 
        l = x1;
        r = x2;
    end
    
    plot(xm, ym, 'og');
    plot(x1, y1, 'or');
    plot(x2, y2, 'ob');
    
    L = r - l;
    counter = counter + 1;
end

fprintf('\n Minimumas: %.4f %.4f \n Funkcija buvo iskviesta %d kartu \n', xm, tiksloFunkcija(xm), counterFunc);