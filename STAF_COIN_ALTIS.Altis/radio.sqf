//Give player radio at start
player linkItem "tf_anprc152";

//If he drops the radio re-add it
player addEventHandler [ "Put", {
    params[
        "_unit",
        "_container",
        "_item"
    ];

    //If its a radio
    if ( toLower _item find "tf_anprc152" >= 0 ) then {
        //Re add it
        player linkItem "tf_anprc152";
        //Remove dropped radio
        _itemCargo = getItemCargo _container;
        clearItemCargoGlobal _container;
        {
            if ( toLower _x find "tf_anprc152" < 0 ) then {
                _container addItemCargoGlobal [ _x, _itemCargo select 1 select _forEachIndex ];
            };
        }forEach ( _itemCargo select 0 ) ;
    };
}];

//If he uses arsenal and does not have radio when exiting arsenal re-add it
[ missionNamespace, "arsenalClosed", {
    if ( { toLower _x find "tf_anprc152" >= 0 } count ( assignedItems player ) isEqualTo 0 ) then {
        player linkItem "tf_anprc152";
    };
} ] call BIS_fnc_addScriptedEventHandler;