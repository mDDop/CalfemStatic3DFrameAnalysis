function [es,edi,eci]=beam3s_all(ex,ey,ez,eo,ep,ed,eq,n,m2,k)
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
if nargin<=7  n=2; end;
b=[ ex(2)-ex(1); ey(2)-ey(1); ez(2)-ez(1) ];
L=sqrt(b'*b);n1=b/L;
%-------------------------------------------------------------
lc=sqrt(eo*eo');n3=eo/lc;
%-------------------------------------------------------------
EIy=ep(1)*ep(4); EIz=ep(1)*ep(5);
EA=ep(1)*ep(3); GKv=ep(2)*ep(6);
%-------------------------------------------------------------
n2(1)=n3(2)*n1(3)-n3(3)*n1(2);
n2(2)=-n1(3)*n3(1)+n1(1)*n3(3);
n2(3)=n3(1)*n1(2)-n1(1)*n3(2);
%-------------------------------------------------------------
An=[n1';
    n2;
    n3];
%-------------------------------------------------------------
G=[  An     zeros(3) zeros(3) zeros(3);
    zeros(3)   An     zeros(3) zeros(3);
    zeros(3) zeros(3)   An     zeros(3);
    zeros(3) zeros(3) zeros(3)   An    ];                                   
%-------------------------------------------------------------
syms x W W2 x0 x02
%-------------------------------------------------------------
%W si³a wypadkowa od obci¹¿enia na ca³ej d³ugoœci prêta
%W2 sila wypadkowa od obci¹¿enia na odleglosci x
%x0 ramie si³y W
%x02 ramie sily W2
%-------------------------------------------------------------
W=gauss2(eq(2),x,0,L,m2,k);
W2=gauss2(eq(2),x,0,x,m2,k);
x0=gauss2(eq(2)*x,x,0,L,m2,k)/W;
x02=gauss2(eq(2)*x,x,0,x,m2,k)/W2;
%-------------------------------------------------------------
% zz- wektor przemieszczenia wy³¹cznie od obci¹¿enia 
% roz³o¿onego na prêcie
zz=zeros(12,1);
if eq(2)==0
    zz(12,1)=0;
    zz(8,1)=0;
else
    % obrót od obci¹¿enia roz³o¿onego eq(2)
    zz(12,1)=-gauss2(-W*x0-W2*(x-x02)+W*x,x,0,L,m2,k)/EIz;
    % przemieszczenie od obci¹¿enia roz³o¿onego eq(2)
    zz(8,1)=gauss2((-W*x0-W2*(x-x02)+W*x)*(-L+x),x,0,L,m2,k)/EIz;
end
%-------------------------------------------------------------
W=gauss2(eq(3),x,0,L,m2,k);
W2=gauss2(eq(3),x,0,x,m2,k);
x0=gauss2(eq(3)*x,x,0,L,m2,k)/W;
x02=gauss2(eq(3)*x,x,0,x,m2,k)/W2;
%-------------------------------------------------------------
if eq(3)==0
    zz(11,1)=0;
    zz(9,1)=0;
else
    % obrót od obci¹¿enia roz³o¿onego eq(3)
    zz(11,1)=gauss2(-W*x0-W2*(x-x02)+W*x,x,0,L,m2,k)/EIy;
    % przemieszczenie od obci¹¿enia roz³o¿onego eq(3)
    zz(9,1)=gauss2((-W*x0-W2*(x-x02)+W*x)*(-L+x),x,0,L,m2,k)/EIy;
end
%-------------------------------------------------------------
% W si³a wypadkowa rozci¹gaj¹ca od obci¹¿enia 
% na ca³ej d³ugoœci prêta
W=gauss2(eq(1),x,0,L,m2,k);
% W2 si³a wypadkowa rozci¹gaj¹ca od obci¹¿enia na d³ugoœci x
W2=gauss2(eq(1),x,0,x,m2,k);
%-------------------------------------------------------------
if eq(1)==0
    zz(7,1)=0;
else
    % przemieszczenie od obci¹¿enia rozci¹gaj¹cego
    zz(7,1)=gauss2(W-W2,x,0,L,m2,k)/EA;
end
%-------------------------------------------------------------
% W si³a wypadkowa skrêcaj¹ca od obci¹¿enia 
% na ca³ej d³ugoœci prêta
W=gauss2(eq(4),x,0,L,m2,k);
% W2 si³a wypadkowa skrêcaj¹ca od obci¹¿enia na d³ugoœci x
W2=gauss2(eq(4),x,0,x,m2,k);
%-------------------------------------------------------------
if eq(4)==0
    zz(10,1)=0;
else
    % przemieszczenie od obci¹¿enia skrêcaj¹cego
    zz(10,1)=gauss2(W-W2,x,0,L,m2,k)/GKv;                                         
end
%-------------------------------------------------------------
% G- macie¿ transformacji
u=G*ed'-zz;                                                                
%-------------------------------------------------------------
% ed- wektor przemieszczeñ w uk³adzie globalnym od wszystkich 
%     obci¹¿eñ(skupionych i roz³o¿onych) na ca³ej konstrukcji
% zz- wektor przemieszczenia wy³¹cznie od obci¹¿enia 
%     roz³o¿onego na prêcie
% u-  wektor przemieszczenia od wszystkich obci¹¿eñ minus 
%     przemieszczenie od obci¹¿enia roz³o¿onego
C=[0 1   0    0  0 0    0     0   0 0 0 0;
    0 0   0    0  0 1    0     0   0 0 0 0;
    0 0   0    0  0 0    0     0   0 1 0 0;
    0 0   0    0  0 0    0     0   0 0 0 1;
    0 0   0    0  0 0    0     0  -1 0 0 0;
    0 0   0    0  1 0    0     0   0 0 0 0;
    L 1   0    0  0 0    0     0   0 0 0 0;
    0 0  L^3  L^2 L 1    0     0   0 0 0 0;
    0 0   0    0  0 0   L^3   L^2  L 1 0 0;
    0 0   0    0  0 0    0     0   0 0 L 1;
    0 0   0    0  0 0 -3*L^2 -2*L -1 0 0 0;
    0 0 3*L^2 2*L 1 0    0     0   0 0 0 0];

m=inv(C)*u;

for i=1:n
    eci(i,1)=((i-1)*L/(n-1))';
    V=eci(i,1);
    % Qx- wypadkowa od obci¹¿enia 
    % rozci¹gaj¹cego na d³ugoœci V
    Qx=gauss2(eq(1),x,0,L)-gauss2(eq(1),x,0,V,m2,k);
    % Qy- wypadkowa od obci¹¿enia
    % zginaj¹cego na d³ugoœci V
    Qy=gauss2(eq(2),x,0,L)-gauss2(eq(2),x,0,V,m2,k);
    % Qz- wypadkowa od obci¹¿enia 
    % zginaj¹cego na d³ugoœci V
    Qz=gauss2(eq(3),x,0,L)-gauss2(eq(3),x,0,V,m2,k);
    % Qw- wypadkowa od obci¹¿enia 
    % skrêcaj¹cego na d³ugoœci V
    Qw=gauss2(eq(4),x,0,L)-gauss2(eq(4),x,0,V,m2,k);
    x0y=gauss2(eq(2)*x,x,0,V,m2,k);                                                                   
    x0y1=gauss2(eq(2)*x,x,0,L,m2,k);
    
    if Qy==0
        QQy=0;
    else
        % QQy- moment zginaj¹cy od obci¹¿enia
        % zginaj¹cego na d³ugoœci V
        QQy=Qy*((gauss2(eq(2)*x,x,V,L,m2,k)/Qy-V));
    end
    if Qz==0
        QQz=0;
    else
        % QQy- moment zginaj¹cy od obci¹¿enia
        % zginaj¹cego na d³ugoœci V
        QQz=Qz*((gauss2(eq(3)*x,x,V,L,m2,k)/Qz-V));
    end

    %es- macierz przedstawiaj¹ca rozk³ad si³ na d³ugoœci prêta
    es(i,:)=([EA 0  0  0    0 0     0       0   0 0  0  0;
        0  0 -6*EIz    0    0 0     0       0   0 0  0  0;
        0  0    0      0    0 0  -6*EIy     0   0 0  0  0;
        0  0    0      0    0 0     0       0   0 0 GKv 0;
        0  0    0      0    0 0 -6*EIy*V -2*EIy 0 0  0  0;
     0  0 6*EIz*V 2*EIz  0 0     0       0   0 0  0  0;]*m+...
        [-Qx;
        -Qy;
        -Qz;
        -Qw;
        -QQz;
        QQy])'; 
    %---------------------------------------------------------
    % Q1x- wypadkowa od obci¹¿enia 
    % rozci¹gaj¹cego na d³ugoœci V
    Q1x=gauss2(eq(1),x,0,L,m2,k);
    % Q2x- wypadkowa od obci¹¿enia
    % rozci¹gaj¹cego na d³ugoœci x
    Q2x=gauss2(eq(1),x,0,x,m2,k);
    % Qxx- przemieszczenie od obci¹¿enia 
    % rozci¹gaj¹cego na d³ugoœci V
    Qxx=gauss2(Q1x-Q2x,x,0,L,m2,k)/EA-...
        gauss2(Q1x-Q2x,x,0,L-V,m2,k)/EA;
    
    if V==0
        Qyy=0;
        Qzz=0;
    else
        if eq(2)==0
            Qyy=0;
        else
            % Q1y- wypadkowa od obci¹¿enia 
            % zginaj¹cego na d³ugoœci V
            Q1y=gauss2(eq(2),x,0,L,m2,k);                                                         
            % Q2y- wypadkowa od obci¹¿enia 
            % zginaj¹cego na d³ugoœci x
            Q2y=gauss2(eq(2),x,0,x,m2,k);                                                         
            % x0y- ramie si³y Q1y
            x0y=gauss2(eq(2)*x,x,0,L,m2,k)/Q1y;                                                   
            % x02y- ramie si³y Q2y
            x02y=gauss2(eq(2)*x,x,0,x,m2,k)/Q2y;                                                  
            % Qyy- przemieszczenie od obci¹¿enia 
            %zginaj¹cego eq(2) na d³ugoœci V
            Qyy=gauss2((-Q1y*x0y-Q2y*(x-x02y)+...
                Q1y*x)*(-V+x),x,0,V,m2,k)/EIz;                      
            
        end
        if eq(3)==0
            Qzz=0;
        else
            % Q1z, Q2z, x0z x02z Qzz 
            % analogicznie od obci¹¿enia eq(3)
            Q1z=gauss2(eq(3),x,0,L,m2,k);                                                         
            Q2z=gauss2(eq(3),x,0,x,m2,k);
            x0z=gauss2(eq(3)*x,x,0,L,m2,k)/Q1z;
            x02z=gauss2(eq(3)*x,x,0,x,m2,k)/Q2z;
            Qzz=gauss2((-Q1z*x0z-Q2z*(x-x02z)+...
                Q1z*x)*(-V+x),x,0,V,m2,k)/EIy;
            
        end
    end
    % Q1w- wypadkowa od obci¹¿enia 
    % skrêcaj¹cego na d³ugoœci V
    Q1w=gauss2(eq(4),x,0,L,m2,k);                                                         
    % Q1w- wypadkowa od obci¹¿enia 
    % skrêcaj¹cego na d³ugoœci x
    Q2w=gauss2(eq(4),x,0,x,m2,k);                                                         
    % Qww- przemieszczenie od obci¹¿enia 
    % skrêcaj¹cego na d³ugoœci V
    Qww=gauss2(Q1w-Q2w,x,0,L,m2,k)/GKv-...
        gauss2(Q1w-Q2w,x,0,L-V,m2,k)/GKv;                                                  

    edi(i,:)=([V 1  0   0  0 0  0   0  0 0 0 0;
        0 0 V^3 V^2 V 1  0   0  0 0 0 0;
        0 0  0   0  0 0 V^3 V^2 V 1 0 0;
        0 0  0   0  0 0  0   0  0 0 V 1]*m + [-Qxx;
        Qyy;
        -Qzz;
        -Qww])';
end
%-------------------------------------------------------------
