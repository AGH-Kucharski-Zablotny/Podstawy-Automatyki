% Utworzenie ukladu dynamicznego
sys = zpk([],[0 -1 -5], 5);
% Narysowanie linii pierwiastkowych
rlocus(sys);
% Pomocnicza linia pod zadanym katem 45 stopnii
line([0 -15], [0 15]);           
% Zatrzymanie w celu przyblizenia
pause();                            
% Obliczenie K dla zadanego kata
[K, bieguny] = rlocfind(sys);       
% Zamkniecie ukladu dynamicznego
sys_zamk = feedback(K * sys, 1);    
% Odpowiedz ukladu zamknietego na skok jednostkowy
step(sys_zamk);                     