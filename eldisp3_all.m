function [magnfac]=eldisp3_all(ex,ey,ez,...
    edi,ed,eo,plotpar,All_coord)
%-------------------------------------------------------------
% plik rysuj¹cy wykres przemieszczeñ
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
a=size(ex); b=size(ey); c=size(ez);

if ((a-b)==[0 0])&((b-c)==[0 0])
    nel=a(1);nen=a(2);
else
    disp('??? Check size of coordinate input arguments!')
    return
end
d=size(edi);
%-------------------------------------------------------------
ned=d(2);
%-------------------------------------------------------------
dxmax=max(max(All_coord(:,1)')-min(All_coord(:,1)'));
dymax=max(max(All_coord(:,2)')-min(All_coord(:,2)'));
dzmax=max(max(All_coord(:,3)')-min(All_coord(:,3)'));
dlmax=max([dxmax;dymax;dzmax]);
edmax=max(max(abs(ed)));
krel=0.1;

if nargin==7;
    plotpar=[2 1 1];
    magnfac=krel*dlmax/edmax;
elseif nargin==8;
    magnfac=krel*dlmax/edmax;
end
%-------------------------------------------------------------
[s1,s2]=pltstyle(plotpar);
%-------------------------------------------------------------
k=magnfac;
%-------------------------------------------------------------
eo=eo;
kk=[ex(2)-ex(1); ey(2)-ey(1); ez(2)-ez(1)];
L=sqrt(kk'*kk);
l=L/(d(1)-1);
wersor=kk/L;
cosXx=kk(1)/L;
cosYx=kk(2)/L;
cosZx=kk(3)/L;
eox=[cosXx,cosYx,cosZx];
eoy1=cross(eo,eox);
Leoy=sqrt(eoy1*eoy1');
eoywersor=eoy1/Leoy;;
%-------------------------------------------------------------
cosXy=eoywersor(1)/1;
cosYy=eoywersor(2)/1;
cosZy=eoywersor(3)/1;
eoy=[cosXy,cosYy,cosZy];
%-------------------------------------------------------------
for i=0:(d(1)-1)
    xlinia(i+1,:)=[ex(1),ey(1),ez(1)]+wersor'*i*l+...
        k*eo*edi(i+1,3)+k*eox*edi(i+1,1)+k*eoy*edi(i+1,2);
    xlinia2(i+1,:)=wersor'*i*l;
    xlinia3(i+1,:)=k*eo*edi(i+1,3)+k*eox*edi(i+1,1)+...
        k*eoy*edi(i+1,2);
    if i==0
        xpunkt(1,:)=[ex(1),ey(1),ez(1)]+wersor'*i*l+...
            k*eo*edi(i+1,3)+k*eox*edi(i+1,1)+k*eoy*edi(i+1,2);
    end
    if i==(d(1)-1)
        xpunkt(2,:)=[ex(1),ey(1),ez(1)]+wersor'*i*l+...
            k*eo*edi(i+1,3)+k*eox*edi(i+1,1)+k*eoy*edi(i+1,2);
    end
end
%-------------------------------------------------------------
axis equal
xmin = min(All_coord(:,1));
xmax = max(All_coord(:,1));
ymin = min(All_coord(:,2));
ymax = max(All_coord(:,2));
zmin = min(All_coord(:,3));
zmax = max(All_coord(:,3));
%-------------------------------------------------------------
axis([xmin-1 xmax+1 ymin-1 ymax+1 zmin-1 zmax+1]);
%-------------------------------------------------------------
hold on
view(3)
plot3(xlinia(:,1),xlinia(:,2),xlinia(:,3),s1)
plot3(xpunkt(:,1),xpunkt(:,2),xpunkt(:,3),s2)
xlabel('x'); ylabel('y'); zlabel('z');
hold on
%-------------------------------------------------------------

hold on


