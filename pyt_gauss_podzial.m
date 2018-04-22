%-------------------------------------------------------------
% pytanie poprzedzaj¹ce WYNIKI OBLICZEÑ
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
prompt={'Podaj kwadraturê Gaussa(2-5):',...
    'Podaj liczbê przedzia³ów Gaussa:',...
    'Podaj liczbê podzia³u elementów:'};
name='Szczegó³owoœæ obliczeñ';
numlines=1;
defaultanswer={'2','1','2'};
gauss_podzial=inputdlg(prompt,name,numlines,defaultanswer);
%-------------------------------------------------------------