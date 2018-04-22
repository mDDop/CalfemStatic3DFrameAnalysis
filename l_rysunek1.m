%-------------------------------------------------------------
% plik rysuj¹cy dodane wêz³y
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_dof     - liczba wprowadzonych wêz³ów
% All_coord  - tablica wspó³rzêdnych wêz³owów
%-------------------------------------------------------------
if nr_dof>0
    axis equal
    xmin = min(All_coord(:,1));
    xmax = max(All_coord(:,1));
    ymin = min(All_coord(:,2));
    ymax = max(All_coord(:,2));
    zmin = min(All_coord(:,3));
    zmax = max(All_coord(:,3));
    
    axis([xmin-1 xmax+1 ymin-1 ymax+1 zmin-1 zmax+1]);
    for i=1:nr_dof
        plot3(All_coord(i,1),All_coord(i,2),All_coord(i,3),'bs','markerfacecolor',kol2(2,:));
        hold on
        text(All_coord(i,1),All_coord(i,2),All_coord(i,3),num2str(All_coord(i,4)),'FontSize',9,'BackgroundColor',kol2(5,:),'EdgeColor',kol2(2,:),'LineWidth',1);
        hold on
    end
end
%-------------------------------------------------------------
if nr_dof>0
    axis equal
    xmin = min(All_coord(:,1));
    xmax = max(All_coord(:,1));
    ymin = min(All_coord(:,2));
    ymax = max(All_coord(:,2));
    zmin = min(All_coord(:,3));
    zmax = max(All_coord(:,3));
    %---------------------------------------------------------
    axis([xmin-1 xmax+1 ymin-1 ymax+1 zmin-1 zmax+1]);
end
%-------------------------------------------------------------