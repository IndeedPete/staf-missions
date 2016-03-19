params [
	["_obj", player, [ObjNull]],
	["_isBox", false, [true]],
	"_class",
	"_template"
];

if (_isBox) exitWith {
	_obj addAction ["<img size='1' shadow='1' image='\a3\ui_f\data\igui\cfg\Actions\reammo_ca.paa'/> Take Default Loadout", {[(_this select 1), false] call IP_fnc_defaultLoadout}, [], 1.5, false, true, "", "(_this distance _target < 8)"];
};

_class = typeOf _obj;
_template = switch (_class) do {
	case "IP_B_soldier_AR_F_EFAltis": {"AR_Altis"};
	case "IP_B_arecon_AR_EFAltis_F": {"AR_Altis"};
	case "IP_B_HeavyGunner_F_EFAltis": {"HG_Altis"};
	case "IP_B_medic_F_EFAltis": {"Medic_Altis"};
	case "IP_B_arecon_medic_EFAltis_F": {"Medic_Altis"};
	case "IP_B_Soldier_GL_F_EFAltis": {"GL_Altis"};
	case "IP_B_recon_JTAC_F_EFAltis": {"FAC_Altis"};
	case "B_G_officer_F": {"Covert_Officer"};
	case "B_G_Sharpshooter_F": {"Covert_Marksman"};
	case "B_G_Soldier_exp_F": {"Covert_Exp"};
	case "B_G_Soldier_AR_F": {"Covert_AR"};
	case "IP_B_officer_light_F_EFAltis": {"Officer_Light_Altis"};
	case "IP_B_officer_F_EFAltis": {"Officer_Altis"};
	default {""};
};

if (_template != "") then {
	_obj execVM ("cfg\loadouts\" + _template + ".sqf");
} else {
	systemChat "There is no default loadout defined for this class. Why don't you create one and send it to IndeedPete?";
};