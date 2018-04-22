%-------------------------------------------------------------
% plik wczytuj¹cy dodany przekrój
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_cross   - liczba elementów z przypisanym przekrojem
% All_iiak   - tablica zawieraj¹ca dane o przekroju elementu
%-------------------------------------------------------------
if nr_cross>0
    if nr_cross<=nr_element
        if (get(profil2,'Value')==3)
            s41={get(Iz1,'String')};
            x41=str2double(cell2mat(s41));
            %-------------------------------------------------
            s42={get(Iy1,'String')};
            x42=str2double(cell2mat(s42));
            %-------------------------------------------------
            s43={get(A1,'String')};
            x43=str2double(cell2mat(s43));
            %-------------------------------------------------
            s44={get(Kv1,'String')};
            x44=str2double(cell2mat(s44));
        end
        %-----------------------------------------------------
        s45={get(ex1,'String')};
        x45=str2double(cell2mat(s45));
        %-----------------------------------------------------
        s46={get(ey1,'String')};
        x46=str2double(cell2mat(s46));
        %-----------------------------------------------------
        s47={get(ez1,'String')};
        x47=str2double(cell2mat(s47));
        %-----------------------------------------------------
        if (get(profil2,'Value')==2)
            s48={get(h1,'String')};
            x48=str2double(cell2mat(s48));
            %-------------------------------------------------
            s49={get(b1,'String')};
            x49=str2double(cell2mat(s49));
        end
        %-----------------------------------------------------
        if x45>=-1 && x45<=1 && x46>=-1 && x46<=1 && x47>=-1 && x47<=1
            All_eo(nr_cross,1)=x45;
            All_eo(nr_cross,2)=x46;
            All_eo(nr_cross,3)=x47;
            All_eo(nr_cross,4)=0;
            if (get(profil2,'Value')==3)
                if x41>=0 && x42>=0 && x43>=0 && x44>=0
                    All_iiak(nr_cross,1)=x41;
                    All_iiak(nr_cross,2)=x42;
                    All_iiak(nr_cross,3)=x43;
                    All_iiak(nr_cross,4)=x44;
                    All_iiak(nr_cross,5)=0;
                    %-----------------------------------------
                    
                    for i=1:nr_cross
                        number4(i)=0;
                    end
                    if nr_cross==1
                        number4(1)=All_edofs(1,1);
                    else
                        for i=1:nr_cross
                            if All_iiak(i,5)~=All_edofs(i,1)
                                number4(i)=All_edofs(i,1);
                            end
                        end
                        for i=1:nr_cross
                            if number4(i)==0
                                number4(i)=5e6;
                            end
                        end
                    end
                    %-----------------------------------------
                    All_iiak(nr_cross,5)=min(number4);
                    All_iiak=bubble_sort(All_iiak,5);
                    All_eo(nr_cross,4)=min(number4);
                    All_eo=bubble_sort(All_eo,4);
                    %-----------------------------------------
                else
                    nr_alert=20;
                    All_alert
                end
            elseif (get(profil2,'Value')==1)
                All_iiak(nr_cross,1)=tablice(get(profil1,'Value'),2)*1e-8;
                All_iiak(nr_cross,2)=tablice(get(profil1,'Value'),3)*1e-8;
                All_iiak(nr_cross,3)=tablice(get(profil1,'Value'),1)*1e-4;
                All_iiak(nr_cross,4)=tablice(get(profil1,'Value'),4)*1e-8;
                All_iiak(nr_cross,5)=0;
                %---------------------------------------------
                
                for i=1:nr_cross
                    number4(i)=0;
                end
                if nr_cross==1
                    number4(1)=All_edofs(1,1);
                else
                    for i=1:nr_cross
                        if All_iiak(i,5)~=All_edofs(i,1)
                            number4(i)=All_edofs(i,1);
                        end
                    end
                    for i=1:nr_cross
                        if number4(i)==0
                            number4(i)=5e6;
                        end
                    end
                end
                %---------------------------------------------
                All_iiak(nr_cross,5)=min(number4);
                All_iiak=bubble_sort(All_iiak,5);
                All_eo(nr_cross,4)=min(number4);
                All_eo=bubble_sort(All_eo,4);
                %---------------------------------------------
            elseif (get(profil2,'Value')==2)
                if x48>0 && x49>0
                    All_iiak(nr_cross,1)=x48^3*x49/12;
                    All_iiak(nr_cross,2)=x49^3*x48/12;
                    All_iiak(nr_cross,3)=x48*x49;
                    All_iiak(nr_cross,4)=(1/3-0.21*(x49/x48)*(1-x49^4/(12*x48^4)))*x49^3*x48;
                    All_iiak(nr_cross,5)=0;
                    %-----------------------------------------
                    
                    for i=1:nr_cross
                        number4(i)=0;
                    end
                    if nr_cross==1
                        number4(1)=All_edofs(1,1);
                    else
                        for i=1:nr_cross
                            if All_iiak(i,5)~=All_edofs(i,1)
                                number4(i)=All_edofs(i,1);
                            end
                        end
                        for i=1:nr_cross
                            if number4(i)==0
                                number4(i)=5e6;
                            end
                        end
                    end
                    %-----------------------------------------
                    All_iiak(nr_cross,5)=min(number4);
                    All_iiak=bubble_sort(All_iiak,5);
                    All_eo(nr_cross,4)=min(number4);
                    All_eo=bubble_sort(All_eo,4);
                    %-----------------------------------------
                else
                    nr_alert=21;
                    All_alert;
                end
            end
            %-------------------------------------------------
        else
            nr_alert=22;
            All_alert;
        end
    else
        nr_alert=9;
        All_alert;
    end
end
%-------------------------------------------------------------


