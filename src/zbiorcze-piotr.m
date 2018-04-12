
% Do rysowania linii pierwiastkowych
% Wa¿ne: licz i mian s¹ z transmitancji uk³adu otwartego
% Zadanie 1
% a)
%sys = zpk([], [-1 -1/5], 1/5);
%figure;
%rlocus(sys);

% b)
%sys = zpk(-2, [-1 -1/5], 1/5);
%figure;
%rlocus(sys);

% c)
%sys = zpk([], [-1 -1/5 -2], 10/25);
%figure;
%rlocus(sys);
%[K, bieguny] = rlocfind(sys);

% Zadanie 2
% a)
% ZnajdŸ K aby biegun by³ w k¹cie 45st
% rlocfind - oblicza wartosc wzmocnienia
% rlocus, line, pause, powiekszyc, rlocfind
sys = zpk([],[0 -1 -5], 5);
figure;
rlocus(sys);
line([0 -15], [0 15]);
pause();
[K, bieguny] = rlocfind(sys);

% Teraz zamykamy i odpowiedŸ skokowa
% K * sys zmienia wzmocnienie na poprawne
sys_zamk_a = feedback(K * sys, 1);
% Step ponizej zeby bylo na jendym rysunku

% b)
% Dwie transmitancje - po prostu je mnozymy
% rlocfind do wzmocnienia podstawiamy do feedbacka i odpowiedz skokowa
% a i b te stepy na jednym rysunku
Gc = zpk(-1, -10, 1/10);
figure;
system_zastepczy = series(sys, Gc);
rlocus(system_zastepczy);
line([0, -15], [0, 15]);
pause();
[K, bieguny] = rlocfind(system_zastepczy);

sys_zamk_b = feedback(K * system_zastepczy, 1);
figure;
step(sys_zamk_a);
hold on;
step(sys_zamk_b);
% Wniosek: Lepsze w³asnoœci dynamiczne, szybciej siê stabilizuje
% POORÓWNAJ CZÊSTOTLIWOŒCOI W£ASNE UK£ADÓW