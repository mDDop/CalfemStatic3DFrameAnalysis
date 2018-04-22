%-------------------------------------------------------------
% plik rysuj¹cy jednostkê si³ skupionych
%-------------------------------------------------------------
% Hubert Gawryœ   2012-10-25
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
if (get(force_type1,'Value')==1) || (get(force_type1,'Value')==2)...
        || (get(force_type1,'Value')==3) || (get(force_type1,'Value')==4)
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor','w','HorizontalAlignment','center',...
        'String',['N'],'Position',[300 wysokoscrzedu222222 28 15]);
else
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor','w','HorizontalAlignment','center',...
        'String',['Nm'],'Position',[300 wysokoscrzedu222222 28 15]);
end
%-------------------------------------------------------------