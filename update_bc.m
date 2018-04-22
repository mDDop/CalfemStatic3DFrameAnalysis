%-------------------------------------------------------------
% plik aktualizuj�cy podpory w w�z�ach konstrukcji
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_bc      - liczba podp�r wprowadzonych do konstrukcji
% All_bc     - tablica zawieraj�ca dane podp�r w�z�owych
%-------------------------------------------------------------
lic=0;
for i=1:nr_bc
    if (get(mm(i),'Value')==get(mm(i),'Max'))
        lic=lic+1;
        if i>1
            lic2=i-lic+1;
            All_bc(lic2,:)=[];
        else
            All_bc(i,:)=[];
        end
        nr_bc=nr_bc-1;
    end
end
%-------------------------------------------------------------
All_bc=bubble_sort(All_bc,7);
%-------------------------------------------------------------