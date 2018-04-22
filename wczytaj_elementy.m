%-------------------------------------------------------------
% plik wczytuj�cy dodany element
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_element - liczba wprowadzonych element�w
% Ex, Ey, Ez - odpowiednie wsp�rz�dne pocz�tku i ko�ca elementu
% nr_dof     - liczba wprowadzonych w�z��w
% All_coord  - tablica wsp�rz�dnych w�z�ow�w
% All_edofs  - tablica w�z��w element�w
%-------------------------------------------------------------
ok=0;
if nr_element>0
    s21={get(e1,'String')};
    x21=str2double(cell2mat(s21));
    s22={get(e2,'String')};
    x22=str2double(cell2mat(s22));
    for i=1:nr_dof
        if x21==All_dof(i,7)
            ok=ok+1;
        end
        if x22==All_dof(i,7)
            ok=ok+1;
        end
    end
    if ok==2
        All_edofs(nr_element,2)=x21;
        All_edofs(nr_element,3)=x22;
        for i=1:nr_element
            number2(i)=0;
        end
        if nr_element==1
            number2(1)=1;
        else
            for i=1:nr_element
                if All_edofs(i,1)~=i
                    number2(i)=i;
                end
            end
            for i=1:nr_element
                if number2(i)==0
                    number2(i)=5e6;
                end
            end
        end
    else
        nr_alert=18;
        All_alert;
    end
    All_edofs(nr_element,1)=min(number2);
    All_edofs=bubble_sort(All_edofs,1);
end
%-------------------------------------------------------------
if nr_element>0
    Edof=zeros(nr_element,13);
    for j=1:nr_element
        Edof(j,:)=[All_edofs(j,1) All_edofs(j,2)*6-5 ...
            All_edofs(j,2)*6-4 All_edofs(j,2)*6-3 ...
            All_edofs(j,2)*6-2 All_edofs(j,2)*6-1 ...
            All_edofs(j,2)*6 All_edofs(j,3)*6-5 ...
            All_edofs(j,3)*6-4 All_edofs(j,3)*6-3 ...
            All_edofs(j,3)*6-2 All_edofs(j,3)*6-1 ...
            All_edofs(j,3)*6];
    end
end
%-------------------------------------------------------------