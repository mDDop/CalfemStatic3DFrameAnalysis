%-------------------------------------------------------------
% plik tworz�cy wektory wsp�rz�dnych element�w
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
% All_dof    - tablica stopni swobody w�z��w
% Edof       - macierz topologii element�w
%-------------------------------------------------------------
if nr_dof>0
    if nr_element>0
        [Ex,Ey,Ez]=coordxtr(Edof,All_coord(:,1:3),All_dof(:,1:6),2);
    end
end
%-------------------------------------------------------------