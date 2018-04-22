%-------------------------------------------------------------
% plik wczytuj�cy si�� roz�o�on� do zbioru si�
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_lforce  - liczba wprowadzonych si� pr�towych
% All_lforce - tablica zawieraj�ca dane si�ach pr�towych
% nr_alert   - numer alertu
%-------------------------------------------------------------
ok=0;
if nr_lforce>0
    [n,m]=size(All_lforce);
    syms s71
        s71={get(l_force1,'String')};
        x71=str2double(cell2mat(s71));  
        s72={get(l_force2,'String')};
        x72=str2double(cell2mat(s72));   
        y71=char(s71);
        y71=sym(y71);
        y72=char(s72);
        y72=sym(y72);
        for i=1:nr_element
            if x72==All_edofs(i,1)
                ok=ok+1;
            end
        end
        if ok==1
            for z=1:5
                if z==5
                     All_lforce(n+1,z)=y72;
                elseif z==get(force_type2,'Value')
                     All_lforce(n+1,z)=y71;
                else
                end
            end
        else
            nr_alert=17;
            All_alert;
        end
end
%-------------------------------------------------------------