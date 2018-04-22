%-------------------------------------------------------------
% plik aktualizuj�cy si�y skupione
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_sforce  - liczba wprowadzonych si� w�z�owych
% All_sforce - tablica zawieraj�ca dane o si�ach w�z�owych
%-------------------------------------------------------------
lic=0;
for i=1:nr_sforce
    if (get(oo(i),'Value')==get(oo(i),'Max'))
        lic=lic+1;
        if i>1
            lic2=i-lic+1;
            All_sforce(lic2,:)=[];
        else
            All_sforce(i,:)=[];
        end
        nr_sforce=nr_sforce-1;
    end
end
%-------------------------------------------------------------
All_sforce=bubble_sort(All_sforce,7);
%-------------------------------------------------------------