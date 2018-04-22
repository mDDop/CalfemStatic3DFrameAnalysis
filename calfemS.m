%-------------------------------------------------------------
% plik podstawowy programu calfemS
%-------------------------------------------------------------
% Hubert Gawry�   2013-01-07
% Instytut Technologii Informatycznych w In�ynierii L�dowej(L-5)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_dof     - liczba wprowadzonych w�z��w
% All_coord  - tablica wsp�rz�dnych w�z�ow�w
% All_dof    - tablica stopni swobody w�z��w
%-------------------------------------------------------------
clear all
clc
close all
%-------------------------------------------------------------
Scr = get(0,'Screensize');
%-------------------------------------------------------------
lmenu=6;
lopcja=[2 2 2 2 1 9];
kol=['b','r','k','m','y','g','r','k'];
kol2=[0.3,0.4,0.5;
    0.5,0.6,0.4;
    0.35,0.45,0.55;
    0.4,0.5,0.6;
    0.9,0.9,0.9;
    1,1,1];
%-------------------------------------------------------------
wymiarx=800;
wymiary=600;
fig=figure('Position',[(Scr(3)-wymiarx)/2 (Scr(4)-wymiary)/2 wymiarx wymiary], ...
    'Name','CALFEM STATIC','Resize','off');
%-------------------------------------------------------------
Scr = get(fig,'Position');
set(fig,'Name','Calfem Static Analysis v.1.0', ...
    'NumberTitle','off','Color',kol2(1,:));
%-------------------------------------------------------------
clear_fig(fig,0)
s=zeros(lmenu,max(lopcja+1));
for i=1:lmenu
    s(i,1)=uimenu(fig,'Label',opcje_menu(i,1),...
        'Position',i,'ForegroundColor',kol2(2,:));
    for j=0:lopcja(i)
        if j>0
            s(i,j+1) = uimenu(s(i,1),'Label',opcje_menu(i,j+1), ...
                'Position',j,'ForegroundColor',kol2(1,:));
        end
    end
end
%-------------------------------------------------------------
set([s(6,4) s(6,5) s(6,6) s(6,8) s(6,9)],'Separator','on');
set([s(1,2)],'CallBack','clear_fig(fig,lmenu); l_wezly;');
set([s(1,3)],'CallBack','clear_fig(fig,lmenu); l_elementy;');
set([s(2,2)],'CallBack','clear_fig(fig,lmenu); l_material;');
set([s(2,3)],'CallBack','clear_fig(fig,lmenu); l_przekroj;');
set([s(3,2)],'CallBack','clear_fig(fig,lmenu); l_podpory;');
set([s(4,2)],'CallBack','clear_fig(fig,lmenu); l_skupione;');
set([s(4,3)],'CallBack','clear_fig(fig,lmenu); l_rozlozone;');
set([s(5,2)],'CallBack','wykonaj_obliczenia');
set([s(6,2)],'CallBack','clear_fig(fig,lmenu); l_przemieszczenia;');
set([s(6,3)],'CallBack','clear_fig(fig,lmenu); l_przemieszczenia2;');
set([s(6,6)],'CallBack','clear_fig(fig,lmenu); wykres_przemieszczen;');
set([s(6,4)],'CallBack','clear_fig(fig,lmenu); l_reakcje;');
set([s(6,5)],'CallBack','clear_fig(fig,lmenu); l_sily;');
set([s(6,9)],'CallBack','l_save');
set([s(6,10)],'CallBack','l_load');
set([s(6,7)],'CallBack','clear_fig(fig,lmenu); l_wykres_sil;');
set([s(3,3) s(6,8)],'Enable','off');
%set([s(5,3)],'Enable','off');
%-------------------------------------------------------------
nr_dof=0;
nr_element=0;
nr_material=0;
nr_cross=0;
nr_bc=0;
nr_alert=0;
nr_sforce=0;
nr_lforce=0;
All_EvG=0;
All_eo=0;
All_iiak=0;
syms All_lforce x l_force1
%-------------------------------------------------------------
tablice=[15.6	236.5	92.06	2.51;
    21.2	349.2	133.8	5.24;
    26.0	449.5	167.3	9.25;
    39.3	758.7	274.4	29.30;
    53.2	1143	399.2	68.21;
    18.6	413.4	158.8	2.78;
    25.3	606.2	230.9	5.99;
    34.0	864.4	317.5	13.84;
    49.9	1388	497.7	40.96;
    66.4	2018	702.8	91.66;
    23.0	719.5	274.8	3.54;
    31.4	1033	389.3	8.13;
    43.0	1509	549.7	20.06;
    61.5	2330	830.3	55.68;
    80.6	3291	1144	120.0;
    30.4	1283	478.7	6.33;
    38.8	1673	615.6	12.19;
    54.3	2492	889.2	31.24;
    75.4	3704	1302	79.21;
    97.1	5098	1759	162.4;
    36.5	1967	730.0	8.33;
    45.3	2510	924.6	14.80;
    65.3	3831	1363	42.16;
    89.0	5543	1944	102.1;
    113.3	7483	2580	203.3;
    44.1	2944	1068	12.69;
    53.8	3692	1336	20.98;
    78.1	5696	2003	59.28;
    104.4	8029	2794	135.1;
    131.3	10640	3651	259.4;
    51.5	4170	1510	15.93;
    64.3	5410	1955	28.46;
    91.0	8091	2843	76.57;
    119.9	11180	3888	168.2;
    149.4	14600	5012	315.3;
    60.4	5835	2077	22.98;
    76.8	7763	2769	41.55;
    106.0	11260	3923	102.7;
    152.2	17330	5942	288.7;
    199.6	24290	8153	627.9;
    69.0	7981	2788	30.31;
    86.8	10450	3668	52.37;
    118.4	14920	5135	123.8;
    168.4	22590	7680	336.4;
    219.6	31310	10450	719.0;
    78.0	10560	3664	36.22;
    97.3	13670	4763	62.10;
    131.4	19270	6595	143.7;
    185.2	28810	9750	382.5;
    240.2	39550	13160	807.3;
    88.9	13800	4734	49.35;
    112.5	18260	6310	85.17;
    149.1	25170	8563	185.0;
    225.1	40950	13736	598.3;
    303.1	59200	19400	1408;
    94.6	16450	4959	55.87;
    124.4	22930	6985	108.0;
    161.3	30820	9239	225.1;
    236.9	48710	14446	679.1;
    312.0	68130	19710	1501;
    100.5	19550	5185	63.07;
    133.5	27690	7436	127.2;
    170.9	36660	9690	257.2;
    315.8	76370	19710	1506;
    106.6	23040	5410	70.99;
    142.8	33090	7887	148.8;
    180.6	43190	10140	292.5;
    318.8	84870	19520	1507;
    117.7	31250	5861	84.69;
    159.0	45070	8564	189.0;
    197.8	57680	10820	355.7;
    325.8	104100	19340	1515;
    127.1	41890	6088	95.61;
    178.0	63720	9465	243.8;
    218.0	79890	11720	440.5;
    335.4	131500	19340	1529;
    136.9	54640	6314	107.7;
    197.5	86970	10370	309.3;
    238.6	107200	12620	538.4;
    344.3	161900	19150	1539;
    152.8	72870	6767	133.7;
    211.8	111900	10820	351.5;
    254.1	136700	13080	600.3;
    354.4	198000	19160	1554;
    164.1	91900	6993	149.8;
    226.5	141200	11270	397.8;
    270.0	171000	13530	667.2;
    363.7	237400	18980	1564;
    27	337	180.5	149.1;
    27	399	213.6	169.6;
    175.8	113900	7221	167.5;
    241.6	175200	11720	448.3;
    286.3	210600	13980	739.2;
    373.7	281700	18980	1579;
    27	343	189.6	148.6;
    27	407	224.8	169.1;
    190.9	142700	7673	195.2;
    260.5	215300	12180	513.9;
    306.4	256900	14440	830.9;
    383.0	329300	18800	1589;
    27	352	201.6	148.6;
    27	418	239.0	169.1;
    218.5	208900	8134	256.8;
    285.8	303400	12640	596.9;
    334.2	359100	14900	946.0;
    404.3	442600	18630	1646;
    30	373	230.3	152.1;
    30	444	276.5	173.1;
    252.2	301100	9041	334.9;
    320.5	422100	13550	736.8;
    371.3	494100	15820	1137;
    423.6	570400	18450	1671;
    30	391	254.3	152.1;
    30	466	305.3	173.1;
    282.2	406500	9501	403.4;
    30	249	180.7	103.6;
    346.8	553800	14000	822.4;
    400.0	644700	16280	1254;
    444.2	722300	18460	1701;
    6.31	64.1	6.85	0.40;
    6.38	64.4	6.85	0.42;
    7.64	80.1	8.49	0.70;
    8.56	136	12.6	0.73;
    8.8	141	13.1	0.77;
    10.3	171	15.9	1.20;
    10.7	244	21.1	0.95;
    11.0	257	22.4	1.04;
    13.2	318	27.7	1.74;
    12.8	407	33.8	1.19;
    13.4	435	36.4	1.36;
    16.4	541	44.9	2.45;
    15.4	646	51.6	1.57;
    16.2	689	54.4	1.96;
    20.1	869	68.3	3.60;
    19.0	1020	78.1	2.48;
    19.6	1063	81.9	2.70;
    23.9	1317	101	4.79;
    27.1	1505	117	6.76;
    22.9	1533	112	3.84;
    23.5	1591	117	4.11;
    28.5	1943	142	6.98;
    32.0	2211	169	9.45;
    27.0	2219	165	5.02;
    28.3	2317	171	5.69;
    33.4	2772	205	9.07;
    37.4	3134	240	12.3;
    31.7	3154	231	7.33;
    33.3	3290	240	8.35;
    39.1	3892	284	12.9;
    43.7	4369	329	17.2;
    39.2	4917	358	10.3;
    45.9	5790	420	15.9;
    53.8	6947	514	24.9;
    46.5	7173	519	13.4;
    53.8	8356	604	20.1;
    62.8	9994	746	31.1;
    54.7	10230	685	19.6;
    62.6	11770	788	28.2;
    72.6	13910	960	42.2;
    64.0	14520	944	26.5;
    72.7	16270	1043	37.3;
    84.1	19050	1251	55.8;
    73.1	20290	1171	34.8;
    84.5	23130	1318	51.1;
    96.4	26750	1564	73.1;
    85.6	29760	1502	45.7;
    98.8	33740	1676	66.9;
    118	40920	2085	109;
    101	42930	1939	62.8;
    116	48200	2142	89.3;
    137	57780	2622	144;
    117	59980	2432	86.5;
    134	67120	2668	123;
    156	79160	3224	188;
    137	82920	3116	119;
    156	92080	3387	165;
    197	118300	4521	318;
    7.57	77.8	6.29	0.87;
    10.6	171	12.2	1.60;
    14.2	328	21.5	2.71;
    18.2	573	35.2	4.32;
    22.8	935	54.7	6.57;
    27.9	1450	81.3	9.58;
    33.4	2140	117	13.5;
    39.5	3060	162	18.6;
    46.1	4250	221	25.0;
    53.3	5740	288	33.5;
    61.0	7590	364	44.2;
    69.0	9800	451	56.8;
    77.7	12510	555	72.5;
    86.7	15700	674	90.4;
    97.0	19610	818	115;
    107	24010	975	141;
    118	29210	1160	170;
    147	45850	1730	267;
    179	68740	2480	402;
    212	99180	3490	544;
    254	139000	4670	787];
%-------------------------------------------------------------
tablice_mat=[75000	27800	0.35	;
    27000	11300	0.2	;
    29000	12100	0.2	;
    30000	12500	0.2	;
    31000	12900	0.2	;
    32000	13300	0.2	;
    34000	14200	0.2	;
    35000	14600	0.2	;
    36000	15000	0.2	;
    37000	15400	0.2	;
    7000	440	0	;
    8000	500	0	;
    9000	560	0	;
    9500	590	0	;
    10000	630	0	;
    11000	690	0	;
    12000	720	0	;
    12000	750	0	;
    13000	810	0	;
    14000	880	0	;
    15000	940	0	;
    16000	1000	0	;
    9500	590	0	;
    10000	620	0	;
    11000	690	0	;
    12000	750	0	;
    13000	810	0	;
    14000	880	0	;
    17000	1060	0	;
    20000	1250	0	;
    11600	590	0	;
    11600	720	0	;
    12600	720	0	;
    12600	780	0	;
    13700	780	0	;
    13700	850	0	;
    14700	850	0	;
    14700	910	0	;
    210000	81000	0.3	;
    210000	81000	0.3	;
    210000	81000	0.3	;
    210000	81000	0.3	;
    210000	81000	0.3	;
    210000	81000	0.3	;
    210000	81000	0.3	;
    210000	81000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3	;
    205000	80000	0.3];
%-------------------------------------------------------------