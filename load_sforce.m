%-------------------------------------------------------------
% plik wczytuj¹cy si³ê roz³o¿on¹ do zbioru si³
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_sforce  - liczba wprowadzonych si³ wêz³owych
% All_sforce - tablica zawieraj¹ca dane o si³ach wêz³owych
% nr_alert   - numer alertu
%-------------------------------------------------------------
ok=0;
if nr_sforce>0
    s61={get(s_force1,'String')};
    x61=str2double(cell2mat(s61));
    s62={get(s_force2,'String')};
    x62=str2double(cell2mat(s62));
    for i=1:nr_dof
        if x62==All_coord(i,4)
            ok=ok+1;
        end
    end
    if ok==1
        for z=1:7
            if z==7
                All_sforce(nr_sforce,z)=x62;
            elseif z==get(force_type1,'Value')
                All_sforce(nr_sforce,z)=x61;
            else
                All_sforce(nr_sforce,z)=0;
            end
        end
        All_sforce=bubble_sort(All_sforce,7);
    else
        nr_alert=15;
        All_alert;
    end
end
%-------------------------------------------------------------