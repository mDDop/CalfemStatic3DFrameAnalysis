%-------------------------------------------------------------
% plik aktualizuj¹cy si³y skupione
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_sforce  - liczba wprowadzonych si³ wêz³owych
% All_sforce - tablica zawieraj¹ca dane o si³ach wêz³owych
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