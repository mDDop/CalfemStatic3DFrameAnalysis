%-------------------------------------------------------------
% plik wczytuj�cy dodan� podpor� standardow�
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
if nr_bc>0
    if nr_bc<=nr_dof
        s51={get(podpora1,'String')};
        x51=str2double(cell2mat(s51));
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
                    All_bc(nr_bc,z)=wiez4(z);
                end
            end
            All_bc=bubble_sort(All_bc,7);
        else
            nr_alert=12;
            All_alert;
        end
    else
        nr_alert=10;
        All_alert;
    end
end
%-------------------------------------------------------------