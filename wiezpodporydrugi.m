%-------------------------------------------------------------
% plik zmieniaj¹cy typ zmiennej zawieraj¹cej dane o podporze
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
for i=1:6
    wiez44=get(wiezek(i),'String');
    if wiez44=='b'
        wiez444(i)=0;
    elseif wiez44=='w'
        wiez444(i)=Inf;
    else
        wiez444(i)=str2double(wiez44);
    end
end
%-------------------------------------------------------------
