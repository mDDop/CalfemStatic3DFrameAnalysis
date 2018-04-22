%-------------------------------------------------------------
% plik czyszcz¹cy pole programu
%-------------------------------------------------------------
% Hubert Gawryœ   2013-01-07
% Instytut Technologii Informatycznych w In¿ynierii L¹dowej(L-5)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
%-------------------------------------------------------------
function clear_fig(fig,lmenu)
if lmenu>0
    t=get(fig,'Children');
    delete(t(end-lmenu:-1:1));
end
Pos = get(fig,'Position');
color2=get(fig,'Color');
uicontrol(fig,'Style','text','Units','normalized', ...
    'Position',[9/20 1/40 1/2 1/40],'String', ...
    ' Calfem Static Analysis v.1.0   Hubert Gawryœ  07-01-2013',...
    'FontSize',10,'FontWeight','bold', ...
    'ForeGroundColor','w','BackGroundColor',color2, ...
    'HorizontalAlignment','center');
set(fig,'Toolbar','figure');
end
%-------------------------------------------------------------
