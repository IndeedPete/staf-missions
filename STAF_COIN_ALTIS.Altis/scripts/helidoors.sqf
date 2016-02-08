///////////////////////////////////////////////////////////////////////////////////////////////////
//  Simple Heli Door Script v1.03 by BangaBob                                                    //
//  Execute from any GhostHawk init field:                                                       //
//  nul = [this] execVM "heliDoors.sqf";                                              //
//                                                                                               //
//  Inspired by Heli Door Open Script by Delta 1 Actual                                          //
//  http://www.armaholic.com/page.php?id=21969                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////

private ["_veh","_alt","_speed"];

_veh = _this select 0;
//if (!isServer || !(_veh isKindOf "Heli_Transport_01_base_F")) exitWith {};

while {alive _veh} do {
  sleep 0.5;
  _alt = getPos _veh select 2;
  _speed = (sqrt ((velocity _veh select 0)^2 + (velocity _veh select 1)^2 + (velocity _veh select 2)^2));

  //Ghosthawk
  if (_veh isKindOf "Heli_Transport_01_base_F") then {
    if ((_alt < 20) && (_speed < 4)) then {
      _veh animateDoor ['door_R',1];
      _veh animateDoor ['door_L',1];
    } else {
      _veh animateDoor ['door_R',0];
      _veh animateDoor ['door_L',0];
    };
  };

  //Littlebird
  if (_veh isKindOf "Heli_Light_01_Base_F") then {
    if (!isEngineOn _veh) then {
      _veh animateDoor ['DoorL_Front_Open',1];
      _veh animateDoor ['DoorR_Front_Open',1];
      _veh animateDoor ['DoorL_Back_Open',1];
      _veh animateDoor ['DoorR_Back_Open',1];
    } else {
      _veh animateDoor ['DoorL_Front_Open',0];
      _veh animateDoor ['DoorR_Front_Open',0];
      _veh animateDoor ['DoorL_Back_Open',0];
      _veh animateDoor ['DoorR_Back_Open',0];
    };
  };

  //Huron
  if (_veh isKindOf "Heli_Transport_03_Base_F") then {
    if ((_alt < 10) && (_speed < 4)) then {
      _veh animateDoor ['Door_rear_source',1];
    } else {
      _veh animateDoor ['Door_rear_source',0];
    };
    if (!isEngineOn _veh) then {
      _veh animateDoor ['Door_R_source',1];
      _veh animateDoor ['Door_L_source',1];
    } else {
      _veh animateDoor ['Door_R_source',0];
      _veh animateDoor ['Door_L_source',0];
    };
  };

  //Merlin
  if (_veh isKindOf "Heli_Transport_02_Base_F") then {
    if ((_alt < 10) && (_speed < 4)) then {
      _veh animateDoor ['CargoRamp_Open',1];
    } else {
      _veh animateDoor ['CargoRamp_Open',0];
    };
        if (!isEngineOn _veh) then {
      _veh animateDoor ['Door_Back_L',1];
      _veh animateDoor ['Door_Back_R',1];
    } else {
      _veh animateDoor ['Door_Back_L',0];
      _veh animateDoor ['Door_Back_R',0];
    };
  };

};