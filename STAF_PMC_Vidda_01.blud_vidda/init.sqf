//call compile preprocessFile "staticData.sqf";

/*if (isDedicated) then {
    _realdate = "real_date" callExtension "";
		_setdate = setDate [2034, _realdate select 1, _realdate select 2]
};*/

//_________________________________________Mission Settings_________________________________________//

//Disable Saving and Auto Saving
enableSaving [false, false];

//Mute Orders and Reports
enableSentences false;

//_________________________________________Scripts_________________________________________//

["ABU_Helmet1","ABU_Helmet2","M81_Helmet1","M81_Helmet2","M90_Helmet1","M90_Helmet2","M90d_Helmet1","M90d_Helmet2","MCB_Helmet1","MCB_Helmet2","MC_Helmet1","MC_Helmet2","OGA_G_Helmet1","OGA_G_Helmet2","OGA_Helmet1","OGA_Helmet2","VSM_Mich2000_AOR1","VSM_Mich2000_M81","VSM_Mich2000_Multicam","VSM_Mich2000_MulticamTropic","VSM_Mich2000_OCP","VSM_Mich2000_OGA_OD","VSM_Mich2000_OGA","VSM_Mich2000_CamoSprayOD","VSM_Mich2000_CamoSprayTan","VSM_Mich2000_ProjectHonor","VSM_Mich2000_AOR1","VSM_OPS_aor1","VSM_OPS","VSM_Black_OPS","VSM_M81_OPS","VSM_OPS_multicam","VSM_multicamtropic_OPS","VSM_ocp_OPS","VSM_od_spray_OPS","VSM_OGA_od_OPS","VSM_OGA_OPS","VSM_ProjectHonor_OPS","VSM_tan_spray_OPS","VSM_ops_2_aor1","VSM_ops_2","VSM_Black_ops_2","VSM_M81_ops_2","VSM_ops_2_multicam","VSM_multicamtropic_ops_2","VSM_ocp_ops_2","VSM_od_spray_ops_2","VSM_OGA_od_ops_2","VSM_OGA_ops_2","VSM_ProjectHonor_ops_2","VSM_tan_spray_ops_2"] call GRAD_slingHelmet_fnc_addHelmetToWhitelist;