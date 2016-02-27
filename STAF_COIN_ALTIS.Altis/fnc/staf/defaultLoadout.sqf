private ["_class", "_template"];
_class = typeOf _this;

_template = switch (_class) do {
	case "IP_B_soldier_AR_F_EFAltis": {"AR_Altis"};
	case "IP_B_arecon_AR_EFAltis_F": {"AR_Altis"};
	case "IP_B_HeavyGunner_F_EFAltis": {"HG_Altis"};
	case "IP_B_medic_F_EFAltis": {"Medic_Altis"};
	case "IP_B_arecon_medic_EFAltis_F": {"Medic_Altis"};
	default {""};
};

if (_template != "") then {
	_this execVM ("cfg\loadouts\" + _template + ".sqf");
};