% Oryginalny system dynamiczny
sys = zpk([],[0 -1 -5], 5);
% Utworzenie kompensatora
Gc = zpk(-1, -10, 1/10);
% Utworzenie systemu zastepczego
system_zastepczy = series(sys, Gc);
% Narysowanie linii pierwiastkowych ukladu zastepczego
rlocus(system_zastepczy);
% Narysowanie linii pomocniczej
line([0, -15], [0, 15]);
% Zatrzymanie wykonywania w celu przyblizenia
pause();
% Obliczenie wzmocnienia dla ukladu zastepczego
[K, bieguny] = rlocfind(system_zastepczy);
% Stworzenie ukladu zamknietego
sys_zamk_b = feedback(K * system_zastepczy, 1);
% Odpowiedz ukladu zastepczego na skok jednostkowy
step(sys_zamk_b);