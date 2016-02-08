params [
    ["_unit", player, [ObjNull]],
    "_uid",
    "_playerCountryMap",
    "_insignia"
];

_uid = getplayerUID player;
_playerCountryMap = [
    ["EF_Germany", [ // Moony, Darkthreader, Goat, StrokeUnit, IndeedPete
        "76561197971387924",
        "76561198060495374",
        "76561197970346668",
        "76561198053702076",
        "76561198018904665"
    ]],
    ["EF_Norway", [ // Linga, M.Hansen, Killerfish, Superthrive, Mahonas, Crazy
        "76561197983915200",
        "76561198063419944",
        "76561197980877311",
        "76561197995778285",
        "76561198040823754",
        "76561197985166754"
    ]],
    ["EF_Denmark", [ // MichelsenDK, Hazard, Pomfritmand, Dcburnt
        "76561197969927617",
        "76561197977967993",
        "76561198082578802",
        "76561198054466430"
    ]],
    ["EF_Sweden", [ // Tix
        "76561197987381026"
    ]],
    ["EF_Netherlands", [ // Jeromer, Lust Cena
        "76561198071715471",
        "76561198042354590"
    ]],
    ["EF_England", [ // Rogers
        "76561198035599627"
    ]],
    ["EF_Israel", [ // shay_gman
        "76561198007956840"
    ]],
    ["EF_Belgium", [ // Archangel
        "76561198021316955"
    ]],
    ["STAF_India", [ // Lipz
        "76561198061731313"
    ]],
    ["STAF_USA", [ // sniperclub01, Synyster, Mike
        "76561198067416378",
        "76561198134534504",
        "7656119818943845"
    ]]
];

while {alive _unit} do {
    _insignia = "";

    waitUntil {
        sleep 5;

        if ((getNumber(configFile >> "CfgVehicles" >> (typeOf player) >> "attendant")) == 1) then {
            _insignia = "STAF_Medic";
        } else {
            {
                if (_uid in (_x select 1)) exitWith {
                    _insignia = (_x select 0);
                };
            } forEach _playerCountryMap;
        };

       ((player call BIS_fnc_getUnitInsignia != _insignia) OR !(alive _unit))
    };

    [player, _insignia] call BIS_fnc_setUnitInsignia;
};