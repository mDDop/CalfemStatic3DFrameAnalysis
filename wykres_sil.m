%-------------------------------------------------------------
% plik rysuj¹cy wykres si³ przekrojowych
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
if nr_element>0
    if (get(sila,'Value')==1)
        for j=1:nr_element
            subplot(1,4,2:4);
            [scal]=scalfact3(Ex,Ey,Ez,es(:,1,:));
            wykresy3(Ex(j,:),Ey(j,:),Ez(j,:),es(:,1,j),eci(:,j),scal,napisy_s,grid_v,nr_dof,All_coord);
        end
    elseif (get(sila,'Value')==2)
        for j=1:nr_element
            subplot(1,4,2:4);
            [scal]=scalfact3(Ex,Ey,Ez,es(:,2,:));
            wykresy3(Ex(j,:),Ey(j,:),Ez(j,:),es(:,2,j),eci(:,j),scal,napisy_s,grid_v,nr_dof,All_coord);
        end
    elseif (get(sila,'Value')==3)
        for j=1:nr_element
            subplot(1,4,2:4);
            [scal]=scalfact3(Ex,Ey,Ez,es(:,3,:));
            wykresy3(Ex(j,:),Ey(j,:),Ez(j,:),es(:,3,j),eci(:,j),scal,napisy_s,grid_v,nr_dof,All_coord);
        end
    elseif (get(sila,'Value')==4)
        for j=1:nr_element
            subplot(1,4,2:4);
            [scal]=scalfact3(Ex,Ey,Ez,es(:,4,:));
            wykresy3(Ex(j,:),Ey(j,:),Ez(j,:),es(:,4,j),eci(:,j),scal,napisy_s,grid_v,nr_dof,All_coord);
        end
    elseif (get(sila,'Value')==5)
        for j=1:nr_element
            subplot(1,4,2:4);
            [scal]=scalfact3(Ex,Ey,Ez,es(:,5,:));
            wykresy3(Ex(j,:),Ey(j,:),Ez(j,:),es(:,5,j),eci(:,j),scal,napisy_s,grid_v,nr_dof,All_coord);
        end
    elseif (get(sila,'Value')==6)
        for j=1:nr_element
            subplot(1,4,2:4);
            [scal]=scalfact3(Ex,Ey,Ez,es(:,6,:));
            wykresy3(Ex(j,:),Ey(j,:),Ez(j,:),es(:,6,j),eci(:,j),scal,napisy_s,grid_v,nr_dof,All_coord);
        end
    end
end
%-------------------------------------------------------------