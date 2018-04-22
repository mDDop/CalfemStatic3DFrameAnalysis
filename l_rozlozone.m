%-------------------------------------------------------------
% plik menu OBCI¥¯ENIA ROZ£O¯ONE
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% nr_lforce  - liczba wprowadzonych si³ prêtowych
% All_lforce - tablica zawieraj¹ca dane si³ach prêtowych
%-------------------------------------------------------------
clear_fig(1,lmenu);
wysokoscrzedu1111111=330;
wysokoscrzedu2222222=490;
Pos2=get(fig,'Position');
%-------------------------------------------------------------
lic3=0;
if nr_lforce>0
    [N_lforce,M_lforce]=size(All_lforce);
    for k=1:N_lforce
        if M_lforce>1
            if All_lforce(k,5)~='0'
                lic3=lic3+1;
                lic_lforce=k;
                lic_lforce1(lic3)=lic_lforce;
            end
        end
    end
    
    for k=1:nr_lforce
        uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
            'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
            'String',['Element(' char(All_lforce(lic_lforce1(k),5)) ') = '],'Position',[80 wysokoscrzedu1111111-k*20 120 15]);
        uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
            'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
            'String',char(All_lforce(lic_lforce1(k),1:4)),'Position',[250 wysokoscrzedu1111111-k*20 220 15]);
        mm(k)=uicontrol(gcf,'style','checkbox','Position',[520 wysokoscrzedu1111111-k*20 15 15],...
            'BackGroundColor','y','HorizontalAlignment','center');
    end
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
        'String',['N Vy Vz T'],'Position',[250 wysokoscrzedu1111111 220 15]);
end
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['Rodzaj '],'Position',[80 wysokoscrzedu2222222 50 15]);
force_type2=uicontrol(gcf,'style','popupmenu','FontSize',8,'FontWeight','bold',...
    'BackGroundColor','w','HorizontalAlignment','center',...
    'String','N|Vy|Vz|T','Callback','rys_jednostka2','Position',[140 wysokoscrzedu2222222 40 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['Wartoœæ'],'Position',[190 wysokoscrzedu2222222 50 15]);
l_force1=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[250 wysokoscrzedu2222222 150 15]);
rys_jednostka2;
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['Element'],'Position',[440 wysokoscrzedu2222222 45 15]);
l_force2=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[495 wysokoscrzedu2222222 30 15]);
%-------------------------------------------------------------
d1 = uicontrol(gcf,'style','pushbutton','BackGroundColor',kol2(2,:),'ForeGroundColor','w','FontWeight','bold','FontSize',8,...
    'String','Dodaj obci¹¿enie','Position',[80 440 130 25],...
    'Callback', 'nr_lforce=nr_lforce+1; nr_alert=16; All_alert; load_lforce; l_rozlozone');
if nr_lforce>0
    d2 = uicontrol(gcf,'style','pushbutton','BackGroundColor',kol2(2,:),'ForeGroundColor','w','FontWeight','bold','FontSize',8,...
        'String','Usuñ obci¹¿enie','Position',[250 350 130 25],...
        'Callback', 'update_lforce; l_rozlozone');
end
%-------------------------------------------------------------
hp=uipanel('Title','Nowe obci¹¿enie','FontSize',8,'BackgroundColor',kol2(3,:),'ForeGroundColor','w','Position',[ 0.05 0.7 0.65 0.2]);
if nr_lforce>0
    hp=uipanel('Title','Dodane obci¹¿enia','FontSize',8,'BackgroundColor',kol2(3,:),'ForeGroundColor','w','Position',[ 0.05 0.47-nr_lforce*20/wymiary 0.65 0.2+nr_lforce*20/wymiary]);
end
%-------------------------------------------------------------
