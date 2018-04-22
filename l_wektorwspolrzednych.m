%-------------------------------------------------------------
% plik tworz¹cy wektory wspó³rzêdnych elementów
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_element - liczba wprowadzonych elementów
% Ex, Ey, Ez - odpowiednie wspó³rzêdne pocz¹tku i koñca elementu
% nr_dof     - liczba wprowadzonych wêz³ów
% All_coord  - tablica wspó³rzêdnych wêz³owów
% All_dof    - tablica stopni swobody wêz³ów
% Edof       - macierz topologii elementów
%-------------------------------------------------------------
if nr_dof>0
    if nr_element>0
        [Ex,Ey,Ez]=coordxtr(Edof,All_coord(:,1:3),All_dof(:,1:6),2);
    end
end
%-------------------------------------------------------------