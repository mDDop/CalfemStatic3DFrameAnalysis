%-------------------------------------------------------------
% plik wczytuj�cy dodan� podpor� dowoln�
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_bc      - liczba podp�r wprowadzonych do konstrukcji
% All_bc     - tablica zawieraj�ca dane podp�r w�z�owych
%-------------------------------------------------------------
ok=0;
ok2=0;
if nr_bc>0
    if nr_bc<=nr_dof
        s51={get(podpora2,'String')};
        x51=str2double(cell2mat(s51));
        for i=1:6
            if wiez444(i)>=-Inf || wiez444(i)<=Inf
                ok2=ok2+1;
            end
        end
        if ok2==6
            for i=1:nr_dof
                if x51==All_coord(i,4)
                    ok=ok+1;
                end
            end
            if ok==1
                for z=1:7
                    if z==7
                        All_bc(nr_bc,z)=x51;
                    else
                        All_bc(nr_bc,z)=wiez444(z);
                    end
                end
                All_bc=bubble_sort(All_bc,7);
            else
                nr_alert=13;
                All_alert;
            end
        else
            nr_alert=27;
            All_alert;
        end
    else
        nr_alert=11;
        All_alert;
    end
end
%-------------------------------------------------------------