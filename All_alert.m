%-------------------------------------------------------------
% plik wykonuj¹cy alarmy/ostrze¿enia/b³êdy
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_alert   - numer alertu
% nr_element - liczba wprowadzonych elementów
% nr_dof     - liczba wprowadzonych wêz³ów
% nr_material- liczba elementów z przypisanym materia³em
% nr_cross   - liczba elementów z przypisanym przekrojem
% nr_lforce  - liczba wprowadzonych si³ prêtowych
% nr_sforce  - liczba wprowadzonych si³ wêz³owych
% nr_bc      - liczba podpór wprowadzonych do konstrukcji
% etc.
%-------------------------------------------------------------
if nr_alert==1
    if (nr_dof==0) && (nr_element==1)
        uiwait(warndlg('WprowadŸ najpierw wêze³!','Uwaga'));
        nr_element=nr_element-1;
    end
elseif nr_alert==2
    if (nr_element==0) && (nr_material==1)
        uiwait(warndlg('WprowadŸ najpierw element!','Uwaga'));
        nr_material=nr_material-1;
    end
elseif nr_alert==3
    if (nr_element==0)
        uiwait(warndlg('WprowadŸ najpierw element!','Uwaga'));
    end
elseif nr_alert==4
    if (nr_element==0) && (nr_cross==1)
        uiwait(warndlg('WprowadŸ najpierw element!','Uwaga'));
        nr_cross=nr_cross-1;
    end
elseif nr_alert==5
    if (nr_element==0)
        uiwait(warndlg('WprowadŸ najpierw element!','Uwaga'));
    end
elseif nr_alert==6
    if (nr_dof==0)
        uiwait(warndlg('WprowadŸ najpierw wêze³!','Uwaga'));
        nr_bc=nr_bc-1;
    end
elseif nr_alert==7
    if (nr_dof==0)
        uiwait(warndlg('WprowadŸ najpierw wêze³!','Uwaga'));
        nr_bc=nr_bc-1;
    end
elseif nr_alert==8
    uiwait(warndlg('Materia³ jest ju¿ dodany do wszystkich elementów!','Uwaga'));
    nr_material=nr_material-1;
elseif nr_alert==9
    uiwait(warndlg('Przekrój jest ju¿ dodany do wszystkich elementów!','Uwaga'));
    nr_cross=nr_cross-1;
elseif nr_alert==10
    uiwait(warndlg('Ka¿dy wêze³ posiada ju¿ ograniczenia!','Uwaga'));
    nr_bc=nr_bc-1;
elseif nr_alert==11
    uiwait(warndlg('Ka¿dy wêze³ posiada ju¿ ograniczenia!','Uwaga'));
    nr_bc=nr_bc-1;
elseif nr_alert==12
    uiwait(helpdlg('Wêze³ do którego chcesz wprowadziæ ograniczenie nie istnieje!','Uwaga'));
    nr_bc=nr_bc-1;
elseif nr_alert==13
    uiwait(helpdlg('Wêze³ do którego chcesz wprowadziæ ograniczenie nie istnieje!','Uwaga'));
    nr_bc=nr_bc-1;
elseif nr_alert==14
    if (nr_dof==0)
        uiwait(warndlg('WprowadŸ najpierw wêze³!','Uwaga'));
        nr_sforce=nr_sforce-1;
    end
elseif nr_alert==15
    uiwait(helpdlg('Wêze³ do którego chcesz wprowadziæ obci¹¿enie nie istnieje!','Uwaga'));
    nr_sforce=nr_sforce-1;
elseif nr_alert==16
    if (nr_element==0)
        uiwait(warndlg('WprowadŸ najpierw element!','Uwaga'));
        nr_lforce=nr_lforce-1;
    end
elseif nr_alert==17
    uiwait(helpdlg('Element do którego chcesz wprowadziæ obci¹¿enie nie istnieje!','Uwaga'));
    nr_lforce=nr_lforce-1;
elseif nr_alert==18
    uiwait(helpdlg('Wêzê³ do którego chcesz wprowadziæ element nie istnieje!','Uwaga'));
    nr_element=nr_element-1;
elseif nr_alert==19
    uiwait(helpdlg('Wprowadzono niepoprawne dane!','Uwaga'));
    nr_material=nr_material-1;
elseif nr_alert==20
    uiwait(helpdlg('Wprowadzono niepoprawne dane!','Uwaga'));
    nr_cross=nr_cross-1;
elseif nr_alert==21
    uiwait(helpdlg('Wprowadzono niepoprawne dane, wymiar prostok¹ta musi mieæ wartoœæ wiêksz¹ od 0!','Uwaga'));
    nr_cross=nr_cross-1;
elseif nr_alert==22
    uiwait(helpdlg('Wprowadzono niepoprawne dane, wartoœæ cosinusa musi mieœciæ siê w przedziale <-1,1>!','Uwaga'));
    nr_cross=nr_cross-1;
elseif nr_alert==23
    uiwait(helpdlg('Wprowadzono niepoprawne dane, operacja nie zostanie wykonana!','Uwaga'));
    [N_allEvG,M_allEvG]=size(All_EvG);
    if N_allEvG==1 && M_allEvG==1
        nr_material=0;
    else
        nr_material=N_allEvG;
    end
elseif nr_alert==24
    uiwait(helpdlg('Wprowadzono niepoprawne dane, wymiar prostok¹ta musi mieæ wartoœæ wiêksz¹ od 0! Operacja nie zostanie wykonana!','Uwaga'));
    [N_alleo,M_alleo]=size(All_eo);
    if N_alleo==1 && M_alleo==1
        nr_cross=0;
    else
        nr_cross=N_alleo;
    end
elseif nr_alert==25
    uiwait(helpdlg('Wprowadzono niepoprawne dane! Operacja nie zostanie wykonana!','Uwaga'));
    [N_alliiak,M_alliiak]=size(All_iiak);
    if N_alliiak==1 && M_alliiak==1
        nr_cross=0;
    else
        nr_cross=N_alliiak;
    end
elseif nr_alert==26
    uiwait(helpdlg('Wprowadzono niepoprawne dane, wartoœæ cosinusa musi mieœciæ siê w przedziale <-1,1>! Operacja nie zostanie wykonana!','Uwaga'));
    [N_alliiak,M_alliiak]=size(All_iiak);
    if N_alliiak==1 && M_alliiak==1
        nr_cross=0;
    else
        nr_cross=N_alliiak;
    end
elseif nr_alert==27
    uiwait(helpdlg('Wprowadzono niepoprawne dane! Operacja nie zostanie wykonana!','Uwaga'));
    nr_bc=nr_bc-1;
elseif nr_alert==28
    uiwait(helpdlg('Wprowadzono niepoprawn¹ wspó³rzêdn¹! Operacja nie zostanie wykonana','Uwaga'));
    nr_dof=nr_dof-1;
end
%-------------------------------------------------------------



