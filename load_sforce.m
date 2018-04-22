%-------------------------------------------------------------
% plik wczytuj�cy si�� roz�o�on� do zbioru si�
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_sforce  - liczba wprowadzonych si� w�z�owych
% All_sforce - tablica zawieraj�ca dane o si�ach w�z�owych
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