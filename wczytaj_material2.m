%-------------------------------------------------------------
% plik wczytuj�cy dodane materia�y
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_material- liczba element�w z przypisanym materia�em
% All_EvG    - tablica zawieraj�ca dane materia�owe element�w
%-------------------------------------------------------------
if nr_material>0
    for i=1:nr_material
        if (get(material1,'Value')==2)
            s31={get(E1,'String')};
            x31=str2double(cell2mat(s31));
            %-------------------------------------------------
            s32={get(v1,'String')};
            x32=str2double(cell2mat(s32));
            %-------------------------------------------------
            if x32>=-1 && x31>=0 && x32<=0.5
                All_EvG(i,1)=x31;
                All_EvG(i,2)=x32;
                All_EvG(i,3)=All_EvG(i,1)/(2*(1+All_EvG(i,2)));
                All_EvG(i,4)=All_edofs(i,1);
            else
                nr_alert=23;
                All_alert;
            end
        elseif (get(material1,'Value')==1)
            All_EvG(i,1)=tablice_mat(get(material2,'Value'),1)*1e6;
            All_EvG(i,2)=tablice_mat(get(material2,'Value'),3);
            All_EvG(i,3)=tablice_mat(get(material2,'Value'),2)*1e6;
            All_EvG(i,4)=All_edofs(i,1);
        end
    end
end
%-------------------------------------------------------------





