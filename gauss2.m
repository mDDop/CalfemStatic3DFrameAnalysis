function [De]=gauss2(Ee,Fe,Ge,He,n,m)
%-------------------------------------------------------------
% plik obliczaj¹cy ca³kê za pomoc¹ kwadratur Gaussa
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% Ee   -   funkcja
% Fe   -   zmienna po której jest ca³kowana funkcja
% Ge   -   dolna granica ca³kowania
% He   -   górna granica ca³kwoania
% n    -   kwadratura
% m    -   liczba przedzia³ów
% p    -   wektor pierwiastkow gaussa
% w    -   wektor wag cz¹stkowych
% c,Ze -   zmiana zmiennych
% Ve   -   wektor wartosci funkcji od poszczegolnych pierwiast.
% De   -   suma wektora Ve- wartosc ca³ki
%-------------------------------------------------------------
if nargin==4
    p=[-1/sqrt(3);1/sqrt(3)];
    w=[1;1];
    c=(He-Ge)/2;
    Ze=(He+Ge)/2+(He-Ge)/2*p;
    for i=1:2
        Je(i)=subs(Ee,{Fe},{Ze(i)});
        Ve(i)=Je(i)*c;
        Ve(i)=Ve(i)*w(i);
    end
    De=sum(Ve);
end
%-------------------------------------------------------------
if nargin==5
    if n==2
        p=[-1/sqrt(3);1/sqrt(3)];
        w=[1;1];
        c=(He-Ge)/2;
        Ze=(He+Ge)/2+(He-Ge)/2*p;
        for i=1:2
            Je(i)=subs(Ee,{Fe},{Ze(i)});
            Ve(i)=Je(i)*c;
            Ve(i)=Ve(i)*w(i);
        end
        De=sum(Ve);
    elseif n==3
        p=[-sqrt(15)/5;sqrt(15)/5;0];
        w=[5/9;5/9;8/9];
        c=(He-Ge)/2;
        Ze=(He+Ge)/2+(He-Ge)/2*p;
        for i=1:3
            Je(i)=subs(Ee,{Fe},{Ze(i)});
            Ve(i)=Je(i)*c;
            Ve(i)=Ve(i)*w(i);
        end
        De=sum(Ve);
    elseif n==4
        p=[-sqrt((3-2*(sqrt(6/5)))/7); ...
            sqrt((3-2*(sqrt(6/5)))/7); ...
            -sqrt((3+2*(sqrt(6/5)))/7); ...
            sqrt((3+2*(sqrt(6/5)))/7)];
        w=[(18+sqrt(30))/36,(18+sqrt(30))/36, ...
            (18-sqrt(30))/36,(18-sqrt(30))/36];
        c=(He-Ge)/2;
        Ze=(He+Ge)/2+(He-Ge)/2*p;
        for i=1:4
            Je(i)=subs(Ee,{Fe},{Ze(i)});
            Ve(i)=Je(i)*c;
            Ve(i)=Ve(i)*w(i);
        end
        De=sum(Ve);
    elseif n==5
        p=[-sqrt(5-2*sqrt(10/7))/3; ...
            sqrt(5-2*sqrt(10/7))/3; ...
            -sqrt(5+2*sqrt(10/7))/3; ...
            sqrt(5+2*sqrt(10/7))/3;0];
        w=[(322+13*sqrt(70))/900; ...
            (322+13*sqrt(70))/900; ...
            (322-13*sqrt(70))/900; ...
            (322-13*sqrt(70))/900;128/225];
        c=(He-Ge)/2;
        Ze=(He+Ge)/2+(He-Ge)/2*p;
        for i=1:5
            Je(i)=subs(Ee,{Fe},{Ze(i)});
            Ve(i)=Je(i)*c;
            Ve(i)=Ve(i)*w(i);
        end
        De=sum(Ve);
    else
        p=[-1/sqrt(3);1/sqrt(3)];
        w=[1;1];
        c=(He-Ge)/2;
        Ze=(He+Ge)/2+(He-Ge)/2*p;
        for i=1:2
            Je(i)=subs(Ee,{Fe},{Ze(i)});
            Ve(i)=Je(i)*c;
            Ve(i)=Ve(i)*w(i);
        end
        De=sum(Ve);
    end
end
%-------------------------------------------------------------
if nargin==6
    if m==0
        m=1;
    end
    if m==1
        if n==2
            p=[-1/sqrt(3);1/sqrt(3)];
            w=[1;1];
            c=(He-Ge)/2;
            Ze=(He+Ge)/2+(He-Ge)/2*p;
            for i=1:2
                Je(i)=subs(Ee,{Fe},{Ze(i)});
                Ve(i)=Je(i)*c;
                Ve(i)=Ve(i)*w(i);
            end
            De=sum(Ve);
        elseif n==3
            p=[-sqrt(15)/5;sqrt(15)/5;0];
            w=[5/9;5/9;8/9];
            c=(He-Ge)/2;
            Ze=(He+Ge)/2+(He-Ge)/2*p;
            for i=1:3
                Je(i)=subs(Ee,{Fe},{Ze(i)});
                Ve(i)=Je(i)*c;
                Ve(i)=Ve(i)*w(i);
            end
            De=sum(Ve);
        elseif n==4
            p=[-sqrt((3-2*(sqrt(6/5)))/7); ...
                sqrt((3-2*(sqrt(6/5)))/7); ...
                -sqrt((3+2*(sqrt(6/5)))/7); ...
                sqrt((3+2*(sqrt(6/5)))/7)];
            w=[(18+sqrt(30))/36;(18+sqrt(30))/36; ...
                (18-sqrt(30))/36;(18-sqrt(30))/36];
            c=(He-Ge)/2;
            Ze=(He+Ge)/2+(He-Ge)/2*p;
            for i=1:4
                Je(i)=subs(Ee,{Fe},{Ze(i)});
                Ve(i)=Je(i)*c;
                Ve(i)=Ve(i)*w(i);
            end
            De=sum(Ve);
        elseif n==5
            p=[-sqrt(5-2*sqrt(10/7))/3; ...
                sqrt(5-2*sqrt(10/7))/3; ...
                -sqrt(5+2*sqrt(10/7))/3; ...
                sqrt(5+2*sqrt(10/7))/3;0];
            w=[(322+13*sqrt(70))/900;...
                (322+13*sqrt(70))/900; ...
                (322-13*sqrt(70))/900;...
                (322-13*sqrt(70))/900;128/225];
            c=(He-Ge)/2;
            Ze=(He+Ge)/2+(He-Ge)/2*p;
            for i=1:5
                Je(i)=subs(Ee,{Fe},{Ze(i)});
                Ve(i)=Je(i)*c;
                Ve(i)=Ve(i)*w(i);
            end
            De=sum(Ve);
        else
            p=[-1/sqrt(3);1/sqrt(3)];
            w=[1;1];
            c=(He-Ge)/2;
            Ze=(He+Ge)/2+(He-Ge)/2*p;
            for i=1:2
                Je(i)=subs(Ee,{Fe},{Ze(i)});
                Ve(i)=Je(i)*c;
                Ve(i)=Ve(i)*w(i);
            end
            De=sum(Ve);
        end
    else
        t=(He-Ge)/m;
        De=0;
        for k=0:(m-1)
            if n==2
                p=[-1/sqrt(3);1/sqrt(3)];
                w=[1;1];
                c=(t)/2;
                Ze=(Ge+k*t+t+Ge+k*t)/2+(Ge+k*t+t-Ge-k*t)/2*p;
                for i=1:2
                    Je(i)=subs(Ee,{Fe},{Ze(i)});
                    Ve(i)=Je(i)*c;
                    Ve(i)=Ve(i)*w(i);
                end
                Ke=sum(Ve);
            elseif n==3
                p=[-sqrt(15)/5;sqrt(15)/5;0];
                w=[5/9;5/9;8/9];
                c=(t)/2;
                Ze=(Ge+k*t+t+Ge+k*t)/2+(Ge+k*t+t-Ge-k*t)/2*p;
                for i=1:3
                    Je(i)=subs(Ee,{Fe},{Ze(i)});
                    Ve(i)=Je(i)*c;
                    Ve(i)=Ve(i)*w(i);
                end
                Ke=sum(Ve);
            elseif n==4
                p=[-sqrt((3-2*(sqrt(6/5)))/7); ...
                    sqrt((3-2*(sqrt(6/5)))/7); ...
                    -sqrt((3+2*(sqrt(6/5)))/7); ...
                    sqrt((3+2*(sqrt(6/5)))/7)];
                w=[(18+sqrt(30))/36;(18+sqrt(30))/36; ...
                    (18-sqrt(30))/36;(18-sqrt(30))/36];
                c=(t)/2;
                Ze=(Ge+k*t+t+Ge+k*t)/2+(Ge+k*t+t-Ge-k*t)/2*p;
                for i=1:4
                    Je(i)=subs(Ee,{Fe},{Ze(i)});
                    Ve(i)=Je(i)*c;
                    Ve(i)=Ve(i)*w(i);
                end
                Ke=sum(Ve);
            elseif n==5
                p=[-sqrt(5-2*sqrt(10/7))/3; ...
                    sqrt(5-2*sqrt(10/7))/3; ...
                    -sqrt(5+2*sqrt(10/7))/3; ...
                    sqrt(5+2*sqrt(10/7))/3;0];
                w=[(322+13*sqrt(70))/900; ...
                    (322+13*sqrt(70))/900; ...
                    (322-13*sqrt(70))/900; ...
                    (322-13*sqrt(70))/900;128/225];
                c=(t)/2;
                Ze=(Ge+k*t+t+Ge+k*t)/2+(Ge+k*t+t-Ge-k*t)/2*p;
                for i=1:5
                    Je(i)=subs(Ee,{Fe},{Ze(i)});
                    Ve(i)=Je(i)*c;
                    Ve(i)=Ve(i)*w(i);
                end
                Ke=sum(Ve);
            else
                p=[-1/sqrt(3);1/sqrt(3)];
                w=[1;1];
                c=(t)/2;
                Ze=(Ge+k*t+t+Ge+k*t)/2+(Ge+k*t+t-Ge-k*t)/2*p;
                for i=1:2
                    Je(i)=subs(Ee,{Fe},{Ze(i)});
                    Ve(i)=Je(i)*c;
                    Ve(i)=Ve(i)*w(i);
                end
                Ke=sum(Ve);
            end
            De=De+Ke;
        end
    end
end
%-------------------------------------------------------------