%-------------------------------------------------------------
% plik transformuj�cy podpor� standardow�
%-------------------------------------------------------------
% Hubert Gawry�   2013-01-07
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% wiez2   - zmienna zale�na od wybranej podpory standardowej
% wiez3   - liczba zablokowanych stopni swobody dla podpory
% wiez4   - wektor zablokowanych stopni swobody dla podpory
%-------------------------------------------------------------
wiez2=get(wiez,'Value');
if wiez2==1
    wiez3=6;
    wiez4=[0 0 0 0 0 0];
elseif wiez2==2
    wiez3=3;
    wiez4=[0 0 0 1 1 1];
end
%-------------------------------------------------------------