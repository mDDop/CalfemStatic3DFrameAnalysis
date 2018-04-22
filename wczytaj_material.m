%-------------------------------------------------------------
% plik wczytuj¹cy dodany materia³
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_material- liczba elementów z przypisanym materia³em
% All_EvG    - tablica zawieraj¹ca dane materia³owe elementów
%-------------------------------------------------------------
if nr_material>0
    if nr_material<=nr_element
        %-----------------------------------------------------
        if (get(material1,'Value')==2)
            s31={get(E1,'String')};
            x31=str2double(cell2mat(s31));
            s32={get(v1,'String')};
            x32=str2double(cell2mat(s32));
            if x32>=-1 && x31>=0 && x32<=0.5
                %---------------------------------------------
                All_EvG(nr_material,1)=x31;
                All_EvG(nr_material,2)=x32;
                All_EvG(nr_material,3)=All_EvG(nr_material,1)/(2*(1+All_EvG(nr_material,2)));
                All_EvG(nr_material,4)=0;
                %---------------------------------------------
                for i=1:nr_material
                    number3(i)=0;
                end
                if nr_material==1
                    number3(1)=All_edofs(1,1);
                else
                    for i=1:nr_material
                        if All_EvG(i,4)~=All_edofs(i,1)
                            number3(i)=All_edofs(i,1);
                        end
                    end
                    for i=1:nr_material
                        if number3(i)==0
                            number3(i)=5e6;
                        end
                    end
                end
                All_EvG(nr_material,4)=min(number3);
                All_EvG=bubble_sort(All_EvG,4);
                %---------------------------------------------
            else
                nr_alert=19;
                All_alert;
            end
            %-------------------------------------------------
        elseif (get(material1,'Value')==1)
            All_EvG(nr_material,1)=tablice_mat(get(material2,'Value'),1)*1e6;
            All_EvG(nr_material,2)=tablice_mat(get(material2,'Value'),3);
            All_EvG(nr_material,3)=tablice_mat(get(material2,'Value'),2)*1e6;
            All_EvG(nr_material,4)=0;
            %-------------------------------------------------
            for i=1:nr_material
                number3(i)=0;
            end
            if nr_material==1
                number3(1)=All_edofs(1,1);
            else
                for i=1:nr_material
                    if All_EvG(i,4)~=All_edofs(i,1)
                        number3(i)=All_edofs(i,1);
                    end
                end
                for i=1:nr_material
                    if number3(i)==0
                        number3(i)=5e6;
                    end
                end
            end
            All_EvG(nr_material,4)=min(number3);
            All_EvG=bubble_sort(All_EvG,4);
            %-------------------------------------------------
        end
    else
        nr_alert=8;
        All_alert;
    end
end
%-------------------------------------------------------------