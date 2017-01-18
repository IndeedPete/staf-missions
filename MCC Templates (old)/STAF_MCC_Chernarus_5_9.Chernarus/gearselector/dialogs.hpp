class staf_gearselector_dialog
{
	idd=2678;
	movingenable = 0;

	class Backgrounds
	{
	};
	class controls
	{
		class staf_gearselection_bg: BOX
		{
			idc = 1000;
			x = 0.304167 * safezoneW + safezoneX;
			y = 0.264874 * safezoneH + safezoneY;
			w = 0.391667 * safezoneW;
			h = 0.470252 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class staf_gearselection_header: RscStructuredText
		{
			idc = 1001;
			text = "STAF - MCC Template Quick Gear Selector"; //--- ToDo: Localize;
			x = 0.304166 * safezoneW + safezoneX;
			y = 0.264874 * safezoneH + safezoneY;
			w = 0.391667 * safezoneW;
			h = 0.0564303 * safezoneH;
		};
		class staf_gearselection_innerframe: RscFrame
		{
			idc = 1801;
			x = 0.313958 * safezoneW + safezoneX;
			y = 0.330709 * safezoneH + safezoneY;
			w = 0.372083 * safezoneW;
			h = 0.319772 * safezoneH;
		};
		class staf_gearselection_choose: RscStructuredTextLeft
		{
			idc = 1002;
			text = "Choose the gear preset you want to change into:"; //--- ToDo: Localize;
			x = 0.318854 * safezoneW + safezoneX;
			y = 0.340114 * safezoneH + safezoneY;
			w = 0.357396 * safezoneW;
			h = 0.0282151 * safezoneH;
		};
		class staf_gearselector_infantry: RscStructuredTextSmall
		{
			idc = 1003;
			text = "Infantry"; //--- ToDo: Localize;
			x = 0.328645 * safezoneW + safezoneX;
			y = 0.368329 * safezoneH + safezoneY;
			w = 0.0930208 * safezoneW;
			h = 0.0282151 * safezoneH;
		};
		class staf_gearselector_vehicle: RscStructuredTextSmall
		{
			idc = 1004;
			text = "Vehicle Crew"; //--- ToDo: Localize;
			x = 0.451042 * safezoneW + safezoneX;
			y = 0.368329 * safezoneH + safezoneY;
			w = 0.0930208 * safezoneW;
			h = 0.0282151 * safezoneH;
		};
		class staf_gearselector_special: RscStructuredTextSmall
		{
			idc = 1005;
			text = "Special Units"; //--- ToDo: Localize;
			x = 0.573438 * safezoneW + safezoneX;
			y = 0.368329 * safezoneH + safezoneY;
			w = 0.0979167 * safezoneW;
			h = 0.0282151 * safezoneH;
		};
		class staf_gearselector_cancel: RscButtonMenu
		{
		  idc = 2423;
		  text = "Cancel"; //--- ToDo: Localize;
			x = 0.32375 * safezoneW + safezoneX;
			y = 0.678696 * safezoneH + safezoneY;
			w = 0.102812 * safezoneW;
			h = 0.0376202 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "closeDialog 0;";
		};
		class staf_gearselector_leader: RscButtonMenu
		{
		  idc = 2400;
		  text = "Team/Squad Leader"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.40595 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\leader.sqf""";
		};
		class staf_gearselector_rifleman: RscButtonMenu
		{
		  idc = 2403;
		  text = "Rifleman"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.42476 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\rifleman.sqf""";
		};
		class staf_gearselector_autorifleman: RscButtonMenu
		{
		  idc = 2401;
		  text = "Automatic Rifleman"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.44357 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Automatic_Rifleman.sqf""";
		};
		class staf_gearselector_medic: RscButtonMenu
		{
		  idc = 2404;
		  text = "Combat Life Saver"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.46238 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Medic.sqf""";
		};
		class staf_gearselector_at: RscButtonMenu
		{
		  idc = 2406;
		  text = "Rifleman AT"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.48119 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Rifleman_AT.sqf""";
		};
		class staf_gearselector_marksman: RscButtonMenu
		{
		  idc = 2405;
		  text = "Marksman"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.5 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Marksman.sqf""";
		};
		class staf_gearselector_exp: RscButtonMenu
		{
		  idc = 2402;
		  text = "Explosive Specialist"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.51881 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Explosive_Specialist.sqf""";
		};
		class staf_gearselector_jtac: RscButtonMenu
		{
		  idc = 2409;
		  text = "JTAC"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.53762 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\JTAC.sqf""";
		};
		class staf_gearselector_uav: RscButtonMenu
		{
		  idc = 2410;
		  text = "UAV Operator"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.55643 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\UAV_Operator.sqf""";
		};
		class staf_gearselector_sniper: RscButtonMenu
		{
		  idc = 2407;
		  text = "Sniper"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.59405 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Sniper.sqf""";
		};
		class staf_gearselector_spotter: RscButtonMenu
		{
		  idc = 2408;
		  text = "Spotter"; //--- ToDo: Localize;
		  x = 0.32375 * safezoneW + safezoneX;
		  y = 0.612861 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Spotter.sqf""";
		};
		class staf_gearselector_crew: RscButtonMenu
		{
		  idc = 2411;
		  text = "Tank/APC Crew"; //--- ToDo: Localize;
		  x = 0.446146 * safezoneW + safezoneX;
		  y = 0.40595 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Crew.sqf""";
		};
		class staf_gearselector_heli: RscButtonMenu
		{
		  idc = 2413;
		  text = "Helicopter Pilot"; //--- ToDo: Localize;
		  x = 0.446146 * safezoneW + safezoneX;
		  y = 0.44357 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Heli.sqf""";
		};
		class staf_gearselector_jet: RscButtonMenu
		{
		  idc = 2414;
		  text = "Jet Pilot"; //--- ToDo: Localize;
		  x = 0.446146 * safezoneW + safezoneX;
		  y = 0.48119 * safezoneH + safezoneY;
		  w = 0.102812 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\Jet.sqf""";
		};
		class staf_gearselector_gh_leader: RscButtonMenu
		{
		  idc = 2412;
		  text = "Ghost Team Leader"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.40595 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\ghost_leader.sqf""";
		};
		class staf_gearselector_gh_operator: RscButtonMenu
		{
		  idc = 2415;
		  text = "Ghost Operator"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.42476 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\ghost_operator.sqf""";
		};
		class staf_gearselector_gh_medic: RscButtonMenu
		{
		  idc = 2416;
		  text = "Ghost Medic"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.44357 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\ghost_medic.sqf""";
		};
		class staf_gearselector_gh_marksman: RscButtonMenu
		{
		  idc = 2417;
		  text = "Ghost Marksman"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.46238 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\ghost_marksman.sqf""";
		};
		class staf_gearselector_gh_exp: RscButtonMenu
		{
		  idc = 2418;
		  text = "Ghost Exp. Specialist"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.48119 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\ghost_explosive_specialist.sqf""";
		};
		class staf_gearselector_diver_leader: RscButtonMenu
		{
		  idc = 2419;
		  text = "Diver Team Leader"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.51881 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\diver_leader.sqf""";
		};
		class staf_gearselector_diver_operator: RscButtonMenu
		{
		  idc = 2420;
		  text = "Diver Operator"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.53762 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\diver_Operator.sqf""";
		};
		class staf_gearselector_diver_medic: RscButtonMenu
		{
		  idc = 2421;
		  text = "Diver Medic"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.55643 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\diver_medic.sqf""";
		};
		class staf_gearselector_diver_exp: RscButtonMenu
		{
		  idc = 2422;
		  text = "Diver Exp. Specialist"; //--- ToDo: Localize;
		  x = 0.568542 * safezoneW + safezoneX;
		  y = 0.57524 * safezoneH + safezoneY;
		  w = 0.107708 * safezoneW;
		  h = 0.0188101 * safezoneH;
		  colorBackground[] = {0.188,0.498,0.753,1};
		  colorActive[] = {0.188,0.498,0.753,1};
		  action = "_nil=[] execVM ""gearselector\loadouts\diver_explosive_specialist.sqf""";
		};
	};
};
