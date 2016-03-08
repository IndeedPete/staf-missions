class CfgVehicleLoadouts
{
	class VehicleDefault
	{
		backpackCargo[] = {};
		itemCargo[] = {};
		magazineCargo[] = {};
		weaponCargo[] = {};
	};
	
	class Gorgon: VehicleDefault
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
			{"ACE_epinephrine", 10},
			{"ACE_morphine", 20},
			{"ACE_atropine", 10},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 5},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_DefusalKit", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 5},
			{"ACE_IR_Strobe_Item", 10},
			{"ACE_RangeTable_82mm", 1},
			{"ACE_MapTools", 1},
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
			{"APERSBoundingMine_Range_Mag", 10},
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
			{"DemoCharge_Remote_Mag", 5},
			{"Chemlight_green", 10},
			{"Chemlight_red", 10},
			{"Chemlight_yellow", 10},
			{"Chemlight_blue", 10}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"launch_NLAW_F", 3},
			{"IP_arifle_MX_Sage_F", 2},
			{"IP_arifle_MX_GL_Sage_F", 1},
			{"IP_arifle_MX_SW_Sage_F", 1}
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
	
	class MBT: VehicleDefault
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
			{"ACE_epinephrine", 10},
			{"ACE_morphine", 20},
			{"ACE_atropine", 10},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 5},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 5},
			{"ACE_IR_Strobe_Item", 10},
			{"ItemGPS", 1},
			{"ACE_Flashlight_XL50", 3},
			{"acc_flashlight", 3}
		};
		
		magazineCargo[] = {		
			{"30Rnd_65x39_caseless_mag_Tracer", 15},
			{"20Rnd_762x51_Mag", 3},
			{"3Rnd_HE_Grenade_shell", 3},
			{"100Rnd_65x39_caseless_mag_Tracer", 5},
			{"200Rnd_65x39_cased_Box", 3},
			{"150Rnd_93x64_Mag", 3},
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
			{"Titan_AT", 3},
			{"Titan_AP", 3},
			{"Titan_AA", 3},
			{"Chemlight_green", 5},
			{"Chemlight_red", 5},
			{"Chemlight_yellow", 5},
			{"Chemlight_blue", 5}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"launch_B_Titan_F", 1},
			{"launch_B_Titan_short_F", 1},
			{"IP_arifle_MXC_Sage_F", 2}
		};
	};
	
	class Scout: VehicleDefault
	{
		itemCargo[] = {
			{"NVGoggles", 1},
			{"ToolKit", 1},
			{"ACE_salineIV", 1},
			{"ACE_salineIV_500", 1},
			{"ACE_salineIV_250", 2},
			{"ACE_tourniquet", 1},
			{"ACE_elasticBandage", 5},
			{"ACE_packingBandage", 10},
			{"ACE_fieldDressing", 5},
			{"ACE_quikclot", 5},
			{"ACE_epinephrine", 5},
			{"ACE_morphine", 10},
			{"ACE_atropine", 5},
			{"ACE_EarPlugs", 2},
			{"ACE_personalAidKit", 3},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 2},
			{"ACE_CableTie", 2},
			{"ACE_IR_Strobe_Item", 5},
			{"ACE_RangeTable_82mm", 1},
			{"ACE_MapTools", 1},
			{"ItemGPS", 1},
			{"ACE_Flashlight_XL50", 1},
			{"acc_flashlight", 1},
			{"B_UavTerminal", 1},
			{"ACE_Kestrel4500", 1}
		};
		
		magazineCargo[] = {		
			{"30Rnd_65x39_caseless_mag_Tracer", 10},
			{"20Rnd_762x51_Mag", 10},
			{"3Rnd_HE_Grenade_shell", 2},			
			{"3Rnd_UGL_FlareWhite_F", 2},
			{"3Rnd_UGL_FlareGreen_F", 2},
			{"3Rnd_UGL_FlareRed_F", 2},
			{"3Rnd_UGL_FlareYellow_F", 2},
			{"3Rnd_UGL_FlareCIR_F", 2},			
			{"3Rnd_Smoke_Grenade_shell", 1},
			{"3Rnd_SmokeRed_Grenade_shell", 1},
			{"3Rnd_SmokeGreen_Grenade_shell", 1},
			{"3Rnd_SmokeYellow_Grenade_shell", 1},
			{"3Rnd_SmokePurple_Grenade_shell", 1},
			{"3Rnd_SmokeBlue_Grenade_shell", 1},
			{"3Rnd_SmokeOrange_Grenade_shell", 1},			
			{"HandGrenade", 2},
			{"SmokeShell", 4},
			{"SmokeShellRed", 2},
			{"SmokeShellGreen", 2},
			{"SmokeShellYellow", 2},
			{"SmokeShellPurple", 2},
			{"SmokeShellBlue", 2},
			{"SmokeShellOrange", 2},
			{"B_IR_Grenade", 2},
			{"Laserbatteries", 1},
			{"Chemlight_green", 5},
			{"Chemlight_red", 5},
			{"Chemlight_yellow", 5},
			{"Chemlight_blue", 5}
		};
		
		weaponCargo[] = {
			{"Rangefinder", 1},
			{"ACE_Vector", 1},
			{"Laserdesignator", 1},
			{"IP_arifle_MXM_Sage_F", 1},
			{"IP_arifle_MX_GL_Sage_F", 1},
			{"launch_NLAW_F", 1}
		};
		
		class attachment0
		{
			attachTo[] = {1.9, -2.7, -0.3};
			className = "B_Mortar_01_support_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
		
		class attachment1
		{
			attachTo[] = {-1.9, -2.7, -0.3};
			className = "B_Mortar_01_weapon_F";
			vectorDirAndUp[] = {{0, 0, -1}, {-3, 0, 0}};
		};
		
		class attachment2
		{
			attachTo[] = {1.9, -1.2, -0.1};
			className = "B_UAV_01_backpack_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
		
		class attachment3
		{
			attachTo[] = {-1.9, -1.2, -0.1};
			className = "STAF_tf_rt1523g_big_sage";
			vectorDirAndUp[] = {{0, 0, -1}, {-3, 0, 0}};
		};
	};
	
	class Scout_HMG: Scout
	{
		class attachment0
		{
			attachTo[] = {1.9, -2.7, -1};
			className = "B_Mortar_01_support_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
		
		class attachment1
		{
			attachTo[] = {-1.9, -2.7, -1};
			className = "B_Mortar_01_weapon_F";
			vectorDirAndUp[] = {{0, 0, -1}, {-3, 0, 0}};
		};
		
		class attachment2
		{
			attachTo[] = {1.9, -1.2, -0.8};
			className = "B_UAV_01_backpack_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
		
		class attachment3
		{
			attachTo[] = {-1.9, -1.2, -0.8};
			className = "STAF_tf_rt1523g_big_sage";
			vectorDirAndUp[] = {{0, 0, -1}, {-3, 0, 0}};
		};
	};
	
	class MRAP_HMG: VehicleDefault
	{
		itemCargo[] = {
			{"NVGoggles", 2},
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
			{"ACE_DefusalKit", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 5},
			{"ACE_IR_Strobe_Item", 10},
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
			{"APERSBoundingMine_Range_Mag", 5},
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
			{"DemoCharge_Remote_Mag", 2},
			{"Chemlight_green", 5},
			{"Chemlight_red", 5},
			{"Chemlight_yellow", 5},
			{"Chemlight_blue", 5}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"launch_NLAW_F", 3},
			{"IP_arifle_MX_Sage_F", 2},
			{"IP_arifle_MX_GL_Sage_F", 1},
			{"IP_arifle_MX_SW_Sage_F", 1}
		};
		
		class attachment0
		{
			attachTo[] = {1.6, -3.4, -0.9};
			className = "B_GMG_01_weapon_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
		
		class attachment1
		{
			attachTo[] = {-1.6, -3.4, -0.9};
			className = "B_HMG_01_support_F";
			vectorDirAndUp[] = {{0, 0, -1}, {-3, 0, 0}};
		};
	};
	
	class MRAP_GMG: MRAP_HMG
	{
		class attachment0
		{
			attachTo[] = {1.6, -3.4, -0.9};
			className = "B_HMG_01_weapon_F";
			vectorDirAndUp[] = {{0, 0, -1}, {3, 0, 0}};
		};
	};
	
	class Bobcat: VehicleDefault
	{
		itemCargo[] = {
			{"NVGoggles", 1},
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
			{"ACE_EarPlugs", 2},
			{"ACE_personalAidKit", 3},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 2},
			{"ACE_CableTie", 2},
			{"ACE_IR_Strobe_Item", 5},
			{"ItemGPS", 1},
			{"ACE_Flashlight_XL50", 1},
			{"acc_flashlight", 1},
			{"ACE_DefusalKit", 1},
			{"ACE_Clacker", 3},
			{"ACE_M26_Clacker", 3}
		};
		
		magazineCargo[] = {		
			{"30Rnd_65x39_caseless_mag_Tracer", 10},
			{"3Rnd_HE_Grenade_shell", 3},
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
			{"DemoCharge_Remote_Mag", 20},
			{"SatchelCharge_Remote_Mag", 10},
			{"ATMine_Range_Mag", 4},
			{"SLAMDirectionalMine_Wire_Mag", 8},
			{"Chemlight_green", 5},
			{"Chemlight_red", 5},
			{"Chemlight_yellow", 5},
			{"Chemlight_blue", 5}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"IP_arifle_MXC_Sage_F", 2},
			{"launch_NLAW_F", 3}
		};
	};
	
	class HEMTT: VehicleDefault
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
			{"ACE_epinephrine", 10},
			{"ACE_morphine", 20},
			{"ACE_atropine", 10},
			{"ACE_EarPlugs", 5},
			{"ACE_personalAidKit", 5},
			{"ACE_surgicalKit", 1},
			{"ACE_wirecutter", 1},
			{"ACE_DefusalKit", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 5},
			{"ACE_IR_Strobe_Item", 10},
			{"ACE_RangeTable_82mm", 1},
			{"ACE_MapTools", 1},
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
			{"APERSBoundingMine_Range_Mag", 5},
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
			{"DemoCharge_Remote_Mag", 2},
			{"Chemlight_green", 10},
			{"Chemlight_red", 10},
			{"Chemlight_yellow", 10},
			{"Chemlight_blue", 10}
		};
	};
	
	class HEMTT_MEDICAL: VehicleDefault
	{
		itemCargo[] = {
			{"ToolKit", 1},
			{"ACE_salineIV", 6},
			{"ACE_salineIV_500", 6},
			{"ACE_salineIV_250", 9},
			{"ACE_tourniquet", 6},
			{"ACE_elasticBandage", 30},
			{"ACE_packingBandage", 60},
			{"ACE_fieldDressing", 30},
			{"ACE_quikclot", 30},
			{"ACE_epinephrine", 30},
			{"ACE_morphine", 60},
			{"ACE_atropine", 30},
			{"ACE_EarPlugs", 15},
			{"ACE_personalAidKit", 15},
			{"ACE_surgicalKit", 2},
			{"ACE_bodyBag", 15},
			{"ACE_IR_Strobe_Item", 30},
			{"ACE_Flashlight_XL50", 9},
			{"acc_flashlight", 9}
		};
		
		magazineCargo[] = {		
			{"SmokeShell", 18},
			{"SmokeShellRed", 9},
			{"SmokeShellGreen", 9},
			{"SmokeShellYellow", 9},
			{"SmokeShellPurple", 9},
			{"SmokeShellBlue", 9},
			{"SmokeShellOrange", 9},
			{"Chemlight_green", 10},
			{"Chemlight_red", 10},
			{"Chemlight_yellow", 10},
			{"Chemlight_blue", 10}
		};
	};
	
	class UGV: VehicleDefault
	{
		itemCargo[] = {
			{"NVGoggles", 2},
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
			{"ACE_DefusalKit", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 5},
			{"ACE_IR_Strobe_Item", 10},
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
			{"APERSBoundingMine_Range_Mag", 5},
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
			{"DemoCharge_Remote_Mag", 2},
			{"Chemlight_green", 5},
			{"Chemlight_red", 5},
			{"Chemlight_yellow", 5},
			{"Chemlight_blue", 5}
		};
	};
	
	class Quad: VehicleDefault
	{
		itemCargo[] = {
			{"ACE_salineIV", 1},
			{"ACE_salineIV_500", 1},
			{"ACE_salineIV_250", 2},
			{"ACE_tourniquet", 1},
			{"ACE_elasticBandage", 5},
			{"ACE_packingBandage", 10},
			{"ACE_fieldDressing", 5},
			{"ACE_quikclot", 5},
			{"ACE_epinephrine", 2},
			{"ACE_morphine", 2},
			{"ACE_atropine", 2},
			{"ACE_EarPlugs", 1},
			{"ACE_personalAidKit", 1},
			{"ACE_IR_Strobe_Item", 1},
			{"ACE_Flashlight_XL50", 1},
			{"ItemGPS", 1}
		};
		
		magazineCargo[] = {		
			{"Chemlight_green", 3},
			{"Chemlight_red", 3},
			{"Chemlight_yellow", 3},
			{"Chemlight_blue", 3}
		};
	};
	
	class Littlebird: VehicleDefault
	{
		backpackCargo[] = {
			{"STAF_tf_anarc210_Sage", 1}
		};
		
		itemCargo[] = {
			{"ACE_salineIV", 1},
			{"ACE_salineIV_500", 1},
			{"ACE_salineIV_250", 2},
			{"ACE_tourniquet", 1},
			{"ACE_elasticBandage", 5},
			{"ACE_packingBandage", 10},
			{"ACE_fieldDressing", 5},
			{"ACE_quikclot", 5},
			{"ACE_epinephrine", 2},
			{"ACE_morphine", 2},
			{"ACE_atropine", 2},
			{"ACE_EarPlugs", 1},
			{"ACE_personalAidKit", 1},
			{"ACE_IR_Strobe_Item", 1},
			{"ACE_Flashlight_XL50", 1},
			{"ItemGPS", 1}
		};
		
		magazineCargo[] = {		
			{"30Rnd_45ACP_Mag_SMG_01", 4},
			{"16Rnd_9x21_Mag", 4},
			{"MiniGrenade", 2},
			{"SmokeShell", 3},
			{"SmokeShellRed", 1},
			{"SmokeShellGreen", 1},
			{"SmokeShellYellow", 1},
			{"SmokeShellPurple", 1},
			{"SmokeShellBlue", 1},
			{"SmokeShellOrange", 1},
			{"B_IR_Grenade", 1},
			{"Chemlight_green", 3},
			{"Chemlight_red", 3},
			{"Chemlight_yellow", 3},
			{"Chemlight_blue", 3}
		};
	};
	
	class Ghosthawk: VehicleDefault
	{
		backpackCargo[] = {
			{"STAF_tf_anarc210_Sage", 1}
		};
		
		itemCargo[] = {
			{"NVGoggles", 2},
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
			{"ACE_DefusalKit", 1},
			{"ACE_Tripod", 1},
			{"ACE_bodyBag", 5},
			{"ACE_CableTie", 5},
			{"ACE_IR_Strobe_Item", 10},
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
			{"APERSBoundingMine_Range_Mag", 5},
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
			{"DemoCharge_Remote_Mag", 2},
			{"Chemlight_green", 5},
			{"Chemlight_red", 5},
			{"Chemlight_yellow", 5},
			{"Chemlight_blue", 5}
		};
		
		weaponCargo[] = {
			{"Binocular", 1},
			{"launch_NLAW_F", 3},
			{"IP_arifle_MX_Sage_F", 2},
			{"IP_arifle_MX_GL_Sage_F", 1},
			{"IP_arifle_MX_SW_Sage_F", 1}
		};
	};
};