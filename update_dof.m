%-------------------------------------------------------------
% plik aktualizuj�cy w�z�y konstrukcji
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_dof     - liczba wprowadzonych w�z��w
% All_coord  - tablica wsp�rz�dnych w�z�ow�w
% All_dof    - tablica stopni swobody w�z��w
%-------------------------------------------------------------
lic=0;
for i=1:nr_dof
    if (get(cc(i),'Value')==get(cc(i),'Max'))
        lic=lic+1;
        if i>1
            lic2=i-lic+1;
            All_coord(lic2,:)=[];
            All_dof(lic2,:)=[];
        else
            All_coord(i,:)=[];
            All_dof(i,:)=[];
        end
        nr_dof=nr_dof-1;
    end
end
%-------------------------------------------------------------
if nr_dof>0
    All_dof=zeros(nr_dof,7);
    for i=1:nr_dof
        All_dof(i,:)=[All_coord((i),4)*6-5 ...
            All_coord((i),4)*6-4 All_coord((i),4)*6-3 ...
            All_coord((i),4)*6-2 All_coord((i),4)*6-1 ...
            All_coord((i),4)*6 All_coord((i),4)];
    end
end
%-------------------------------------------------------------