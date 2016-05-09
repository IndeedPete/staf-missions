class CfgVehicleLoadouts
{
	class VehicleDefault
	{
		backpackCargo[] = {};
		itemCargo[] = {};
		magazineCargo[] = {};
		weaponCargo[] = {};
	};
	
	class APC: VehicleDefault
	{
		itemCargo[] = {
			//{"NVGoggles", 3},
			{"ToolKit", 1},
			{"ACE_salineIV", 2},
			{"ACE_salineIV_500", 2},
			{"ACE_salineIV_250", 3},
			{"ACE_tourniquet", 2},
			{"ACE_elasticBandage", 10},
			{"ACE_packingBandage", 20},
			{"ACE_fieldDressing", 10},
			{"ACE_quikclot", 10},
			{"ACE_epinephrine", 10},
			{"ACE_morphine", 20},
			{"ACE_atropine", 10},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 5},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			//{"ACE_DefusalKit", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			//{"ACE_CableTie", 5},
			//{"ACE_IR_Strobe_Item", 10},
			//{"ACE_RangeTable_82mm", 1},
			{"ACE_MapTools", 1},
			{"ItemGPS", 1},
			{"ACE_SpareBarrel", 1},
			{"ACE_Flashlight_XL50", 3},
			{"acc_flashlight", 3}
		};
		
		magazineCargo[] = {		
			{"rhs_mag_30Rnd_556x45_M855A1_Stanag", 60},
			{"rhs_200rnd_556x45_M_SAW", 10},
			{"SmokeShell", 6},
			{"SmokeShellRed", 3},
			{"SmokeShellGreen", 3},
			{"SmokeShellYellow", 3},
			{"SmokeShellPurple", 3},
			{"SmokeShellBlue", 3},
			{"SmokeShellOrange", 3},
			{"Chemlight_green", 10},
			{"Chemlight_red", 10},
			{"Chemlight_yellow", 10},
			{"Chemlight_blue", 10}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"rhs_weap_m4a1_carryhandle", 3},
			{"rhs_weap_m249_pip_S", 1}
		};
	};
	
	class MRAP_HMG: VehicleDefault
	{
		itemCargo[] = {
			//{"NVGoggles", 2},
			{"ToolKit", 1},
			{"ACE_salineIV", 2},
			{"ACE_salineIV_500", 2},
			{"ACE_salineIV_250", 3},
			{"ACE_tourniquet", 2},
			{"ACE_elasticBandage", 10},
			{"ACE_packingBandage", 20},
			{"ACE_fieldDressing", 10},
			{"ACE_quikclot", 10},
			{"ACE_epinephrine", 10},
			{"ACE_morphine", 20},
			{"ACE_atropine", 10},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 3},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			//{"ACE_DefusalKit", 1},
			//{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			//{"ACE_CableTie", 5},
			//{"ACE_IR_Strobe_Item", 10},
			{"ItemGPS", 1},
			{"ACE_SpareBarrel", 1},
			{"ACE_Flashlight_XL50", 3},
			{"acc_flashlight", 3}
		};
		
		magazineCargo[] = {		
			{"rhs_mag_30Rnd_556x45_M855A1_Stanag", 30},
			{"rhs_200rnd_556x45_M_SAW", 5},
			{"HandGrenade", 3},
			{"MiniGrenade", 3},
			{"SmokeShell", 6},
			{"SmokeShellRed", 3},
			{"SmokeShellGreen", 3},
			{"SmokeShellYellow", 3},
			{"SmokeShellPurple", 3},
			{"SmokeShellBlue", 3},
			{"SmokeShellOrange", 3},
			{"Chemlight_green", 5},
			{"Chemlight_red", 5},
			{"Chemlight_yellow", 5},
			{"Chemlight_blue", 5}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"rhs_weap_m4a1_carryhandle", 2}
		};
	};
};