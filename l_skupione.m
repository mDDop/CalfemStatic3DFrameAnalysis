%-------------------------------------------------------------
% plik menu OBCI��ENIA SKUPIONE
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_sforce  - liczba wprowadzonych si� w�z�owych
% All_sforce - tablica zawieraj�ca dane o si�ach w�z�owych
%-------------------------------------------------------------
clear_fig(1,lmenu);
wysokoscrzedu111111=330;
wysokoscrzedu222222=490;
Pos2=get(fig,'Position');
%-------------------------------------------------------------
if nr_sforce>0
    for k=1:nr_sforce
        uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
            'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
            'String',['W�ze�(' num2str(All_sforce(k,7)) ') = '],...
            'Position',[80 wysokoscrzedu111111-k*20 120 15]);
        uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
            'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
            'String',num2str(All_sforce(k,1:6)),...
            'Position',[250 wysokoscrzedu111111-k*20 120 15]);
        oo(k)=uicontrol(gcf,'style','checkbox',...
            'Position',[420 wysokoscrzedu111111-k*20 15 15],...
            'BackGroundColor','y','HorizontalAlignment','center');
    end
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
        'String',['N Vy Vz T My Mz'],...
        'Position',[250 wysokoscrzedu111111 120 15]);
end
%-------------------------------------------------------------
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['Rodzaj '],'Position',[80 wysokoscrzedu222222 50 15]);
force_type1=uicontrol(gcf,'style','popupmenu','FontSize',8,'FontWeight','bold',...
    'BackGroundColor','w','HorizontalAlignment','center',...
    'String','N|Vy|Vz|T|My|Mz','Callback','rys_jednostka',...
    'Position',[140 wysokoscrzedu222222 40 15]);
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['Warto��'],'Position',[190 wysokoscrzedu222222 50 15]);
s_force1=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[250 wysokoscrzedu222222 50 15]);
rys_jednostka;
uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String',['W�ze�'],'Position',[340 wysokoscrzedu222222 45 15]);
s_force2=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(6,:),'HorizontalAlignment','center',...
    'String','','Position',[395 wysokoscrzedu222222 30 15]);
%-------------------------------------------------------------
d1 = uicontrol(gcf,'style','pushbutton','BackGroundColor',kol2(2,:),...
    'ForeGroundColor','w','FontWeight','bold','FontSize',8,...
    'String','Dodaj obci��enie','Position',[80 440 130 25],...
    'Callback', 'nr_sforce=nr_sforce+1; nr_alert=14; All_alert; load_sforce; l_skupione');
if nr_sforce>0
    d2 = uicontrol(gcf,'style','pushbutton','BackGroundColor',kol2(2,:),...
        'ForeGroundColor','w','FontWeight','bold','FontSize',8,...
        'String','Usu� obci��enie','Position',[245 350 130 25],...
        'Callback', 'update_sforce; l_skupione');
end
%-------------------------------------------------------------
hp=uipanel('Title','Nowe obci��enie','FontSize',8,...
    'BackgroundColor',kol2(3,:),'ForeGroundColor','w',...
    'Position',[ 0.05 0.7 0.5 0.2]);
if nr_sforce>0
    hp=uipanel('Title','Dodane obci��enia','FontSize',8,...
        'BackgroundColor',kol2(3,:),'ForeGroundColor','w',...
        'Position',[ 0.05 0.47-nr_sforce*20/wymiary 0.55 0.2+nr_sforce*20/wymiary]);
end
%-------------------------------------------------------------