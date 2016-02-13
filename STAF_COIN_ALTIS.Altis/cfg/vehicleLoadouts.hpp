class CfgVehicleLoadouts
{
	class vehicleDefault
	{
		backpackCargo[] = {};
		itemCargo[] = {};
		magazineCargo[] = {};
		weaponCargo[] = {};
	};
	
	class Gorgon: vehicleDefault
	{
		itemCargo[] = {
			{"NVGoggles", 3},
			{"ToolKit", 1},
			{"ACE_salineIV", 2},
			{"ACE_salineIV_500", 2},
			{"ACE_salineIV_250", 3},
			{"ACE_tourniquet", 2},
			{"ACE_elasticBandage", 10},
			{"ACE_packingBandage", 20},
			{"ACE_fieldDressing", 10},
			{"ACE_quikclot", 10},
			{"ACE_epinephrine", 20},
			{"ACE_morphine", 20},
			{"ACE_atropine", 10},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 1},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_DefusalKit", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 5},
			{"ACE_IR_Strobe_Item", 10},
			{"ACE_RangeTable_82mm", 1},
			{"ItemGPS", 1},
			{"ACE_SpareBarrel", 1},
			{"ACE_Flashlight_XL50", 3},
			{"acc_flashlight", 3}
		};
		
		magazineCargo[] = {		
			{"30Rnd_65x39_caseless_mag_Tracer", 30},
			{"20Rnd_762x51_Mag", 5},
			{"3Rnd_HE_Grenade_shell", 6},
			{"100Rnd_65x39_caseless_mag_Tracer", 10},
			{"200Rnd_65x39_cased_Box", 5},
			{"150Rnd_93x64_Mag", 5},
			{"HandGrenade", 3},
			{"MiniGrenade", 3},
			{"SmokeShell", 6},
			{"SmokeShellRed", 3},
			{"SmokeShellGreen", 3},
			{"SmokeShellYellow", 3},
			{"SmokeShellPurple", 3},
			{"SmokeShellBlue", 3},
			{"SmokeShellOrange", 3},
			{"B_IR_Grenade", 3},
			{"DemoCharge_Remote_Mag", 3}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"launch_NLAW_F", 3},
			{"IP_arifle_MX_Sage_F", 3}
		};
		
		class attachment0
		{
			attachTo[] = {2.5, 1, -1};
			className = "B_HMG_01_weapon_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
		
		class attachment1
		{
			attachTo[] = {-1.4, 1, -1};
			className = "B_HMG_01_support_F";
			vectorDirAndUp[] = {{0, 0, -1}, {-3, 0, 0}};
		};
		
		class attachment2
		{
			attachTo[] = {2.5, -0.8, -0.9};
			className = "B_Mortar_01_support_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
		
		class attachment3
		{
			attachTo[] = {2.5, -1.5, -0.9};
			className = "B_Mortar_01_weapon_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
	};
};