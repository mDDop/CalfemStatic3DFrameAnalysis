%-------------------------------------------------------------
% pytanie poprzedzaj�ce WYNIKI OBLICZE�
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
prompt={'Podaj kwadratur� Gaussa(2-5):',...
    'Podaj liczb� przedzia��w Gaussa:',...
    'Podaj liczb� podzia�u element�w:'};
name='Szczeg�owo�� oblicze�';
numlines=1;
defaultanswer={'2','1','2'};
gauss_podzial=inputdlg(prompt,name,numlines,defaultanswer);
%-------------------------------------------------------------