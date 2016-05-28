class CfgVehicleLoadouts
{
	class VehicleDefault
	{
		backpackCargo[] = {};
		itemCargo[] = {};
		magazineCargo[] = {};
		weaponCargo[] = {};
	};
	
	class HMMWV: VehicleDefault
	{
		backpackCargo[] = {
			{"B_AssaultPack_cbr", 1}
		};
		
		itemCargo[] = {
			{"ToolKit", 1},
			{"ACE_salineIV", 2},
			{"ACE_salineIV_500", 4},
			{"ACE_salineIV_250", 8},
			{"ACE_tourniquet", 10},
			{"ACE_elasticBandage", 100},
			{"ACE_packingBandage", 100},
			{"ACE_epinephrine", 5},
			{"ACE_morphine", 10},
			{"ACE_atropine", 5},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 5},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 10},
			{"ACE_SpareBarrel", 1},
			{"ACE_Clacker", 1}
		};
		
		magazineCargo[] = {		
			{"hlc_30rnd_556x45_EPR", 60},
			{"hlc_200rnd_556x45_M_SAW", 6},
			{"16Rnd_9x21_Mag", 6},
			{"SmokeShell", 6},
			{"SmokeShellRed", 3},
			{"SmokeShellGreen", 3},
			{"SmokeShellYellow", 3},
			{"SmokeShellPurple", 3},
			{"SmokeShellBlue", 3},
			{"SmokeShellOrange", 3},
			{"HandGrenade", 6},
			{"MiniGrenade", 6},
			{"1Rnd_HE_Grenade_shell", 12},			
			{"1Rnd_Smoke_Grenade_shell", 6},
			{"1Rnd_SmokeBlue_Grenade_shell", 3},
			{"1Rnd_SmokeOrange_Grenade_shell", 3},
			{"1Rnd_SmokeGreen_Grenade_shell", 3},
			{"1Rnd_SmokeRed_Grenade_shell", 3},
			{"1Rnd_SmokeYellow_Grenade_shell", 3},
			{"1Rnd_SmokePurple_Grenade_shell", 3},
			{"DemoCharge_Remote_Mag", 3}
		};
		
		weaponCargo[] = {
			{"hlc_rifle_M4", 2},
			{"hgun_P07_F", 2},
			{"rhs_weap_M136", 2}
		};
	};
	
	class MRAP: VehicleDefault
	{
		backpackCargo[] = {
			{"B_TacticalPack_oli", 3}
		};
		
		itemCargo[] = {
			{"ToolKit", 1},
			{"ACE_salineIV", 2},
			{"ACE_salineIV_500", 4},
			{"ACE_salineIV_250", 8},
			{"ACE_tourniquet", 10},
			{"ACE_elasticBandage", 100},
			{"ACE_packingBandage", 100},
			{"ACE_epinephrine", 5},
			{"ACE_morphine", 10},
			{"ACE_atropine", 5},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 5},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 10},
			{"ACE_SpareBarrel", 1},
			{"ACE_Clacker", 1},
			{"ACE_DefusalKit", 1}
		};
		
		magazineCargo[] = {		
			{"hlc_30rnd_556x45_EPR", 30},
			{"hlc_200rnd_556x45_M_SAW", 3},
			{"16Rnd_9x21_Mag", 6},
			{"SmokeShell", 6},
			{"SmokeShellRed", 3},
			{"SmokeShellGreen", 3},
			{"SmokeShellYellow", 3},
			{"SmokeShellPurple", 3},
			{"SmokeShellBlue", 3},
			{"SmokeShellOrange", 3},
			{"HandGrenade", 6},
			{"MiniGrenade", 6},
			{"1Rnd_HE_Grenade_shell", 6},			
			{"1Rnd_Smoke_Grenade_shell", 6},
			{"1Rnd_SmokeBlue_Grenade_shell", 3},
			{"1Rnd_SmokeOrange_Grenade_shell", 3},
			{"1Rnd_SmokeGreen_Grenade_shell", 3},
			{"1Rnd_SmokeRed_Grenade_shell", 3},
			{"1Rnd_SmokeYellow_Grenade_shell", 3},
			{"1Rnd_SmokePurple_Grenade_shell", 3},
			{"DemoCharge_Remote_Mag", 3},
			{"SatchelCharge_Remote_Mag", 1},
			{"hlc_30Rnd_545x39_EP_ak", 30},
			{"hlc_10rnd_12g_buck_S12", 10},
			{"hlc_10rnd_12g_slug_S12", 10},
			{"hlc_20Rnd_762x51_B_M14", 10},
			{"rhs_rpg7_PG7VL_mag", 3},
			{"rhsusf_mag_6Rnd_M441_HE", 6},
			{"rhsusf_mag_6Rnd_M714_white", 3},
			{"Laserbatteries", 1}
		};
		
		weaponCargo[] = {
			{"rhs_weap_m32", 1},
			{"hlc_rifle_ak12", 1},
			{"hgun_Rook40_F", 1},
			{"hlc_rifle_M4", 1},
			{"hgun_P07_F", 1},
			{"rhs_weap_M136", 1}
		};
	};
	
	class Russian: VehicleDefault
	{
		backpackCargo[] = {
			{"B_FieldPack_blk", 1}
		};
		
		itemCargo[] = {
			{"ToolKit", 1},
			{"ACE_salineIV", 2},
			{"ACE_salineIV_500", 4},
			{"ACE_salineIV_250", 8},
			{"ACE_tourniquet", 10},
			{"ACE_elasticBandage", 100},
			{"ACE_packingBandage", 100},
			{"ACE_epinephrine", 5},
			{"ACE_morphine", 10},
			{"ACE_atropine", 5},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 5},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 10},
			{"ACE_Clacker", 1}
		};
		
		magazineCargo[] = {		
			{"hlc_30Rnd_545x39_EP_ak", 60},
			{"hlc_10rnd_12g_buck_S12", 20},
			{"hlc_10rnd_12g_slug_S12", 20},
			{"hlc_20Rnd_762x51_B_M14", 20},
			{"16Rnd_9x21_Mag", 6},
			{"SmokeShell", 6},
			{"SmokeShellRed", 3},
			{"SmokeShellGreen", 3},
			{"SmokeShellYellow", 3},
			{"SmokeShellPurple", 3},
			{"SmokeShellBlue", 3},
			{"SmokeShellOrange", 3},
			{"HandGrenade", 6},
			{"MiniGrenade", 6},
			{"rhs_rpg7_PG7VL_mag", 3},
			{"rhs_rpg7_PG7VR_mag", 3},
			{"DemoCharge_Remote_Mag", 3}
		};
		
		weaponCargo[] = {
			{"hlc_rifle_ak12", 2},
			{"hgun_Rook40_F", 2}
		};
	};
	
	class MELB: VehicleDefault
	{
		backpackCargo[] = {
			{"B_AssaultPack_cbr", 1},
			{"STAF_tf_anarc210_Sand", 1}
		};
		
		itemCargo[] = {
			{"ToolKit", 1},
			{"ACE_salineIV", 1},
			{"ACE_salineIV_500", 2},
			{"ACE_salineIV_250", 4},
			{"ACE_tourniquet", 5},
			{"ACE_elasticBandage", 50},
			{"ACE_packingBandage", 50},
			{"ACE_epinephrine", 2},
			{"ACE_morphine", 5},
			{"ACE_atropine", 2},
			{"ACE_EarPlugs", 2},
			{"ACE_personalAidKit", 2},
			{"ACE_surgicalKit", 1}
		};
		
		magazineCargo[] = {		
			{"hlc_30Rnd_9x19_B_MP5", 6},
			{"16Rnd_9x21_Mag", 3},
			{"SmokeShell", 3},
			{"SmokeShellRed", 1},
			{"SmokeShellGreen", 1},
			{"SmokeShellYellow", 1},
			{"SmokeShellPurple", 1},
			{"SmokeShellBlue", 1},
			{"SmokeShellOrange", 1},
			{"MiniGrenade", 3}
		};
		
		weaponCargo[] = {
			{"hgun_P07_F", 1}
		};
	};
};