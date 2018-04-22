%-------------------------------------------------------------
% plik aktualizuj¹cy materia³ elementów konstrukcji
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_material- liczba elementów z przypisanym materia³em
% All_EvG    - tablica zawieraj¹ca dane materia³owe elementów
%-------------------------------------------------------------
lic=0;
for i=1:nr_material
    if (get(mm(i),'Value')==get(mm(i),'Max'))
        lic=lic+1;
        if i>1
            lic2=i-lic+1;
            All_EvG(lic2,:)=[];
        else
            All_EvG(i,:)=[];
        end
        nr_material=nr_material-1;
    end
end
%-------------------------------------------------------------