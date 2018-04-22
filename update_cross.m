%-------------------------------------------------------------
% plik aktualizuj¹cy przekroje w elementach
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_cross   - liczba elementów z przypisanym przekrojem
% All_iiak   - tablica zawieraj¹ca dane o przekroju elementu
%-------------------------------------------------------------
lic=0;
for i=1:nr_cross
    if (get(pp(i),'Value')==get(pp(i),'Max'))
        lic=lic+1;
        if i>1
            lic2=i-lic+1;
            All_iiak(lic2,:)=[];
            All_eo(lic2,:)=[];
        else
            All_iiak(i,:)=[];
            All_eo(i,:)=[];
        end
        nr_cross=nr_cross-1;
    end
end
%-------------------------------------------------------------