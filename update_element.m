%-------------------------------------------------------------
% plik aktualizuj�cy elementy konstrukcji
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_element - liczba wprowadzonych element�w
% All_edofs  - tablica w�z��w element�w
% Ex, Ey, Ez - odpowiednie wsp�rz�dne pocz�tku i ko�ca elementu
% Edof       - macierz topologii element�w
%-------------------------------------------------------------
licznik=0;
%-------------------------------------------------------------
for i=1:nr_element
    if (get(ee(i),'Value')==get(ee(i),'Max'))
        licznik=licznik+1;
        if i>1
            licznik2=i-licznik+1;
            All_edofs(licznik2,:)=[];
            Ex(licznik2,:)=[];
            Ey(licznik2,:)=[];
            Ez(licznik2,:)=[];
        else
            All_edofs(i,:)=[];
            Ex(i,:)=[];
            Ey(i,:)=[];
            Ez(i,:)=[];
        end
        nr_element=nr_element-1;
        
    end
end
%-------------------------------------------------------------
if nr_element>0
    Edof=zeros(nr_element,13);
    for j=1:nr_element
        Edof(j,:)=[All_edofs(j,1) All_edofs(j,2)*6-5 ...
            All_edofs(j,2)*6-4 All_edofs(j,2)*6-3 ...
            All_edofs(j,2)*6-2 All_edofs(j,2)*6-1 ...
            All_edofs(j,2)*6-0 All_edofs(j,3)*6-5  ...
            All_edofs(j,3)*6-4 All_edofs(j,3)*6-3 ...
            All_edofs(j,3)*6-2 All_edofs(j,3)*6-1 All_edofs(j,3)*6];
    end
end
%-------------------------------------------------------------
