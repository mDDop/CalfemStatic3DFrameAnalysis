%-------------------------------------------------------------
% plik rysuj�cy jednostk� si� pr�towych
%-------------------------------------------------------------
% Hubert Gawry�   2012-10-25
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
if (get(force_type2,'Value')==1) || (get(force_type2,'Value')==2)...
        || (get(force_type2,'Value')==3) || (get(force_type2,'Value')==4)
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor','w','HorizontalAlignment','center',...
        'String',['N/m'],'Position',[400 wysokoscrzedu2222222 28 15]);
else
    uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
        'BackGroundColor','w','HorizontalAlignment','center',...
        'String',['Nm/m'],'Position',[400 wysokoscrzedu2222222 28 15]);
end
%-------------------------------------------------------------