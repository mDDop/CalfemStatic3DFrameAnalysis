function [af_sort]=bubble_sort(matrix,column)
%-------------------------------------------------------------
% funkcja sortuj�ca wiersze macierzy wg podanej kolumny
%-------------------------------------------------------------
% Hubert Gawry�   2013-01-07
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% af_sort   - posortowana kolumna
% matrix    - macierz kt�rej wiersze maj� by� posortowane
% column    - kolumna wg kt�rej wiersze macierzy b�d� sortowane
%-------------------------------------------------------------
[a,b]=size(matrix);
bb=a;
while bb>0
    for i=1:(bb-1)
        if matrix(i,column)>matrix(i+1,column)
            pamiecbc=matrix(i+1,:);
            matrix(i+1,:)=matrix(i,:);
            matrix(i,:)=pamiecbc;
        end
    end
    bb=bb-1;
end
af_sort=matrix;
%-------------------------------------------------------------