// Give player radio at start
player linkItem "tf_rf7800str";
if (leader(group player) == player) then {
	player addItem "tf_anprc152";
};

// If he drops the radio, re-add it.
player addEventHandler ["Put", {
    params [
        "_unit",
        "_container",
        "_items"
    ];

	// Check for Rifleman Radio.
    if ((toLower _items) find "tf_rf7800str" >= 0) then {
        // Re add it.
        _unit linkItem "tf_rf7800str";
		
        // Remove dropped radio.
        _itemCargo = getItemCargo _container;
        clearItemCargoGlobal _container;
        {
            if ((toLower _x) find "tf_rf7800str" < 0) then {
                _container addItemCargoGlobal [_x, ((_itemCargo select 1) select _forEachIndex)];
            };
        } forEach (_itemCargo select 0);
    };
	
	// Check for SL radio.
    if ((leader(group _unit) == _unit) && {(toLower _items) find "tf_anprc152" >= 0}) then {
        // Re add it.
		if ({(toLower _x) find "tf_anprc152" >= 0} count (items player) isEqualTo 0) then {
			_unit addItem "tf_anprc152";
		};
		
        // Remove dropped radio.
        _itemCargo = getItemCargo _container;
        clearItemCargoGlobal _container;
        {
            if ((toLower _x) find "tf_anprc152" < 0) then {
                _container addItemCargoGlobal [_x, ((_itemCargo select 1) select _forEachIndex)];
            };
        } forEach (_itemCargo select 0);
    };
}];

// If he uses arsenal and does not have radio when exiting arsenal, re-add it.
[missionNamespace, "arsenalClosed", {
    if ({(toLower _x) find "tf_rf7800str" >= 0} count (assignedItems player) isEqualTo 0) then {
        player linkItem "tf_rf7800str";
    };
	
	if ((leader(group player) == player) && {{(toLower _x) find "tf_anprc152" >= 0} count (items player) isEqualTo 0}) then {
        player addItem "tf_anprc152";
    };
}] call BIS_fnc_addScriptedEventHandler;