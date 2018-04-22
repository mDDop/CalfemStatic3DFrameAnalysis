%-------------------------------------------------------------
% plik wykonuj¹cy obliczenia na podstawie wprowadzonych danych
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_element - liczba wprowadzonych elementów
% All_edofs  - tablica wêz³ów elementów
% Ex, Ey, Ez - odpowiednie wspó³rzêdne pocz¹tku i koñca elementu
% Edof       - macierz topologii elementów
% nr_bc      - liczba podpór wprowadzonych do konstrukcji
% All_bc     - tablica zawieraj¹ca dane podpór wêz³owych
% nr_material- liczba elementów z przypisanym materia³em
% All_EvG    - tablica zawieraj¹ca dane materia³owe elementów
% nr_cross   - liczba elementów z wprowadzonym przekrojem
% All_iiak   - tablica zawieraj¹ca przekrój danego elementu
% All_eo     - tablica zawieraj¹ca usytuowanie przekroju w
%              przestrzeni
% ed         - plik zawieraj¹cy przemieszczenia elementu
% R          - wektor reakcji podporowych
%-------------------------------------------------------------
clearvars edi eci es
pyt_gauss_podzial;
out=0;
Scr = get(0,'Screensize');
out = dialog('WindowStyle', 'normal', 'Name',...
    'Czekaj, trwa obliczanie...',...
    'Position',[Scr(3)/2-100 Scr(4)/2-50 200 100]);
uicontrol('Style','text','Position',[0 40 200 20],...
    'String','','FontSize',8,'FontWeight','bold',...
    'BackGroundColor','w','HorizontalAlignment','center');
uicontrol('Style','text','Position',[0 65 200 20],...
    'String','Trwa wykonywanie obliczeñ...',...
    'FontSize',8,'FontWeight','bold',...
    'BackGroundColor','w','HorizontalAlignment','center');
pause(0.001);
gauss_podzial=char(gauss_podzial);
gauss_podzial=str2num(gauss_podzial);
g_p=gauss_podzial;
%-------------------------------------------------------------
F_Dof=All_dof(:,1:6);
%-------------------------------------------------------------
p=nr_dof;
%-------------------------------------------------------------
F_Edof=Edof;
F_Edofs=All_edofs;
%-------------------------------------------------------------
i=nr_element;
%-------------------------------------------------------------
%automatyczne wygenerowanie globalnych macierzy sztywnosci
%i wektorów obci¹¿eñ
K=zeros(6*p);
F=zeros((6*p),1);
%-------------------------------------------------------------
%d³ugosci elementow
for j=1:i
    k=[ Ex(j,2)-Ex(j,1); Ey(j,2)-Ey(j,1); Ez(j,2)-Ez(j,1) ];
    L(j)=sqrt(k'*k);
end
%-------------------------------------------------------------
%automatyczne wygenerowanie elementowych macierzy 
%sztywnosci i wektorów obci¹¿enia
for j=1:i
    Ke=zeros(12,12,j);
    fe=zeros(12,j);
end
%-------------------------------------------------------------
%definicja sta³ych materia³owych i charakterystyk
%geometrycznych przekroju
E=All_EvG(:,1);
G=All_EvG(:,3);
%-------------------------------------------------------------
Iz=All_iiak(:,1);
Iy=All_iiak(:,2);
A=All_iiak(:,3);
Kv=All_iiak(:,4);
%-------------------------------------------------------------
%wektor sta³ych materia³owych i charakterystyk
%geometrycznych przekroju
ep=[E G A Iy Iz Kv];
%-------------------------------------------------------------
%macierz nachylenia osi lokalnej 'z'
%wzgledem globalnych osi 'x','y','z'
eo=All_eo(:,1:3);
%-------------------------------------------------------------
%zmienne liczenia kwadratur gaussa
syms eq x
eq=sym(zeros(i,4));
%-------------------------------------------------------------
message_calfem(0.025);
%-------------------------------------------------------------
%definicja obci¹¿eñ roz³o¿onych na elemencie
[n,m]=size(All_lforce);
for b=1:n
    if m>1
        if All_lforce(b,5)~='0'
            g=char(All_lforce(b,5));
            g=str2num(g);
            eq(g,:)=eq(g,:)+All_lforce(b,1:4);
        end
    end
end
%-------------------------------------------------------------
for b=1:nr_sforce
    F(All_sforce(b,7)*6-5)=F(All_sforce(b,7)*6-5)+All_sforce(b,1);
    F(All_sforce(b,7)*6-4)=F(All_sforce(b,7)*6-4)+All_sforce(b,2);
    F(All_sforce(b,7)*6-3)=F(All_sforce(b,7)*6-3)+All_sforce(b,3);
    F(All_sforce(b,7)*6-2)=F(All_sforce(b,7)*6-2)+All_sforce(b,4);
    F(All_sforce(b,7)*6-1)=F(All_sforce(b,7)*6-1)+All_sforce(b,5);
    F(All_sforce(b,7)*6-0)=F(All_sforce(b,7)*6-0)+All_sforce(b,6);
end
%-------------------------------------------------------------
lic_bc=0;
for b=1:nr_bc
    if All_bc(b,1)==0
        lic_bc=lic_bc+1;
    end
    if All_bc(b,2)==0
        lic_bc=lic_bc+1;
    end
    if All_bc(b,3)==0
        lic_bc=lic_bc+1;
    end
    if All_bc(b,4)==0
        lic_bc=lic_bc+1;
    end
    if All_bc(b,5)==0
        lic_bc=lic_bc+1;
    end
    if All_bc(b,6)==0
        lic_bc=lic_bc+1;
    end
end
%-------------------------------------------------------------
bc=zeros(lic_bc,2);
lic_bc=0;
for b=1:nr_bc
    if All_bc(b,1)~=Inf
        lic_bc=lic_bc+1;
        bc(lic_bc,1)=All_bc(b,7)*6-5;
        bc(lic_bc,2)=All_bc(b,1);
    end
    if All_bc(b,2)~=Inf
        lic_bc=lic_bc+1;
        bc(lic_bc,1)=All_bc(b,7)*6-4;
        bc(lic_bc,2)=All_bc(b,2);
    end
    if All_bc(b,3)~=Inf
        lic_bc=lic_bc+1;
        bc(lic_bc,1)=All_bc(b,7)*6-3;
        bc(lic_bc,2)=All_bc(b,3);
    end
    if All_bc(b,4)~=Inf
        lic_bc=lic_bc+1;
        bc(lic_bc,1)=All_bc(b,7)*6-2;
        bc(lic_bc,2)=All_bc(b,4);
    end
    if All_bc(b,5)~=Inf
        lic_bc=lic_bc+1;
        bc(lic_bc,1)=All_bc(b,7)*6-1;
        bc(lic_bc,2)=All_bc(b,5);
    end
    if All_bc(b,6)~=Inf
        lic_bc=lic_bc+1;
        bc(lic_bc,1)=All_bc(b,7)*6-0;
        bc(lic_bc,2)=All_bc(b,6);
    end
end
message_calfem(0.05)
%-------------------------------------------------------------
%generacja elementowych macierzy 
%sztywnoœci i elementowych wektorów obci¹¿eñ
for j=1:i
    [Ke(:,:,j),fe(:,j)]=beam3e_all(Ex(j,:)...
        ,Ey(j,:),Ez(j,:),eo(j,:),ep(j,:),eq(j,:));
end
%-------------------------------------------------------------
message_calfem(0.075)
%agregacja macierzy globalnej macierzy 
%sztywnoœci i globalnego wektora obci¹¿eñ
for j=1:i
    [K,F]=assem(F_Edof(j,:),K,Ke(:,:,j),F,fe(:,j));
end
%-------------------------------------------------------------
%rozwi¹zanie wektorów ??? oraz wektora reakcji podporowych
[Q,R]=solveq(K,F,bc);
R;
%-------------------------------------------------------------
%macierz przemieszczeñ elementowych
ed=extract(Edof,Q);
message_calfem(0.1);
%-------------------------------------------------------------
%rozwi¹zanie wektora si³ przekrojowych,
%wektora przemieszczeñ, wektora d³ugoœci na elemencie
for j=1:i
    [esw(:,:,j),ediw(:,:,j),eciw(:,j)]=beam3s_all(Ex(j,:),...
        Ey(j,:),Ez(j,:),eo(j,:),ep(j,:),ed(j,:),...
        eq(j,:),15,g_p(1),g_p(2));
    message_calfem(j/i/2);
end
ediw;
for j=1:i
    [es(:,:,j),edi(:,:,j),eci(:,j)]=beam3s_all(Ex(j,:),...
        Ey(j,:),Ez(j,:),eo(j,:),ep(j,:),ed(j,:),...
        eq(j,:),g_p(3),g_p(1),g_p(2));
    message_calfem(0.5+j/i/2);
end
close(out)
%-------------------------------------------------------------