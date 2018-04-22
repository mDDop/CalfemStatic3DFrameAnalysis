function [sfac]=scalfact3(ex,ey,ez,ed,rat)
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
 if ~((nargin==4)|(nargin==5))
    disp('??? Wrong number of input arguments!')
    return
 end
 a=size(ex); b=size(ey); c=size(ez);
 if ((a-b)==[0 0]) | ((a-c)==[0 0]) | ((b-c)==[0 0])
    nen=a(2); 
 else
    disp('??? Check size of coordinate input arguments!')
    return
 end
%-------------------------------------------------------------
 dxmax=max(max(ex')-min(ex')); dymax=max(max(ey')-min(ey')); dzmax=max(max(ez')-min(ez'));
 dlmax=max(dxmax,dymax);
 x=max(dlmax,dzmax);
 edmax=max(max(abs(ed)));
%-------------------------------------------------------------
 if nargin==4
    k=0.2; 
 else
    k=rat;
 end
 sfac=k*x/edmax;
%------------------------------------------------------------- 

