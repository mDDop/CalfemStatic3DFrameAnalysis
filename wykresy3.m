%-------------------------------------------------------------
% plik rysuj¹cy wykres si³ przekrojowych wybranego prêta
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
function [sfac]=wykresy3(Ex,Ey,Ez,es,eci,scal,...
    text_value,grid_v,nr_dof,All_coord)
axis on
axis equal
if (get(grid_v,'Value')==get(grid_v,'Max'))
    grid on
else
    grid off
end
b=[Ex(2)-Ex(1);Ey(2)-Ey(1);Ez(2)-Ez(1)];
Length=sqrt(b'*b);
e=b/Length;
es=es*scal;
if b(1)==0
    f=[0,-e(3),e(2)];
elseif b(2)==0
    f=[-e(3),0,e(1)];
elseif b(3)==0
    f=[-e(2),e(1),0];
else
    f=[-e(2),e(1),0];
end
g=length(eci);
if b(1)==0
    if b(2)==0
        for i=1:g
            if i==1
                x(i)=Ex(i);
                y(i)=Ey(i);
                z(i)=Ez(i);
                x(i+1+g)=Ex(i+1);
                y(i+1+g)=Ey(i+1);
                z(i+1+g)=Ez(i+1);
            end
            x(i+1)=Ex(1)+eci(i)*e(1)+es(i)*f(1);
            y(i+1)=Ey(1)+eci(i)*e(2)+es(i)*f(2);
            z(i+1)=Ez(1)+eci(i)*e(3);
        end
    else
        for i=1:g
            if i==1
                x(i)=Ex(i);
                y(i)=Ey(i);
                z(i)=Ez(i);
                x(i+1+g)=Ex(i+1);
                y(i+1+g)=Ey(i+1);
                z(i+1+g)=Ez(i+1);
            end
            x(i+1)=Ex(1)+eci(i)*e(1)+es(i)*f(1);
            z(i+1)=Ez(1)+eci(i)*e(3)+es(i)*f(3);
            y(i+1)=Ey(1)+eci(i)*e(2);
        end
    end
elseif b(2)==0
    for i=1:g
        if i==1
            x(i)=Ex(i);
            y(i)=Ey(i);
            z(i)=Ez(i);
            x(i+1+g)=Ex(i+1);
            y(i+1+g)=Ey(i+1);
            z(i+1+g)=Ez(i+1);
        end
        x(i+1)=Ex(1)+eci(i)*e(1)+es(i)*f(1);
        z(i+1)=Ez(1)+eci(i)*e(3)+es(i)*f(3);
        y(i+1)=Ey(1)+eci(i)*e(2);
    end
else
    for i=1:g
        if i==1
            x(i)=Ex(i);
            y(i)=Ey(i);
            z(i)=Ez(i);
            x(i+1+g)=Ex(i+1);
            y(i+1+g)=Ey(i+1);
            z(i+1+g)=Ez(i+1);
        end
        y(i+1)=Ey(1)+eci(i)*e(2)+es(i)*f(2);
        z(i+1)=Ez(1)+eci(i)*e(3)+es(i)*f(3);
        x(i+1)=Ex(1)+eci(i)*e(1);
    end
end

x;
y;
z;
C(length(es)+2)=0;
C(1)=0;
for i=1:length(es)
    C(i+1)=es(i)/scal;
end
C;
if b(1)==0
    if b(2)==0
        fill3(x,y,z,C)
        value1=(es(1)/scal);
        value2=(es(length(es))/scal);
        if (get(text_value,'Value')==get(text_value,'Max'))
            text(x(2),y(2),z(2),num2str(value1,'%5.2f'));
            text(x(length(es)+1),y(length(es)+1),...
                z(length(es)+1),num2str(value2,'%5.2f'));
        end
    else
        fill3(x,y,z,C)
        value1=(es(1)/scal);
        value2=(es(length(es))/scal);
        if (get(text_value,'Value')==get(text_value,'Max'))
            text(x(2),y(2),z(2),num2str(value1,'%5.2f'));
            text(x(length(es)+1),y(length(es)+1),...
                z(length(es)+1),num2str(value2,'%5.2f'));
        end
    end
elseif b(2)==0
    fill3(x,y,z,C)
    value1=(es(1)/scal);
    value2=(es(length(es))/scal);
    if (get(text_value,'Value')==get(text_value,'Max'))
        text(x(2),y(2),z(2),num2str(value1,'%5.2f'));
        text(x(length(es)+1),y(length(es)+1),...
            z(length(es)+1),num2str(value2,'%5.2f'));
    end
else
    fill3(x,y,z,C)
    value1=(es(1)/scal);
    value2=(es(length(es))/scal);
    if (get(text_value,'Value')==get(text_value,'Max'))
        text(x(2),y(2),z(2),num2str(value1,'%5.2f'));
        text(x(length(es)+1),y(length(es)+1),...
            z(length(es)+1),num2str(value2,'%5.2f'));
    end
end
colorbar
a=size(Ex); b=size(Ey); c=size(Ez);
if ((a-b)==[0 0])&((b-c)==[0 0])
    nel=a(1);nen=a(2);
    plotpar=[1,4,1];
    [s1,s2]=pltstyle(plotpar);
    x0=sum(Ex')/nen; y0=sum(Ey')/nen; z0=sum(Ez')/nen;
    if nen==2
        x=Ex'; y=Ey'; z=Ez';
        xc=x; yc=y; zc=z;
    end
    axis('equal')
    hold on
    view(3)
    plot3(xc,yc,zc,s1,'linewidth',1)
    plot3(x,y,z,s2)
    if nargin==5
        for i=1:nel
            text(x0(i),y0(i),z0(i),int2str(elnum(i)))
        end
    end
    xlabel('x'); ylabel('y'); zlabel('z');
    hold on
end
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