%-------------------------------------------------------------
% plik rysuj¹cy wykres przemieszczeñ
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
%rysunek ramy niezdeformowanej
plotpar=[1,2,2];
eldraw3(Ex,Ey,Ez,plotpar);
%-------------------------------------------------------------
%rysunek ramy po deformacji
plotpar=[1 4 1];
for j=1:nr_element
eldisp3_all(Ex(j,:),Ey(j,:),Ez(j,:),ediw(:,:,j),ed,eo(j,:),plotpar,All_coord);
end
title('przemieszczenia')
grid off
hold on
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