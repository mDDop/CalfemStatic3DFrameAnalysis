%-------------------------------------------------------------
% plik aktualizuj¹cy podpory w wêz³ach konstrukcji
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_bc      - liczba podpór wprowadzonych do konstrukcji
% All_bc     - tablica zawieraj¹ca dane podpór wêz³owych
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