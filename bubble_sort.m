function [af_sort]=bubble_sort(matrix,column)
%-------------------------------------------------------------
% funkcja sortuj¹ca wiersze macierzy wg podanej kolumny
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% af_sort   - posortowana kolumna
% matrix    - macierz której wiersze maj¹ byæ posortowane
% column    - kolumna wg której wiersze macierzy bêd¹ sortowane
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