%-------------------------------------------------------------
% plik wczytuj¹cy dodany wêze³
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_dof     - liczba wprowadzonych wêz³ów
% All_coord  - tablica wspó³rzêdnych wêz³owów
% All_dof    - tablica stopni swobody wêz³ów
%-------------------------------------------------------------
if nr_dof>0
    s11={get(w1,'String')};
    x11=str2double(cell2mat(s11));
    %---------------------------------------------------------
    s12={get(w2,'String')};
    x12=str2double(cell2mat(s12));
    %---------------------------------------------------------
    s13={get(w3,'String')};
    x13=str2double(cell2mat(s13));
    %---------------------------------------------------------
    All_coord(nr_dof,1)=x11;
    All_coord(nr_dof,2)=x12;
    All_coord(nr_dof,3)=x13;
    for i=1:nr_dof
        number(i)=0;
    end
    if nr_dof==1
        number(1)=1;
    else
        for i=1:nr_dof
            if All_coord(i,4)~=i
                number(i)=i;
            end
        end
        for i=1:nr_dof
            if number(i)==0
                number(i)=5e6;
            end
        end
    end
end
%-------------------------------------------------------------
All_coord(nr_dof,4)=min(number);
All_coord=bubble_sort(All_coord,4);
%-------------------------------------------------------------
if nr_dof>0
    All_dof=zeros(nr_dof,7);
    for i=1:nr_dof
        
        All_dof(i,:)=[All_coord((i),4)*6-5 All_coord((i),4)*6-4 All_coord((i),4)*6-3 ...
            All_coord((i),4)*6-2 All_coord((i),4)*6-1 All_coord((i),4)*6 All_coord((i),4)];
    end
end
%-------------------------------------------------------------
