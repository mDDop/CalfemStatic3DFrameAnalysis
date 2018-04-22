%-------------------------------------------------------------
% plik aktualizuj¹cy elementy konstrukcji
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_element - liczba wprowadzonych elementów
% All_edofs  - tablica wêz³ów elementów
% Ex, Ey, Ez - odpowiednie wspó³rzêdne pocz¹tku i koñca elementu
% Edof       - macierz topologii elementów
%-------------------------------------------------------------
licznik=0;
%-------------------------------------------------------------
for i=1:nr_element
    if (get(ee(i),'Value')==get(ee(i),'Max'))
        licznik=licznik+1;
        if i>1
            licznik2=i-licznik+1;
            All_edofs(licznik2,:)=[];
            Ex(licznik2,:)=[];
            Ey(licznik2,:)=[];
            Ez(licznik2,:)=[];
        else
            All_edofs(i,:)=[];
            Ex(i,:)=[];
            Ey(i,:)=[];
            Ez(i,:)=[];
        end
        nr_element=nr_element-1;
        
    end
end
%-------------------------------------------------------------
if nr_element>0
    Edof=zeros(nr_element,13);
    for j=1:nr_element
        Edof(j,:)=[All_edofs(j,1) All_edofs(j,2)*6-5 ...
            All_edofs(j,2)*6-4 All_edofs(j,2)*6-3 ...
            All_edofs(j,2)*6-2 All_edofs(j,2)*6-1 ...
            All_edofs(j,2)*6-0 All_edofs(j,3)*6-5  ...
            All_edofs(j,3)*6-4 All_edofs(j,3)*6-3 ...
            All_edofs(j,3)*6-2 All_edofs(j,3)*6-1 All_edofs(j,3)*6];
    end
end
%-------------------------------------------------------------
