class ShopPersonnel
{
    class West 
	{
		show = 0;
	};
	
	class Independent 
	{
		show = 0;
	};
	
	class East
	{
		show = 0;
	};
	
	class Civilian
	{
		show = 0;
	};
	
	class Merc
	{
		show = 0;
		
		class Rifleman
		{
			backpack = "";
			baseClasses[] = {"B_Soldier_F","I_Soldier_F","O_Soldier_F"}; // West, Independent, East
			costRate = 0;
			faction = "Mercs";
			gogglesPools[] = {"Goggles"};
			gogglesProbability = 0.5;
			handgunAttachments[] = {{"", "", "optic_MRD", "optic_Yorris"}};
			handgunMagazines = 3;
			handgunPools[] = {"Pistols"};
			headgearPools[] = {"HeadgearSoft","HeadgearCombat"};
			headgearProbability = 0.9;
			isMerc = 1;
			items[] = {"FirstAidKit"};
			linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemCompass", {"", "ItemGPS"}}; // , {"NVGoggles_INDEP", "NVGoggles_OPFOR"}
			magazines[] = {"HandGrenade","HandGrenade","SmokeShell","SmokeShellOrange","Chemlight_yellow","Chemlight_yellow"};
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 10;
			primaryWeaponPools[] = {"Carbines","Rifles"};
			skill = 4;
			uniformPools[] = {"Paramilitary","Military"};
			secondaryWeapon = "";
			vestPools[] = {"VestsMedium","VestsHeavy"};
			weapons[] = {{"", "Binocular", "Rangefinder"}};
		};
		
		class Light: Rifleman
		{
			baseClasses[] = {"B_Soldier_lite_F","I_Soldier_lite_F","O_Soldier_lite_F"}; // West, Independent, East
			headgearPools[] = {"HeadgearSoft"};
			linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemCompass"};
			magazines[] = {"SmokeShell","Chemlight_yellow"};
			primaryAttachments[] = {};
			primaryMagazines = 4;
			primaryWeaponPools[] = {"SMG","Carbines","Rifles"};
			vestPools[] = {"VestsLight"};
			weapons[] = {};
		};
		
		class Unarmed: Light
		{
			handgun = "";
			handgunPools[] = {};
			magazines[] = {};
			primaryWeapon = "";
			primaryWeaponPools[] = {};
			vest = "";
			vestPools[] = {};
		};
		
		class Grenadier: Rifleman
		{
			baseClasses[] = {"B_Soldier_GL_F","I_Soldier_GL_F","O_Soldier_GL_F"}; // West, Independent, East
			primaryMagazines[] = {6,8};
			primaryWeaponPools[] = {"RiflesGL"};
		};
		
		class Autorifleman: Rifleman
		{
			baseClasses[] = {"B_Soldier_AR_F","I_Soldier_AR_F","O_Soldier_AR_F"}; // West, Independent, East
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws_mg"}, {"bipod_01_F_blk", "bipod_02_F_blk", "bipod_03_F_blk", "bipod_03_F_oli"}}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 4;
			primaryWeaponPools[] = {"LMG"};
			rank = "COPORAL";
		};
		
		class Marksman: Rifleman
		{
			baseClasses[] = {"B_Soldier_M_F","I_Soldier_M_F","O_Soldier_M_F"}; // West, Independent, East
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws","optic_KHS_old","optic_SOS","optic_KHS_blk","optic_AMS","optic_DMS","optic_LRPS"}, {"bipod_01_F_blk", "bipod_02_F_blk", "bipod_03_F_blk", "bipod_03_F_oli"}}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"Marksman"};
		};
		
		class LAT: Rifleman
		{
			backpack = "I_Fieldpack_oli_LAT";
			baseClasses[] = {"B_Soldier_LAT_F","I_Soldier_LAT_F","O_Soldier_LAT_F"}; // West, Independent, East
			magazines[] = {"NLAW_F","HandGrenade","HandGrenade","SmokeShell","SmokeShellOrange","Chemlight_yellow","Chemlight_yellow"};
			primaryMagazines = 6;
			secondaryWeapon = "launch_NLAW_F";
		};
		
		class Teamleader: Rifleman
		{
			baseClasses[] = {"B_Soldier_TL_F","I_Soldier_TL_F","O_Soldier_TL_F"}; // West, Independent, East
			handgunAttachments[] = {{"optic_MRD", "optic_Yorris"}};
			linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemCompass", "ItemGPS", {"NVGoggles_INDEP", "NVGoggles_OPFOR"}};
			magazines[] = {"HandGrenade","HandGrenade","MiniGrenade","MiniGrenade","SmokeShell","SmokeShell","SmokeShellOrange","Chemlight_yellow","Chemlight_yellow"};
			primaryAttachments[] = {"", {"acc_flashlight", "acc_pointer_IR"}, {"optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"Rifles"};
			rank = "SERGEANT";
			skill = 5;
			weapons[] = {{"Binocular", "Rangefinder"}};
		};
		
		class Medic: Rifleman
		{
			backpack = "B_AssaultPack_rgr_Medic";
			baseClasses[] = {"B_Medic_F","I_Medic_F","O_Medic_F"}; // West, Independent, East
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco_smg", "optic_ACO_grn_smg", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"SMG","Carbines"};
		};
		
		class Engineer: Rifleman
		{
			backpack = "I_Carryall_oli_Eng";
			baseClasses[] = {"B_Engineer_F","I_Engineer_F","O_Engineer_F"}; // West, Independent, East
			primaryAttachments[] = {"", {"", "acc_flashlight", "acc_pointer_IR"}, {"", "optic_Aco_smg", "optic_ACO_grn_smg", "optic_Aco", "optic_ACO_grn", "optic_Holosight", "optic_MRCO", "optic_Arco", "optic_Hamr", "optic_NVS", "optic_Nightstalker", "optic_tws"}, ""}; // Muzzle, Rail, Optics, Under Barrel
			primaryMagazines = 8;
			primaryWeaponPools[] = {"SMG","Carbines"};
		};
	};
};