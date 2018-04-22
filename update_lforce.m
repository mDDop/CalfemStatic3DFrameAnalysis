%-------------------------------------------------------------
% plik aktualizuj¹cy si³y roz³o¿one na elemencie
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_lforce  - liczba wprowadzonych si³ prêtowych
% All_lforce - tablica zawieraj¹ca dane si³ach prêtowych
%-------------------------------------------------------------
lic=0;
lic3=0;
if nr_lforce>0
    [N_lforce,M_lforce]=size(All_lforce);
    for k=1:N_lforce
        if M_lforce>1
            if All_lforce(k,5)~='0'
                lic3=lic3+1;
                lic_lforce=k;
                lic_lforce1(lic3)=lic_lforce;
            end
        end
    end
end
for i=1:nr_lforce
    if (get(mm(i),'Value')==get(mm(i),'Max'))
        lic=lic+1;
        if i>1
            lic2=i-lic+1;
            All_lforce(lic_lforce1(i),1:5)='0';
        else
            All_lforce(lic_lforce1(i),1:5)='0';
        end
        nr_lforce=nr_lforce-1;
    end
end
%-------------------------------------------------------------
