function [Ke,fe]=beam3e_all(ex,ey,ez,eo,ep,eq)
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
b=[ ex(2)-ex(1); ey(2)-ey(1); ez(2)-ez(1) ];                            
L=sqrt(b'*b);  n1=b/L;                                                 
lc=sqrt(eo*eo'); n3=eo/lc;
%-------------------------------------------------------------
if nargin==5;   D=zeros(1,12);
elseif nargin==6
    
    syms x
    % F1- wektor funkcji obci¹¿enia przemno¿onych przez 
    %odpowiednie funkcje kszta³tu Hermite'a i Lagrange'a
    F1=sym(zeros(1,12));
    
    F1(1,1)=eq(1,1)*(1-(x/L));
    F1(1,4)=eq(1,4)*(1-(x/L));
    
    for w=2:3
        F1(1,w)=eq(1,w)*(1-3*(x/L)^2+2*(x/L)^3);
    end
    
    F1(1,6)=eq(1,2)*L*((x/L)-2*(x/L)^2+(x/L)^3);
    F1(1,5)=-eq(1,3)*L*((x/L)-2*(x/L)^2+(x/L)^3);
    
    for w=8:9
        F1(1,w)=eq(1,w-6)*(3*(x/L)^2-2*(x/L)^3);
    end
    
    F1(1,7)=eq(1,1)*(x/L);
    F1(1,10)=eq(1,4)*(x/L);
    F1(1,12)=eq(1,2)*L*((x/L)^3-(x/L)^2);
    F1(1,11)=-eq(1,3)*L*((x/L)^3-(x/L)^2);
    
    D=zeros(1,12);
    % D- wektor si³ wêz³owych dla prêta
    for w=1:12
        D(1,w)=gauss2(F1(1,w),x,0,L);
    end
    
end
%-------------------------------------------------------------
E=ep(1); Gs=ep(2);
A=ep(3);
Iy=ep(4); Iz=ep(5);
Kv=ep(6);

a=E*A/L       ; b=12*E*Iz/L^3 ; c=6*E*Iz/L^2;
d=12*E*Iy/L^3 ; e=6*E*Iy/L^2  ; f=Gs*Kv/L;
g=2*E*Iy/L    ; h=2*E*Iz/L    ;

Kle=[ a  0  0  0  0  0 -a  0  0  0  0  0 ;
    0  b  0  0  0  c  0 -b  0  0  0  c ;
    0  0  d  0 -e  0  0  0 -d  0 -e  0 ;
    0  0  0  f  0  0  0  0  0 -f  0  0 ;
    0  0 -e  0 2*g 0  0  0  e  0  g  0 ;
    0  c  0  0  0 2*h 0 -c  0  0  0  h ;
    -a  0  0  0  0  0  a  0  0  0  0  0 ;
    0 -b  0  0  0 -c  0  b  0  0  0 -c ;
    0  0 -d  0  e  0  0  0  d  0  e  0 ;
    0  0  0 -f  0  0  0  0  0  f  0  0 ;
    0  0 -e  0  g  0  0  0  e  0 2*g 0 ;
    0  c  0  0  0  h  0 -c  0  0  0 2*h];
%-------------------------------------------------------------
% fle=D'- wektor si³ wêz³owych dla prêta
fle=[D(1,1) ...
    D(1,2) ...
    D(1,3) ...
    D(1,4) ...
    D(1,5) ...
    D(1,6) ...
    D(1,7) ...
    D(1,8) ...
    D(1,9) ...
    D(1,10) ...
    D(1,11) ...
    D(1,12)]';
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
Ke1=G'*Kle*G;  fe1=G'*fle;
%-------------------------------------------------------------
if nargout==0
    disp('Element stiffness matrix: ');
    disp(Ke1);
    
    if nargin==6
        disp('Element load vector: ');
        disp(fe1);
    end
    return
end
Ke=Ke1;

if nargin==6  fe=fe1;  end
%-------------------------------------------------------------

