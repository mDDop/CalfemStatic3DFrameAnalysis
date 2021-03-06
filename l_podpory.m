%-------------------------------------------------------------
% plik menu PODPORY
%-------------------------------------------------------------
% Hubert Gawry�   2013-01-07
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_bc      - liczba wprowadzonych podp�r
% All_bc     - tablica zawieraj�ca zbi�r podp�r
%-------------------------------------------------------------
clear_fig(1,lmenu);
wysokoscrzedu11111=330;
wysokoscrzedu22222=490;
Pos2=get(fig,'Position');
%-------------------------------------------------------------
if nr_bc>0
    for k=1:nr_bc
        uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
            'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
            'String',['W�ze�(' num2str(All_bc(k,7)) ') = '],'Position',[80 wysokoscrzedu11111-k*20 120 15]);
        uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
            'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
            'String',num2str(All_bc(k,1:6)),'Position',[250 wysokoscrzedu11111-k*20 120 15]);
        mm(k)=uicontrol(gcf,'style','checkbox','Position',[420 wysokoscrzedu11111-k*20 15 15],...
            'BackGroundColor','y','HorizontalAlignment','center');
    end
    %---------------------------------------------------------
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
        'String',['u1 u2 u3 u4 u5 u6'],'Position',[250 wysokoscrzedu11111 120 15]);
    %---------------------------------------------------------
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor',kol2(5,:),'HorizontalAlignment','left',...
        'String',['b - zablokowany'],'Position',[420 wysokoscrzedu11111+100 100 15]);
    %---------------------------------------------------------
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor',kol2(5,:),'HorizontalAlignment','left',...
        'String',['w - wolny'],'Position',[420 wysokoscrzedu11111+120 100 15]);
end
%-------------------------------------------------------------
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['Rodzaj '],'Position',[80 wysokoscrzedu22222 50 15]);
wiez=uicontrol(gcf,'style','popupmenu','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','Utwierdzenie|Przegubowa','Position',[140 wysokoscrzedu22222 120 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['W�ze�'],'Position',[270 wysokoscrzedu22222 45 15]);
podpora1=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[325 wysokoscrzedu22222 30 15]);
%-------------------------------------------------------------
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['W�ze�'],'Position',[630 wysokoscrzedu22222 45 15]);
podpora2=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[685 wysokoscrzedu22222 30 15]);
wiezek(1)=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[410+35 wysokoscrzedu22222-20 20 15]);
wiezek(2)=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[430+35 wysokoscrzedu22222-20 20 15]);
wiezek(3)=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[450+35 wysokoscrzedu22222-20 20 15]);
wiezek(4)=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[470+35 wysokoscrzedu22222-20 20 15]);
wiezek(5)=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[490+35 wysokoscrzedu22222-20 20 15]);
wiezek(6)=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[510+35 wysokoscrzedu22222-20 20 15]);
%-------------------------------------------------------------
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['u1'],'Position',[410+35 wysokoscrzedu22222 20 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['u2'],'Position',[430+35 wysokoscrzedu22222 20 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['u3'],'Position',[450+35 wysokoscrzedu22222 20 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['u4'],'Position',[470+35 wysokoscrzedu22222 20 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['u5'],'Position',[490+35 wysokoscrzedu22222 20 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['u6'],'Position',[510+35 wysokoscrzedu22222 20 15]);
%-------------------------------------------------------------
d1 = uicontrol(gcf,'style','pushbutton','BackGroundColor',kol2(2,:),'ForeGroundColor','w','FontWeight','bold','FontSize',8,...
    'String','Dodaj Podpor�','Position',[80 440 130 25],...
    'Callback', 'nr_bc=nr_bc+1; nr_alert=6; All_alert; wiezpodpory; wczytaj_podpory; l_podpory');
if nr_bc>0
    d2 = uicontrol(gcf,'style','pushbutton','BackGroundColor',kol2(2,:),'ForeGroundColor','w','FontWeight','bold','FontSize',8,...
        'String','Usu� Podpor�','Position',[220 350 130 25],...
        'Callback', 'update_bc; l_podpory');
end
d3 = uicontrol(gcf,'style','pushbutton','BackGroundColor',kol2(2,:),'ForeGroundColor','w','FontWeight','bold','FontSize',8,...
    'String','Dodaj Podpor�','Position',[715-130 440 130 25],...
    'Callback', 'nr_bc=nr_bc+1; nr_alert=7; All_alert; wiezpodporydrugi; wczytaj_podporydrugi; l_podpory');
%-------------------------------------------------------------
hp=uipanel('Title','Nowa podpora standardowa','FontSize',8,'BackgroundColor',kol2(3,:),'ForeGroundColor','w','Position',[ 0.05 0.7 0.45 0.2]);
hp=uipanel('Title','Nowa podpora dowolna','FontSize',8,'BackgroundColor',kol2(3,:),'ForeGroundColor','w','Position',[ 0.5 0.7 0.45 0.2]);
if nr_bc>0
    hp=uipanel('Title','Dodane Podpory','FontSize',8,'BackgroundColor',kol2(3,:),'ForeGroundColor','w','Position',[ 0.05 0.47-nr_bc*20/wymiary 0.55 0.2+nr_bc*20/wymiary]);
end
%-------------------------------------------------------------