%-------------------------------------------------------------
% plik menu PRZEMIESZCZENIA(el)
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% ed  - plik zawieraj¹cy przemieszczenia elementu
%-------------------------------------------------------------
clear_fig(1,lmenu);
%-------------------------------------------------------------
h_v1=520;
h_v2=350;
w_c1=100;
w_c2=50;
w_ods=10;
w_s=70;
Pos2=get(fig,'Position');
%-------------------------------------------------------------
[N_beam,M_beam]=size(eci);
e1=uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
    'String','Prêt nr:','Position',[w_c1-40 h_v1 w_c1 15]);
edi_popup=uicontrol(gcf,'style','popupmenu','FontSize',8,'FontWeight','bold',...
    'BackGroundColor','w','HorizontalAlignment','center',...
    'String',All_edofs(:,1),'Position',[w_c1+w_ods+w_c1-40 h_v1 40 15],...
    'Callback','rys_przemieszczenia2');
%-------------------------------------------------------------
hp=uipanel('Title','Wybór prêta','FontSize',8,...
    'BackgroundColor',kol2(3,:),'ForeGroundColor','w','Units','Pixels',...
    'Position',[50 480 200 80]);
%-------------------------------------------------------------
rys_przemieszczenia2;