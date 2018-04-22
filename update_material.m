%-------------------------------------------------------------
% plik aktualizuj�cy materia� element�w konstrukcji
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_material- liczba element�w z przypisanym materia�em
% All_EvG    - tablica zawieraj�ca dane materia�owe element�w
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