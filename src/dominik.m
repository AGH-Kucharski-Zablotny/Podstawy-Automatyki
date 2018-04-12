sys = zpk([], [-1 -1/5 -2], 10/25);
figure;
rlocus(sys);
pause;
[K, bieguny] = rlocfind(sys);